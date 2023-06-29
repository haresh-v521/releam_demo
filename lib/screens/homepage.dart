import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/components/todo_list.dart';
import 'package:flutter_todo/components/create_item.dart';
import 'package:flutter_todo/realm/realm_services.dart';

import '../realm/app_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> logOut(BuildContext context, RealmServices realmServices) async {
    final appServices = Provider.of<AppServices>(context, listen: false);
    appServices.logOut();
    await realmServices.close();
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<RealmServices?>(context, listen: false) == null
        ? Container()
        : Scaffold(
      appBar: AppBar(
        title: const Text("To do list"),
        centerTitle: true,
      ),
      // appBar: AppBar(
      //   title: const Text('Realm Flutter To-Do'),
      //   automaticallyImplyLeading: false,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(realmServices.offlineModeOn
      //           ? Icons.wifi_off_rounded
      //           : Icons.wifi_rounded),
      //       tooltip: 'Offline mode',
      //       onPressed: () async => await realmServices.sessionSwitch(),
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       tooltip: 'Log out',
      //       onPressed: () async => await logOut(context, realmServices),
      //     ),
      //   ],
      // ),
      body: const TodoList(),
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            // floatingActionButton: const CreateItemAction(),
    );
  }
}
