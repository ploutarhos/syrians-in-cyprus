import '../database.dart';

class ListingsTable extends SupabaseTable<ListingsRow> {
  @override
  String get tableName => 'listings';

  @override
  ListingsRow createRow(Map<String, dynamic> data) => ListingsRow(data);
}

class ListingsRow extends SupabaseDataRow {
  ListingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListingsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get listingType => getField<String>('listing_type')!;
  set listingType(String value) => setField<String>('listing_type', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  String? get district => getField<String>('district');
  set district(String? value) => setField<String>('district', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  String? get contactPhone => getField<String>('contact_phone');
  set contactPhone(String? value) => setField<String>('contact_phone', value);

  String? get contactWhatsapp => getField<String>('contact_whatsapp');
  set contactWhatsapp(String? value) =>
      setField<String>('contact_whatsapp', value);

  String? get carMake => getField<String>('car_make');
  set carMake(String? value) => setField<String>('car_make', value);

  String? get carModel => getField<String>('car_model');
  set carModel(String? value) => setField<String>('car_model', value);

  int? get carYear => getField<int>('car_year');
  set carYear(int? value) => setField<int>('car_year', value);

  String? get housingKind => getField<String>('housing_kind');
  set housingKind(String? value) => setField<String>('housing_kind', value);

  int? get bedrooms => getField<int>('bedrooms');
  set bedrooms(int? value) => setField<int>('bedrooms', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get listingIntent => getField<String>('listing_intent')!;
  set listingIntent(String value) => setField<String>('listing_intent', value);

  String? get area => getField<String>('area');
  set area(String? value) => setField<String>('area', value);

  String? get itemCategory => getField<String>('item_category');
  set itemCategory(String? value) => setField<String>('item_category', value);

  String? get imageUrl1 => getField<String>('image_url_1');
  set imageUrl1(String? value) => setField<String>('image_url_1', value);

  String? get imageUrl2 => getField<String>('image_url_2');
  set imageUrl2(String? value) => setField<String>('image_url_2', value);

  String? get imageUrl3 => getField<String>('image_url_3');
  set imageUrl3(String? value) => setField<String>('image_url_3', value);
}
