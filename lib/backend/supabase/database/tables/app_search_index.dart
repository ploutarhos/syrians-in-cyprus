import '../database.dart';

class AppSearchIndexTable extends SupabaseTable<AppSearchIndexRow> {
  @override
  String get tableName => 'app_search_index';

  @override
  AppSearchIndexRow createRow(Map<String, dynamic> data) =>
      AppSearchIndexRow(data);
}

class AppSearchIndexRow extends SupabaseDataRow {
  AppSearchIndexRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppSearchIndexTable();

  String? get resultKey => getField<String>('result_key');
  set resultKey(String? value) => setField<String>('result_key', value);

  String? get resultType => getField<String>('result_type');
  set resultType(String? value) => setField<String>('result_type', value);

  String? get recordId => getField<String>('record_id');
  set recordId(String? value) => setField<String>('record_id', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  String? get titleEn => getField<String>('title_en');
  set titleEn(String? value) => setField<String>('title_en', value);

  String? get titleAr => getField<String>('title_ar');
  set titleAr(String? value) => setField<String>('title_ar', value);

  String? get subtitleEn => getField<String>('subtitle_en');
  set subtitleEn(String? value) => setField<String>('subtitle_en', value);

  String? get subtitleAr => getField<String>('subtitle_ar');
  set subtitleAr(String? value) => setField<String>('subtitle_ar', value);

  String? get categorySlug => getField<String>('category_slug');
  set categorySlug(String? value) => setField<String>('category_slug', value);

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String? get district => getField<String>('district');
  set district(String? value) => setField<String>('district', value);

  String? get externalUrl => getField<String>('external_url');
  set externalUrl(String? value) => setField<String>('external_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get searchText => getField<String>('search_text');
  set searchText(String? value) => setField<String>('search_text', value);

  String? get typeLabelEn => getField<String>('type_label_en');
  set typeLabelEn(String? value) => setField<String>('type_label_en', value);

  String? get typeLabelAr => getField<String>('type_label_ar');
  set typeLabelAr(String? value) => setField<String>('type_label_ar', value);

  String? get districtLabelEn => getField<String>('district_label_en');
  set districtLabelEn(String? value) =>
      setField<String>('district_label_en', value);

  String? get districtLabelAr => getField<String>('district_label_ar');
  set districtLabelAr(String? value) =>
      setField<String>('district_label_ar', value);
}
