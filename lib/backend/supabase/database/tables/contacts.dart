import '../database.dart';

class ContactsTable extends SupabaseTable<ContactsRow> {
  @override
  String get tableName => 'contacts';

  @override
  ContactsRow createRow(Map<String, dynamic> data) => ContactsRow(data);
}

class ContactsRow extends SupabaseDataRow {
  ContactsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContactsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  String? get nameEn => getField<String>('name_en');
  set nameEn(String? value) => setField<String>('name_en', value);

  String? get nameAr => getField<String>('name_ar');
  set nameAr(String? value) => setField<String>('name_ar', value);

  String? get contactType => getField<String>('contact_type');
  set contactType(String? value) => setField<String>('contact_type', value);

  String? get specialtyEn => getField<String>('specialty_en');
  set specialtyEn(String? value) => setField<String>('specialty_en', value);

  String? get specialtyAr => getField<String>('specialty_ar');
  set specialtyAr(String? value) => setField<String>('specialty_ar', value);

  String? get district => getField<String>('district');
  set district(String? value) => setField<String>('district', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get whatsapp => getField<String>('whatsapp');
  set whatsapp(String? value) => setField<String>('whatsapp', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get websiteUrl => getField<String>('website_url');
  set websiteUrl(String? value) => setField<String>('website_url', value);

  String? get mapsUrl => getField<String>('maps_url');
  set mapsUrl(String? value) => setField<String>('maps_url', value);

  String? get notesEn => getField<String>('notes_en');
  set notesEn(String? value) => setField<String>('notes_en', value);

  String? get notesAr => getField<String>('notes_ar');
  set notesAr(String? value) => setField<String>('notes_ar', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String? get facebookUrl => getField<String>('facebook_url');
  set facebookUrl(String? value) => setField<String>('facebook_url', value);
}
