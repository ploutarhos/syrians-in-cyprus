import '../database.dart';

class ListingImagesTable extends SupabaseTable<ListingImagesRow> {
  @override
  String get tableName => 'listing_images';

  @override
  ListingImagesRow createRow(Map<String, dynamic> data) =>
      ListingImagesRow(data);
}

class ListingImagesRow extends SupabaseDataRow {
  ListingImagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListingImagesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get listingId => getField<String>('listing_id')!;
  set listingId(String value) => setField<String>('listing_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get storagePath => getField<String>('storage_path')!;
  set storagePath(String value) => setField<String>('storage_path', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
