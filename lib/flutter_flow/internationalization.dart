import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? arText = '',
    String? enText = '',
  }) =>
      [arText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // CategoryPage
  {
    'mk63vlwj': {
      'ar': 'Home',
      'en': '',
    },
  },
  // ResourcePage
  {
    'mw9dt5ne': {
      'ar': 'عرض المستند',
      'en': 'View Document',
    },
    'jx6j17yz': {
      'ar': 'تحميل المستند',
      'en': 'Download Document',
    },
    'c28q4i0h': {
      'ar': 'فتح المصدر الرسمي',
      'en': 'Open Official Source',
    },
    'w8fsoesm': {
      'ar': 'Home',
      'en': '',
    },
  },
  // DistrictPage
  {
    'gxjxxu6x': {
      'ar': 'اختر منطقتك',
      'en': 'Choose your district',
    },
    'wumhzr6y': {
      'ar': 'المواقع المهمة',
      'en': 'Important Locations',
    },
    'jqwlolcp': {
      'ar': 'المواقع المهمة',
      'en': 'Useful Contacts',
    },
    'jdi8dh8m': {
      'ar': 'Home',
      'en': '',
    },
  },
  // LocationsPage
  {
    'hp9p3s2n': {
      'ar': 'المواقع',
      'en': 'Locations',
    },
    'ts0u7t1b': {
      'ar': 'المواقع المهمة',
      'en': 'Important Locations',
    },
    '4042o8bj': {
      'ar': 'المواقع المهمة',
      'en': 'Useful Contacts',
    },
    'pmi5rpdo': {
      'ar': 'Home',
      'en': '',
    },
  },
  // UsefulContactsPage
  {
    'yjl66ci8': {
      'ar':
          'آخر تحقق: 3 أيلول 2026. قد تتغير بيانات الاتصال، لذلك يُفضّل الاتصال قبل التوجه إلى المكان.',
      'en':
          'Last verified: 3 September 2026. Contact details may change; call before travelling.',
    },
    'yiadbog4': {
      'ar': 'كل قبرص',
      'en': 'All Cyprus',
    },
    'xls6an9x': {
      'ar': 'على مستوى قبرص',
      'en': 'Nationwide',
    },
    'n0jkpoda': {
      'ar': 'نيقوسيا',
      'en': 'Nicosia',
    },
    'x830mh0v': {
      'ar': 'ليماسول',
      'en': 'Limassol',
    },
    'q6ksahd2': {
      'ar': 'لارنكا',
      'en': 'Larnaca',
    },
    's7356efu': {
      'ar': 'بافوس',
      'en': 'Paphos',
    },
    'e8g56zms': {
      'ar': 'فاماغوستا',
      'en': 'Ammochostos',
    },
    '70d1ue4w': {
      'ar': 'الكل',
      'en': 'All',
    },
    'labkj1rb': {
      'ar': 'الأطباء',
      'en': 'Doctors',
    },
    '6yej3ree': {
      'ar': 'قانوني',
      'en': 'Legal',
    },
    'zhx9lau8': {
      'ar': 'اللجوء والهجرة',
      'en': 'Asylum & Migration',
    },
    'vurod91i': {
      'ar': 'العمل والتأمينات الاجتماعية',
      'en': 'Employment & Social Insurance',
    },
    'jw4s79h9': {
      'ar': 'المنظمات',
      'en': 'NGOs',
    },
    'tqukqcpx': {
      'ar': 'الطوارئ',
      'en': 'Emergency',
    },
    'p86imrl5': {
      'ar': 'المجتمع',
      'en': 'Community',
    },
    'zm7h1ipw': {
      'ar': 'أخرى',
      'en': 'Other',
    },
    '7s4pejz8': {
      'ar': 'مترجمون محلّفون',
      'en': 'Sworn Translators',
    },
    '32vnfu67': {
      'ar': 'اتصال',
      'en': 'Call',
    },
    'dor7vf24': {
      'ar': 'واتساب',
      'en': 'WhatsApp',
    },
    '2yb6q9bx': {
      'ar': 'إيميل',
      'en': 'Email',
    },
    'qxlz6pki': {
      'ar': 'الموقع',
      'en': 'Website',
    },
    'aly3oud4': {
      'ar': 'الخريطة',
      'en': 'Map',
    },
    '56ct6fh7': {
      'ar': 'جهات اتصال مفيدة',
      'en': 'Useful contacts',
    },
    'zecj4nw3': {
      'ar': 'جهات اتصال مفيدة',
      'en': 'Useful Contacts',
    },
    'xpr87amx': {
      'ar': 'Home',
      'en': '',
    },
  },
  // test
  {
    '5i5yuvt8': {
      'ar': 'Page Title',
      'en': '',
    },
    'b3h99a3m': {
      'ar': 'Home',
      'en': '',
    },
  },
  // CategoryRouterPage
  {
    'fxbubmfa': {
      'ar': 'Page Title',
      'en': 'Important Locations',
    },
    'le04vgy1': {
      'ar': 'Home',
      'en': '',
    },
  },
  // MarketplacePage
  {
    'uovkpa7r': {
      'ar': 'اختر القسم',
      'en': 'Choose a category',
    },
    'xlc681cz': {
      'ar': 'السيارات',
      'en': 'Cars',
    },
    '1xeqgyf7': {
      'ar': 'للبيع',
      'en': 'For Sale',
    },
    'id3h143h': {
      'ar': 'السكن',
      'en': 'Accommodation',
    },
    'jkqt4u7f': {
      'ar': 'سكن متوفر',
      'en': 'Available',
    },
    'crvlsdxo': {
      'ar': 'أبحث عن سكن',
      'en': 'Looking for Accommodation',
    },
    'e0x94xon': {
      'ar': 'أغراض ومعدات مستعملة',
      'en': 'Used Items & Equipment',
    },
    'rc3grcew': {
      'ar': 'للبيع',
      'en': 'For Sale',
    },
    '8tc0vwm7': {
      'ar': 'نشر إعلان',
      'en': 'Post an Ad',
    },
    'vf02m6ko': {
      'ar': 'السوق',
      'en': 'Marketplace',
    },
    'i9f16yi8': {
      'ar': 'Home',
      'en': '',
    },
  },
  // MarketplaceListingsPage
  {
    '1qhj4kp6': {
      'ar': 'انشر طلب سكن',
      'en': 'Post an Accommodation Request',
    },
    'l8kkbthy': {
      'ar': 'إعلانات',
      'en': 'Listings',
    },
    '2s5m3e6t': {
      'ar': 'Home',
      'en': '',
    },
  },
  // ListingDetailPage
  {
    'r0xghbor': {
      'ar': 'اتصال',
      'en': 'Call',
    },
    'enirxifg': {
      'ar': 'واتساب',
      'en': 'WhatApp',
    },
    'lyqheu9e': {
      'ar': 'إعلانات',
      'en': 'Listings',
    },
    'qm08ebkw': {
      'ar': 'Home',
      'en': '',
    },
  },
  // SearchPage
  {
    'jd8x7ru9': {
      'ar': '🔎 ابحث عن معلومات...',
      'en': '🔎 Search information...',
    },
    'uvgk7o6a': {
      'ar': '',
      'en': '',
    },
    '8wma1qep': {
      'ar': 'بحث',
      'en': 'Search',
    },
    '318ytb5i': {
      'ar': 'Home',
      'en': '',
    },
  },
  // ContactDetailPage
  {
    'ui90hk99': {
      'ar': 'اتصال',
      'en': 'Call',
    },
    'fkyq1042': {
      'ar': 'واتساب',
      'en': 'WhatsApp',
    },
    'k927zbxy': {
      'ar': 'إيميل',
      'en': 'Email',
    },
    'm3bdwe7z': {
      'ar': 'الموقع',
      'en': 'Website',
    },
    '2ckn2asj': {
      'ar': 'الخريطة',
      'en': 'Map',
    },
    'qmuartzc': {
      'ar': 'بيانات الاتصال',
      'en': 'Contact Details',
    },
    '5gff8718': {
      'ar': 'Page Title',
      'en': '',
    },
    'jprgc3mx': {
      'ar': 'Home',
      'en': '',
    },
  },
  // AddListingPage
  {
    'v84xj6bw': {
      'ar': 'السيارات',
      'en': 'Cars',
    },
    'ajaa09z1': {
      'ar': 'السكن',
      'en': 'Accommodation',
    },
    '90e9471u': {
      'ar': 'الأغراض والمعدات المستعملة',
      'en': 'Used Items & Equipment',
    },
    'sbpnrwhq': {
      'ar': 'ماذا تريد أن تفعل؟',
      'en': 'What do you want to do?',
    },
    'vijiyml4': {
      'ar': 'عرض',
      'en': 'Offer',
    },
    '7rq9drlq': {
      'ar': 'مطلوب',
      'en': 'Wanted',
    },
    'baxgik7l': {
      'ar': '* الحقول المطلوبة',
      'en': '* Required fields',
    },
    'lopa2gtl': {
      'ar': 'الماركة *',
      'en': 'Make *',
    },
    'e12dmxfe': {
      'ar': 'مثال: Toyota',
      'en': 'e.g. Toyota',
    },
    'ezlv5gck': {
      'ar': 'الموديل – اختياري',
      'en': 'Model - Optional',
    },
    '3yandkv3': {
      'ar': 'مثال: Corolla',
      'en': 'e.g. Corolla',
    },
    '6hcj6pc4': {
      'ar': 'سنة الصنع *',
      'en': 'Year *',
    },
    'ueucgn99': {
      'ar': 'مثال: 2018',
      'en': 'e.g. 2018',
    },
    '8pps1evj': {
      'ar': 'السعر (€)',
      'en': 'Price (€)',
    },
    'm4edi3gz': {
      'ar': 'مثال: 6500',
      'en': 'e.g. 6500',
    },
    'k4wscgxu': {
      'ar': 'المنطقة *',
      'en': 'District *',
    },
    'e52wo5lo': {
      'ar': 'Select...',
      'en': '',
    },
    'ivmca7r4': {
      'ar': 'Search...',
      'en': '',
    },
    't4xrbrt2': {
      'ar': 'نيقوسيا',
      'en': 'Nicosia',
    },
    '5nlfevht': {
      'ar': 'ليماسول',
      'en': 'Limassol',
    },
    'pkor50tc': {
      'ar': 'لارنكا',
      'en': 'Larnaca',
    },
    'phuqjl9n': {
      'ar': 'بافوس',
      'en': 'Paphos',
    },
    '8kfwfpsm': {
      'ar': 'أموخوستوس',
      'en': 'Famagusta',
    },
    'x733ames': {
      'ar': 'المنطقة الفرعية – اختياري',
      'en': 'Area - Optional',
    },
    'pi29ixw0': {
      'ar': 'مثال: ستروفولوس',
      'en': 'e.g. Strovolos',
    },
    '7h34hmko': {
      'ar': 'عنوان الإعلان – اختياري',
      'en': 'Title - Optional',
    },
    'yir3na31': {
      'ar': 'مثال: تويوتا كورولا 2018 للبيع',
      'en': 'e.g. Toyota Corolla 2018 for sale',
    },
    'lysjmdsa': {
      'ar': 'الوصف *',
      'en': 'Description *',
    },
    '4anzr5u4': {
      'ar': 'أضف حالة السيارة والمسافة المقطوعة وأي تفاصيل مهمة',
      'en': 'Add condition, mileage and important details',
    },
    'mhqnta4u': {
      'ar': 'واتساب *',
      'en': 'WhatApp *',
    },
    'pdlvqb9p': {
      'ar': 'مثال: 99123456',
      'en': 'e.g. 99123456',
    },
    '159o7nat': {
      'ar': 'يرجى إدخال ماركة السيارة',
      'en': 'Please enter the car make',
    },
    'uy5m3wl8': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ivlpft65': {
      'ar': 'مثال: Corolla is required',
      'en': '',
    },
    'n3zm47k0': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '9xp9oy9m': {
      'ar': 'يرجى إدخال سنة الصنع',
      'en': 'Please enter the year',
    },
    '1o6jpbgh': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5rpt0e58': {
      'ar': '',
      'en': '',
    },
    '1gzfv8kp': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '4smuh3ks': {
      'ar': 'مثال: ستروفولوس is required',
      'en': '',
    },
    'dbkn6x76': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'aozejm0l': {
      'ar': 'مثال: تويوتا كورولا 2018 للبيع is required',
      'en': '',
    },
    '1133yu3i': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'nhakgbus': {
      'ar': 'يرجى إضافة وصف مختصر للسيارة وأي تفاصيل مهمة.',
      'en':
          'Please add a brief description of the car and any important details.',
    },
    'fuoh2m7i': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '7rudmwsf': {
      'ar': 'يرجى إدخال رقم واتساب صحيح حتى يتمكن المهتمون من التواصل معك.',
      'en':
          'Please enter a valid WhatsApp number so interested users can contact you.',
    },
    '43ugpe3l': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'otuwt8q8': {
      'ar': '* الحقول المطلوبة',
      'en': '* Required fields',
    },
    'vzsxlx16': {
      'ar': 'نوع السكن *',
      'en': 'Type of accommodation *',
    },
    'fxg8p8lc': {
      'ar': 'Select...',
      'en': '',
    },
    'zx8d0bj4': {
      'ar': 'Search...',
      'en': '',
    },
    'rus993n1': {
      'ar': 'سكن كامل',
      'en': 'Whole accommodation',
    },
    'xfzhn3oj': {
      'ar': 'غرفة خاصة',
      'en': 'Private room',
    },
    '3k363u4y': {
      'ar': 'سرير في غرفة مشتركة',
      'en': 'Bed in shared room',
    },
    '0wc7bee4': {
      'ar': 'عدد غرف النوم  – اختياري',
      'en': 'Bedrooms - Optional',
    },
    'friaz9fy': {
      'ar': 'مثال: 2',
      'en': 'e.g. 2',
    },
    '6mdunoil': {
      'ar': 'السعر (€)',
      'en': 'Price (€)',
    },
    'fgmie84p': {
      'ar': 'مثال: 650',
      'en': 'e.g. 650',
    },
    'bzmdwq3u': {
      'ar': 'المنطقة *',
      'en': 'District *',
    },
    'yf464rv9': {
      'ar': 'Select...',
      'en': '',
    },
    'enryyt6e': {
      'ar': 'Search...',
      'en': '',
    },
    'rskiimwd': {
      'ar': 'نيقوسيا',
      'en': 'Nicosia',
    },
    '5vw2xd2t': {
      'ar': 'ليماسول',
      'en': 'Limassol',
    },
    'dfsenc6p': {
      'ar': 'لارنكا',
      'en': 'Larnaca',
    },
    '71jl73hs': {
      'ar': 'بافوس',
      'en': 'Paphos',
    },
    'mqw43jqg': {
      'ar': 'أموخوستوس',
      'en': 'Famagusta',
    },
    'qy2l9ehq': {
      'ar': 'المنطقة الفرعية – اختياري',
      'en': 'Area - Optional',
    },
    'uktywez7': {
      'ar': 'مثال: ستروفولوس',
      'en': 'e.g. Strovolos',
    },
    'in3xljfw': {
      'ar': 'عنوان الإعلان – اختياري',
      'en': 'Title - Optional',
    },
    'fuwaxak6': {
      'ar': 'مثال: غرفة متاحة في نيقوسيا',
      'en': 'e.g. Room available in Nicosia',
    },
    'lc7zebrr': {
      'ar': 'الوصف *',
      'en': 'Description *',
    },
    '66iat44g': {
      'ar': 'اكتب وصفاً للسكن والموقع والسعر والشروط وأي تفاصيل مهمة',
      'en':
          'Describe the accommodation, location, price, conditions and any important details',
    },
    'aa03ujjy': {
      'ar': 'واتساب *',
      'en': 'WhatApp *',
    },
    '03oyjb8r': {
      'ar': 'مثال: 99123456',
      'en': 'e.g. 99123456',
    },
    'qyfoq44j': {
      'ar': 'مثال: Corolla is required',
      'en': '',
    },
    'zn42w5ae': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '42kwc9fw': {
      'ar': '',
      'en': '',
    },
    '8o90ive7': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ap1y64uu': {
      'ar': 'مثال: ستروفولوس is required',
      'en': '',
    },
    'ahexf4yx': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'mhv4yesj': {
      'ar': 'مثال: تويوتا كورولا 2018 للبيع is required',
      'en': '',
    },
    '3whn7ojt': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8ft3pn4e': {
      'ar': 'يرجى إضافة وصف مختصر للسكن وأي تفاصيل مهمة.',
      'en':
          'Please add a brief description of the accommodation and any important details.',
    },
    'tm64anij': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'sd3ojeen': {
      'ar': 'يرجى إدخال رقم واتساب صحيح حتى يتمكن المهتمون من التواصل معك.',
      'en':
          'Please enter a valid WhatsApp number so interested users can contact you.',
    },
    '1qm04xe6': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'm66fgegl': {
      'ar': '* الحقول المطلوبة',
      'en': '* Required fields',
    },
    'ox67t7qm': {
      'ar': 'فئة الغرض *',
      'en': 'Item category *',
    },
    '0dy2mnvl': {
      'ar': 'Select...',
      'en': '',
    },
    '3ih99w41': {
      'ar': 'Search...',
      'en': '',
    },
    'ixxo3nof': {
      'ar': 'جهاز منزلي',
      'en': 'Home appliance',
    },
    'b1g96bhd': {
      'ar': 'أثاث',
      'en': 'Furniture',
    },
    'p5w8go7k': {
      'ar': 'معدات عمل',
      'en': 'Work equipment',
    },
    'gl1iky2n': {
      'ar': 'أخرى',
      'en': 'Other',
    },
    '1yfbba8g': {
      'ar': 'السعر (€)',
      'en': 'Price (€)',
    },
    'gjyl3rwv': {
      'ar': 'مثال: 650',
      'en': 'e.g. 650',
    },
    'niagboej': {
      'ar': 'المنطقة *',
      'en': 'District *',
    },
    '28bub0u3': {
      'ar': 'Select...',
      'en': '',
    },
    '1ltm29tf': {
      'ar': 'Search...',
      'en': '',
    },
    'm5t2ljc2': {
      'ar': 'نيقوسيا',
      'en': 'Nicosia',
    },
    '0wkg6x3g': {
      'ar': 'ليماسول',
      'en': 'Limassol',
    },
    '8xj3hbxd': {
      'ar': 'لارنكا',
      'en': 'Larnaca',
    },
    '5wd0qsdu': {
      'ar': 'بافوس',
      'en': 'Paphos',
    },
    '0pxc3ury': {
      'ar': 'أموخوستوس',
      'en': 'Famagusta',
    },
    '2hsdnft4': {
      'ar': 'المنطقة الفرعية – اختياري',
      'en': 'Area - Optional',
    },
    '7fp3igtc': {
      'ar': 'مثال: ستروفولوس',
      'en': 'e.g. Strovolos',
    },
    '69e9spuc': {
      'ar': 'عنوان الإعلان – اختياري',
      'en': 'Title - Optional',
    },
    '0bb53fcu': {
      'ar': 'مثال: غسالة للبيع',
      'en': 'e.g. Washing machine for sale',
    },
    'w4uippcv': {
      'ar': 'الوصف *',
      'en': 'Description *',
    },
    'onloh4ld': {
      'ar': 'اكتب وصفاً للغرض وحالته والسعر وأي تفاصيل مهمة',
      'en': 'Describe the item, its condition, price and any important details',
    },
    'oae01ds3': {
      'ar': 'واتساب *',
      'en': 'WhatApp *',
    },
    'jc6omcpq': {
      'ar': 'مثال: 99123456',
      'en': 'e.g. 99123456',
    },
    'cja6bt5s': {
      'ar': 'مثال: Corolla is required',
      'en': '',
    },
    'azu3fbkg': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'm526qhjr': {
      'ar': '',
      'en': '',
    },
    '26y5t5gk': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3t6t90t8': {
      'ar': 'مثال: ستروفولوس is required',
      'en': '',
    },
    'u6xbdmba': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'umvkn7a6': {
      'ar': 'مثال: تويوتا كورولا 2018 للبيع is required',
      'en': '',
    },
    'sr5kuicd': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'm0tg0h1k': {
      'ar': 'يرجى إضافة وصف مختصر للغرض وأي تفاصيل مهمة.',
      'en':
          'Please add a brief description of the item and any important details.',
    },
    'ijxtp4qp': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'g4yb3chm': {
      'ar': 'يرجى إدخال رقم واتساب صحيح حتى يتمكن المهتمون من التواصل معك.',
      'en':
          'Please enter a valid WhatsApp number so interested users can contact you.',
    },
    'zhawymbt': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5bxfadrh': {
      'ar': 'الصور – صورتان كحد أقصى (اختياري)',
      'en': 'Photos – Maximum 2 (optional)',
    },
    'tv58zp9m': {
      'ar': 'أضف صورة',
      'en': 'Add photo',
    },
    '6fgo5gab': {
      'ar': 'الكاميرا أو المعرض',
      'en': 'Camera or gallery',
    },
    'alhrdxec': {
      'ar': 'أضف صورة',
      'en': 'Add photo',
    },
    'j2qw1e7k': {
      'ar': 'الكاميرا أو المعرض',
      'en': 'Camera or gallery',
    },
    '15ko5e7i': {
      'ar': 'انشر سيارة للبيع',
      'en': 'Post Car for Sale',
    },
    'jyh8kj2z': {
      'ar': 'انشر غرضاً للبيع',
      'en': 'Post Item for Sale',
    },
    '4s58pu9g': {
      'ar': 'نشر إعلان',
      'en': 'Post an Ad',
    },
    'pmi38a8h': {
      'ar': 'Home',
      'en': '',
    },
  },
  // HomePageNew
  {
    'kiijsrj0': {
      'ar': 'السوريين في قبرص',
      'en': 'Syrians in Cyprus',
    },
    'gr3nz7pv': {
      'ar': 'العربية',
      'en': 'Arabic',
    },
    'cz1fs2j3': {
      'ar': 'الإنجليزية',
      'en': 'English',
    },
    'gqjbgcx6': {
      'ar': 'سورية هي الوطن – مفوضية الأمم المتحدة لشؤون اللاجئين',
      'en': 'Syria is Home – UNHCR',
    },
    'd3ptmh3h': {
      'ar': 'معلومات رسمية للسوريين الذين يفكرون بالعودة الطوعية إلى سورية.',
      'en':
          'Official information for Syrians considering voluntary return to Syria.',
    },
    'uieme2mi': {
      'ar': 'حول التطبيق',
      'en': 'About this app',
    },
    '8gmaqlv3': {
      'ar':
          'معلومات مستقلة بالعربية والإنكليزية تساعد السوريين في قبرص على الوصول إلى الخدمات والمصادر الرسمية. يدير التطبيق علوش. التطبيق ليس جهة حكومية ولا يقدّم استشارات قانونية.',
      'en':
          'Independent Arabic–English information helping Syrians in Cyprus access services and official sources. Administered by Aloush. Not a government service or legal advice.',
    },
    'p3dk33ci': {
      'ar': 'تابعونا أو تواصلوا معنا',
      'en': 'Follow or contact us',
    },
    '1241q41a': {
      'ar': 'مشاركة',
      'en': 'Share',
    },
    'rkwd9o8r': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'dmcrbbtq': {
      'ar': '',
      'en': '',
    },
    'a5jy69sv': {
      'ar': '',
      'en': '',
    },
    'pf4knbal': {
      'ar': '',
      'en': '',
    },
    'sabttr1r': {
      'ar': '',
      'en': '',
    },
    '1pl5f95o': {
      'ar': '',
      'en': '',
    },
    'v2tsmcmw': {
      'ar': '',
      'en': '',
    },
    '639btgwc': {
      'ar': '',
      'en': '',
    },
    'f4fmg24w': {
      'ar': '',
      'en': '',
    },
    '0wkyqr2n': {
      'ar': '',
      'en': '',
    },
    'q9k0lifw': {
      'ar': '',
      'en': '',
    },
    'wfermux8': {
      'ar': '',
      'en': '',
    },
    '0sibwhyz': {
      'ar': '',
      'en': '',
    },
    '10c28w39': {
      'ar': '',
      'en': '',
    },
    '53fl017w': {
      'ar': '',
      'en': '',
    },
    'nhls00q7': {
      'ar': '',
      'en': '',
    },
    '3hj13uz6': {
      'ar': '',
      'en': '',
    },
    'qq3d2rmz': {
      'ar': '',
      'en': '',
    },
    'hncwyjq3': {
      'ar': '',
      'en': '',
    },
    'e70gy3cp': {
      'ar': '',
      'en': '',
    },
    'l3ui432g': {
      'ar': '',
      'en': '',
    },
    'pnr52w9e': {
      'ar': '',
      'en': '',
    },
    'tqg47w6b': {
      'ar': '',
      'en': '',
    },
    '17neswcx': {
      'ar': '',
      'en': '',
    },
    'fvucxs2o': {
      'ar': '',
      'en': '',
    },
    'vh30oj5d': {
      'ar': '',
      'en': '',
    },
    'lhagg20n': {
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
