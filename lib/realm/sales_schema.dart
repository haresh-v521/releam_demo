import 'package:realm/realm.dart';
part 'sales_schema.g.dart';

// NOTE: These Realm models are private and therefore should be copied into the same .dart file.

@RealmModel()
@MapTo('sales')
class _Sale {
  @PrimaryKey()
  @MapTo('_id')
  ObjectId? id;

  bool? couponUsed;

  _SaleCustomer? customer;

  late List<_SaleItems> items;

  String? purchaseMethod;

  DateTime? saleDate;

  String? storeLocation;
}



// NOTE: These Realm models are private and therefore should be copied into the same .dart file.

@RealmModel(ObjectType.embeddedObject)
@MapTo('customer')
class _SaleCustomer {
  int? age;

  String? email;

  String? gender;

  int? satisfaction;
}


// NOTE: These Realm models are private and therefore should be copied into the same .dart file.

@RealmModel(ObjectType.embeddedObject)
@MapTo('items')
class _SaleItems {
  String? name;

  double? price;

  int? quantity;

  late List<String> tags;
}

