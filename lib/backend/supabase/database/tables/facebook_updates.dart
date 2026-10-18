import '../database.dart';

class FacebookUpdatesTable extends SupabaseTable<FacebookUpdatesRow> {
  @override
  String get tableName => 'facebook_updates';

  @override
  FacebookUpdatesRow createRow(Map<String, dynamic> data) =>
      FacebookUpdatesRow(data);
}

class FacebookUpdatesRow extends SupabaseDataRow {
  FacebookUpdatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FacebookUpdatesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get facebookPostId => getField<String>('facebook_post_id')!;
  set facebookPostId(String value) =>
      setField<String>('facebook_post_id', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String get permalinkUrl => getField<String>('permalink_url')!;
  set permalinkUrl(String value) => setField<String>('permalink_url', value);

  DateTime get facebookCreatedTime =>
      getField<DateTime>('facebook_created_time')!;
  set facebookCreatedTime(DateTime value) =>
      setField<DateTime>('facebook_created_time', value);

  bool? get isPublished => getField<bool>('is_published');
  set isPublished(bool? value) => setField<bool>('is_published', value);

  DateTime? get syncedAt => getField<DateTime>('synced_at');
  set syncedAt(DateTime? value) => setField<DateTime>('synced_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
