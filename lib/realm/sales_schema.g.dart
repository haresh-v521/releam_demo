// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Sale extends _Sale with RealmEntity, RealmObjectBase, RealmObject {
  Sale(
    ObjectId? id, {
    bool? couponUsed,
    SaleCustomer? customer,
    String? purchaseMethod,
    DateTime? saleDate,
    String? storeLocation,
    Iterable<SaleItems> items = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'couponUsed', couponUsed);
    RealmObjectBase.set(this, 'customer', customer);
    RealmObjectBase.set(this, 'purchaseMethod', purchaseMethod);
    RealmObjectBase.set(this, 'saleDate', saleDate);
    RealmObjectBase.set(this, 'storeLocation', storeLocation);
    RealmObjectBase.set<RealmList<SaleItems>>(
        this, 'items', RealmList<SaleItems>(items));
  }

  Sale._();

  @override
  ObjectId? get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId?;
  @override
  set id(ObjectId? value) => RealmObjectBase.set(this, '_id', value);

  @override
  bool? get couponUsed =>
      RealmObjectBase.get<bool>(this, 'couponUsed') as bool?;
  @override
  set couponUsed(bool? value) => RealmObjectBase.set(this, 'couponUsed', value);

  @override
  SaleCustomer? get customer =>
      RealmObjectBase.get<SaleCustomer>(this, 'customer') as SaleCustomer?;
  @override
  set customer(covariant SaleCustomer? value) =>
      RealmObjectBase.set(this, 'customer', value);

  @override
  RealmList<SaleItems> get items =>
      RealmObjectBase.get<SaleItems>(this, 'items') as RealmList<SaleItems>;
  @override
  set items(covariant RealmList<SaleItems> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get purchaseMethod =>
      RealmObjectBase.get<String>(this, 'purchaseMethod') as String?;
  @override
  set purchaseMethod(String? value) =>
      RealmObjectBase.set(this, 'purchaseMethod', value);

  @override
  DateTime? get saleDate =>
      RealmObjectBase.get<DateTime>(this, 'saleDate') as DateTime?;
  @override
  set saleDate(DateTime? value) => RealmObjectBase.set(this, 'saleDate', value);

  @override
  String? get storeLocation =>
      RealmObjectBase.get<String>(this, 'storeLocation') as String?;
  @override
  set storeLocation(String? value) =>
      RealmObjectBase.set(this, 'storeLocation', value);

  @override
  Stream<RealmObjectChanges<Sale>> get changes =>
      RealmObjectBase.getChanges<Sale>(this);

  @override
  Sale freeze() => RealmObjectBase.freezeObject<Sale>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Sale._);
    return const SchemaObject(ObjectType.realmObject, Sale, 'sale', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', optional: true, primaryKey: true),
      SchemaProperty('couponUsed', RealmPropertyType.bool, optional: true),
      SchemaProperty('customer', RealmPropertyType.object,
          optional: true, linkTarget: 'sale_customer'),
      SchemaProperty('items', RealmPropertyType.object,
          linkTarget: 'sale_items', collectionType: RealmCollectionType.list),
      SchemaProperty('purchaseMethod', RealmPropertyType.string,
          optional: true),
      SchemaProperty('saleDate', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('storeLocation', RealmPropertyType.string, optional: true),
    ]);
  }
}

class SaleCustomer extends _SaleCustomer
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  SaleCustomer({
    int? age,
    String? email,
    String? gender,
    int? satisfaction,
  }) {
    RealmObjectBase.set(this, 'age', age);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'gender', gender);
    RealmObjectBase.set(this, 'satisfaction', satisfaction);
  }

  SaleCustomer._();

  @override
  int? get age => RealmObjectBase.get<int>(this, 'age') as int?;
  @override
  set age(int? value) => RealmObjectBase.set(this, 'age', value);

  @override
  String? get email => RealmObjectBase.get<String>(this, 'email') as String?;
  @override
  set email(String? value) => RealmObjectBase.set(this, 'email', value);

  @override
  String? get gender => RealmObjectBase.get<String>(this, 'gender') as String?;
  @override
  set gender(String? value) => RealmObjectBase.set(this, 'gender', value);

  @override
  int? get satisfaction =>
      RealmObjectBase.get<int>(this, 'satisfaction') as int?;
  @override
  set satisfaction(int? value) =>
      RealmObjectBase.set(this, 'satisfaction', value);

  @override
  Stream<RealmObjectChanges<SaleCustomer>> get changes =>
      RealmObjectBase.getChanges<SaleCustomer>(this);

  @override
  SaleCustomer freeze() => RealmObjectBase.freezeObject<SaleCustomer>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SaleCustomer._);
    return const SchemaObject(
        ObjectType.embeddedObject, SaleCustomer, 'sale_customer', [
      SchemaProperty('age', RealmPropertyType.int, optional: true),
      SchemaProperty('email', RealmPropertyType.string, optional: true),
      SchemaProperty('gender', RealmPropertyType.string, optional: true),
      SchemaProperty('satisfaction', RealmPropertyType.int, optional: true),
    ]);
  }
}

class SaleItems extends _SaleItems
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  SaleItems({
    String? name,
    double? price,
    int? quantity,
    Iterable<String> tags = const [],
  }) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
  }

  SaleItems._();

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  double? get price => RealmObjectBase.get<double>(this, 'price') as double?;
  @override
  set price(double? value) => RealmObjectBase.set(this, 'price', value);

  @override
  int? get quantity => RealmObjectBase.get<int>(this, 'quantity') as int?;
  @override
  set quantity(int? value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  RealmList<String> get tags =>
      RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
  @override
  set tags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<SaleItems>> get changes =>
      RealmObjectBase.getChanges<SaleItems>(this);

  @override
  SaleItems freeze() => RealmObjectBase.freezeObject<SaleItems>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SaleItems._);
    return const SchemaObject(
        ObjectType.embeddedObject, SaleItems, 'sale_items', [
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('price', RealmPropertyType.double, optional: true),
      SchemaProperty('quantity', RealmPropertyType.int, optional: true),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}
