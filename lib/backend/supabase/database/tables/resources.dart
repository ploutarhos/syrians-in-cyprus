import '../database.dart';

class ResourcesTable extends SupabaseTable<ResourcesRow> {
  @override
  String get tableName => 'resources';

  @override
  ResourcesRow createRow(Map<String, dynamic> data) => ResourcesRow(data);
}

class ResourcesRow extends SupabaseDataRow {
  ResourcesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResourcesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String get slug => getField<String>('slug')!;
  set slug(String value) => setField<String>('slug', value);

  String get titleEn => getField<String>('title_en')!;
  set titleEn(String value) => setField<String>('title_en', value);

  String get titleAr => getField<String>('title_ar')!;
  set titleAr(String value) => setField<String>('title_ar', value);

  String? get bodyEn => getField<String>('body_en');
  set bodyEn(String? value) => setField<String>('body_en', value);

  String? get bodyAr => getField<String>('body_ar');
  set bodyAr(String? value) => setField<String>('body_ar', value);

  String? get resourceType => getField<String>('resource_type');
  set resourceType(String? value) => setField<String>('resource_type', value);

  String? get externalUrl => getField<String>('external_url');
  set externalUrl(String? value) => setField<String>('external_url', value);

  String? get fileUrl => getField<String>('file_url');
  set fileUrl(String? value) => setField<String>('file_url', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get isPublished => getField<bool>('is_published');
  set isPublished(bool? value) => setField<bool>('is_published', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get summaryEn => getField<String>('summary_en');
  set summaryEn(String? value) => setField<String>('summary_en', value);

  String? get summaryAr => getField<String>('summary_ar');
  set summaryAr(String? value) => setField<String>('summary_ar', value);

  String? get previewImageUrl => getField<String>('preview_image_url');
  set previewImageUrl(String? value) =>
      setField<String>('preview_image_url', value);

  String? get downloadUrl => getField<String>('download_url');
  set downloadUrl(String? value) => setField<String>('download_url', value);

  String? get fileUrlEn => getField<String>('file_url_en');
  set fileUrlEn(String? value) => setField<String>('file_url_en', value);

  String? get fileUrlAr => getField<String>('file_url_ar');
  set fileUrlAr(String? value) => setField<String>('file_url_ar', value);

  String? get officialSourceUrl => getField<String>('official_source_url');
  set officialSourceUrl(String? value) =>
      setField<String>('official_source_url', value);
}
