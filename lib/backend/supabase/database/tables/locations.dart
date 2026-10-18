import '../database.dart';

class LocationsTable extends SupabaseTable<LocationsRow> {
  @override
  String get tableName => 'locations';

  @override
  LocationsRow createRow(Map<String, dynamic> data) => LocationsRow(data);
}

class LocationsRow extends SupabaseDataRow {
  LocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get slug => getField<String>('slug')!;
  set slug(String value) => setField<String>('slug', value);

  String get nameEn => getField<String>('name_en')!;
  set nameEn(String value) => setField<String>('name_en', value);

  String get nameAr => getField<String>('name_ar')!;
  set nameAr(String value) => setField<String>('name_ar', value);

  String get district => getField<String>('district')!;
  set district(String value) => setField<String>('district', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get googleMapsUrl => getField<String>('google_maps_url')!;
  set googleMapsUrl(String value) => setField<String>('google_maps_url', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String get locationTypeEn => getField<String>('location_type_en')!;
  set locationTypeEn(String value) =>
      setField<String>('location_type_en', value);

  String get locationTypeAr => getField<String>('location_type_ar')!;
  set locationTypeAr(String value) =>
      setField<String>('location_type_ar', value);
}
