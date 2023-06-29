import 'package:flutter_todo/realm/schemas.dart';
import 'package:realm/realm.dart';
import 'package:flutter/material.dart';

import 'new_schema.dart';
import 'sales_schema.dart';

class RealmServices with ChangeNotifier {
  static const String queryAllName = "getAllItemsSubscription";
  static const String queryMyItemsName = "getMyItemsSubscription";

  bool showAll = false;
  bool offlineModeOn = false;
  bool isWaiting = false;
  late Realm realm;
  User? currentUser;
  App app;

  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      realm = Realm(Configuration.flexibleSync(currentUser!, [Sale.schema,SaleCustomer.schema,SaleItems.schema]));
      showAll = (realm.subscriptions.findByName(queryAllName) != null);
      if (realm.subscriptions.isEmpty) {
        updateSubscriptions();
      }
    }
  }

  Future<void> updateSubscriptions() async {
    realm.subscriptions.update((mutableSubscriptions) {

      final data = realm.all<Sale>();
      if (showAll) {
        mutableSubscriptions.add(realm.all<Sale>(), name: queryAllName);
      } else {

          mutableSubscriptions.add(
              realm.query<Sale>(r"storeLocation" ,["true"]),
              name: queryMyItemsName);

      }
    });
    await realm.subscriptions.waitForSynchronization();
  }

  Future<void> sessionSwitch() async {
    offlineModeOn = !offlineModeOn;
    if (offlineModeOn) {
      realm.syncSession.pause();
    } else {
      try {
        isWaiting = true;
        notifyListeners();
        realm.syncSession.resume();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  Future<void> switchSubscription(bool value) async {
    showAll = value;
    if (!offlineModeOn) {
      try {
        isWaiting = true;
        notifyListeners();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  // void createItem(String summary, bool isComplete) {
  //   final newItem =
  //       Item(ObjectId(), summary, currentUser!.id, isComplete: isComplete);
  //   realm.write<Item>(() => realm.add<Item>(newItem));
  //   notifyListeners();
  // }

  // void deleteItem(Item item) {
  //   realm.write(() => realm.delete(item));
  //   notifyListeners();
  // }

  // Future<void> updateItem(Item item,
  //     {String? summary, bool? isComplete}) async {
  //   realm.write(() {
  //     if (summary != null) {
  //       item.summary = summary;
  //     }
  //     if (isComplete != null) {
  //       item.isComplete = isComplete;
  //     }
  //   });
  //   notifyListeners();
  // }

  Future<void> close() async {
    if (currentUser != null) {
      await currentUser?.logOut();
      currentUser = null;
    }
    realm.close();
  }

  @override
  void dispose() {
    realm.close();
    super.dispose();
  }
}
