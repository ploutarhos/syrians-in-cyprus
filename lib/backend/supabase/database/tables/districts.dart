import '../database.dart';

class DistrictsTable extends SupabaseTable<DistrictsRow> {
  @override
  String get tableName => 'districts';

  @override
  DistrictsRow createRow(Map<String, dynamic> data) => DistrictsRow(data);
}

class DistrictsRow extends SupabaseDataRow {
  DistrictsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DistrictsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get slug => getField<String>('slug')!;
  set slug(String value) => setField<String>('slug', value);

  String get nameEn => getField<String>('name_en')!;
  set nameEn(String value) => setField<String>('name_en', value);

  String get nameAr => getField<String>('name_ar')!;
  set nameAr(String value) => setField<String>('name_ar', value);

  String get imageUrl => getField<String>('image_url')!;
  set imageUrl(String value) => setField<String>('image_url', value);

  int get sortOrder => getField<int>('sort_order')!;
  set sortOrder(int value) => setField<int>('sort_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
