// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'package:realm/realm.dart';
//
// part 'new_schema.g.dart';
//
// @RealmModel()
// class _Customer {
//   late String gender;
//   late int age;
//   late String email;
//   late int satisfaction;
// }
//
// @RealmModel()
// class $Price {
//   late String numberDecimal;
// }
//
// @RealmModel(ObjectType.realmObject)
// @MapTo('sale')
// class $Welcome {
//   @MapTo('_id')
//   @PrimaryKey()
//   late ObjectId? id;
//   late DateTime saleDate;
//   @MapTo('items')
//    late List<_Item> items;
//   late String storeLocation;
//   @MapTo('customer')
//   _Customer? customer;
//   late bool couponUsed;
//   late String purchaseMethod;
// }
//
// @RealmModel()
// class $SaleDate {
//   late DateTime date;
// }
//
//
// @RealmModel()
// class $Id {
//   late String id;
// }
//
// @RealmModel()
// class _Item {
//   late String name;
//   late List<String> tags;
//   $Price? price;
//   late int quantity;
// }
//
