import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'useful_contacts_page_model.dart';
export 'useful_contacts_page_model.dart';

class UsefulContactsPageWidget extends StatefulWidget {
  const UsefulContactsPageWidget({super.key});

  static String routeName = 'UsefulContactsPage';
  static String routePath = '/usefulContactsPage';

  @override
  State<UsefulContactsPageWidget> createState() =>
      _UsefulContactsPageWidgetState();
}

class _UsefulContactsPageWidgetState extends State<UsefulContactsPageWidget> {
  late UsefulContactsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsefulContactsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFB8E6E3),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).success,
          automaticallyImplyLeading: true,
          title: RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    '56ct6fh7' /* جهات اتصال مفيدة */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                )
              ],
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 8.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'yjl66ci8' /* آخر تحقق: 3 أيلول 2026. قد تتغ... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              FlutterFlowChoiceChips(
                options: [
                  ChipData(FFLocalizations.of(context).getText(
                    'yiadbog4' /* كل قبرص */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'xls6an9x' /* على مستوى قبرص */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'n0jkpoda' /* نيقوسيا */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'x830mh0v' /* ليماسول */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'q6ksahd2' /* لارنكا */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    's7356efu' /* بافوس */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'e8g56zms' /* فاماغوستا */,
                  ))
                ],
                onChanged: (val) async {
                  safeSetState(
                      () => _model.choiceChipsValue1 = val?.firstOrNull);
                  _model.selectedDistrict = () {
                    if (_model.choiceChipsValue1 == 'كل قبرص') {
                      return 'all';
                    } else if (_model.choiceChipsValue1 == 'على مستوى قبرص') {
                      return 'nationwide';
                    } else if (_model.choiceChipsValue1 == 'نيقوسيا') {
                      return 'nicosia';
                    } else if (_model.choiceChipsValue1 == 'ليماسول') {
                      return 'limassol';
                    } else if (_model.choiceChipsValue1 == 'لارنكا') {
                      return 'larnaca';
                    } else if (_model.choiceChipsValue1 == 'بافوس') {
                      return 'paphos';
                    } else if (_model.choiceChipsValue1 == 'أموخوستوس') {
                      return 'famagusta';
                    } else if (_model.choiceChipsValue1 == 'Nicosia') {
                      return 'nicosia';
                    } else if (_model.choiceChipsValue1 == 'Nationwide') {
                      return 'nationwide';
                    } else if (_model.choiceChipsValue1 == 'All Cyprus') {
                      return 'all';
                    } else if (_model.choiceChipsValue1 == 'Limassol') {
                      return 'limassol';
                    } else if (_model.choiceChipsValue1 == 'Larnaca') {
                      return 'larnaca';
                    } else if (_model.choiceChipsValue1 == 'Paphos') {
                      return 'paphos';
                    } else if (_model.choiceChipsValue1 == 'Ammochostos') {
                      return 'famagusta';
                    } else {
                      return 'all';
                    }
                  }();
                  safeSetState(() {});
                },
                selectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).info,
                  iconSize: 16.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  iconSize: 16.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                chipSpacing: 8.0,
                rowSpacing: 8.0,
                multiselect: false,
                alignment: WrapAlignment.start,
                controller: _model.choiceChipsValueController1 ??=
                    FormFieldController<List<String>>(
                  [],
                ),
                wrapped: true,
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              FlutterFlowChoiceChips(
                options: [
                  ChipData(FFLocalizations.of(context).getText(
                    '70d1ue4w' /* الكل */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'labkj1rb' /* الأطباء */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    '6yej3ree' /* قانوني */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'zhx9lau8' /* اللجوء والهجرة */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'vurod91i' /* العمل والتأمينات الاجتماعية */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'jw4s79h9' /* المنظمات */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'tqukqcpx' /* الطوارئ */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'p86imrl5' /* المجتمع */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'zm7h1ipw' /* أخرى */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    '7s4pejz8' /* مترجمون محلّفون */,
                  ))
                ],
                onChanged: (val) async {
                  safeSetState(
                      () => _model.choiceChipsValue2 = val?.firstOrNull);
                  _model.selectedType = () {
                    if (_model.choiceChipsValue2 == 'الكل') {
                      return 'all';
                    } else if (_model.choiceChipsValue2 == 'الأطباء') {
                      return 'doctor';
                    } else if (_model.choiceChipsValue2 == 'قانوني') {
                      return 'legal';
                    } else if (_model.choiceChipsValue2 ==
                        'العمل والتأمينات الاجتماعية') {
                      return 'employment_social_insurance';
                    } else if (_model.choiceChipsValue2 == 'أخرى') {
                      return 'other';
                    } else if (_model.choiceChipsValue2 == 'اللجوء والهجرة') {
                      return 'asylum_migration';
                    } else if (_model.choiceChipsValue2 == 'المنظمات') {
                      return 'ngo';
                    } else if (_model.choiceChipsValue2 == 'الطوارئ') {
                      return 'emergency';
                    } else if (_model.choiceChipsValue2 == 'المجتمع') {
                      return 'community';
                    } else if (_model.choiceChipsValue2 == 'All') {
                      return 'all';
                    } else if (_model.choiceChipsValue2 == 'Doctors') {
                      return 'doctor';
                    } else if (_model.choiceChipsValue2 == 'Legal') {
                      return 'legal';
                    } else if (_model.choiceChipsValue2 ==
                        'Asylum & Migration') {
                      return 'asylum_migration';
                    } else if (_model.choiceChipsValue2 ==
                        'Employment & Social Insurance') {
                      return 'employment_social_insurance';
                    } else if (_model.choiceChipsValue2 == 'NGOs') {
                      return 'ngo';
                    } else if (_model.choiceChipsValue2 == 'Emergency') {
                      return 'emergency';
                    } else if (_model.choiceChipsValue2 == 'Community') {
                      return 'community';
                    } else if (_model.choiceChipsValue2 == 'Other') {
                      return 'other';
                    } else if (_model.choiceChipsValue2 == 'مترجمون محلّفون') {
                      return 'sworn_translator';
                    } else if (_model.choiceChipsValue2 ==
                        'Sworn Translators') {
                      return 'sworn_translator';
                    } else {
                      return 'all';
                    }
                  }();
                  safeSetState(() {});
                },
                selectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).info,
                  iconSize: 16.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  iconSize: 16.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                chipSpacing: 8.0,
                rowSpacing: 8.0,
                multiselect: false,
                alignment: WrapAlignment.start,
                controller: _model.choiceChipsValueController2 ??=
                    FormFieldController<List<String>>(
                  [],
                ),
                wrapped: true,
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Expanded(
                child: FutureBuilder<List<ContactsRow>>(
                  future: ContactsTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                          'is_active',
                          true,
                        )
                        .order('sort_order', ascending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ContactsRow> listViewContactsRowList = snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewContactsRowList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewContactsRow =
                            listViewContactsRowList[listViewIndex];
                        return Visibility(
                          visible: (_model.selectedDistrict == 'all') ||
                              (listViewContactsRow.district ==
                                  _model.selectedDistrict) ||
                              (listViewContactsRow.district == 'nationwide'),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).info,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Visibility(
                              visible: (_model.selectedType == 'all') ||
                                  (listViewContactsRow.contactType ==
                                      _model.selectedType),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                                    .languageCode ==
                                                'ar'
                                            ? listViewContactsRow.nameAr
                                            : listViewContactsRow.nameEn,
                                        'Contact',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    if ((listViewContactsRow.specialtyEn !=
                                                null &&
                                            listViewContactsRow.specialtyEn !=
                                                '') ||
                                        (listViewContactsRow.specialtyAr !=
                                                null &&
                                            listViewContactsRow.specialtyAr !=
                                                ''))
                                      Text(
                                        valueOrDefault<String>(
                                          FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'ar'
                                              ? listViewContactsRow.specialtyAr
                                              : listViewContactsRow.specialtyEn,
                                          'null',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    if ((listViewContactsRow.notesAr != null &&
                                            listViewContactsRow.notesAr !=
                                                '') ||
                                        (listViewContactsRow.notesEn != null &&
                                            listViewContactsRow.notesEn != ''))
                                      Text(
                                        valueOrDefault<String>(
                                          FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'ar'
                                              ? listViewContactsRow.notesAr
                                              : listViewContactsRow.notesEn,
                                          'null',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        if (listViewContactsRow.phone != null &&
                                            listViewContactsRow.phone != '')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              final rawPhone =
                                                  listViewContactsRow.phone;
                                              final phoneNumbers = rawPhone
                                                  .split(RegExp(r'[/,;]'))
                                                  .map((number) => number.trim())
                                                  .where((number) =>
                                                      number.isNotEmpty)
                                                  .toList();

                                              if (phoneNumbers.isEmpty) {
                                                return;
                                              }

                                              final selectedPhone =
                                                  phoneNumbers.length == 1
                                                      ? phoneNumbers.first
                                                      : await showDialog<String>(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            final isArabic =
                                                                FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'ar';
                                                            return AlertDialog(
                                                              title: Text(
                                                                isArabic
                                                                    ? 'اختر رقم الهاتف'
                                                                    : 'Choose a phone number',
                                                                textAlign: isArabic
                                                                    ? TextAlign.right
                                                                    : TextAlign.left,
                                                              ),
                                                              content: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize.min,
                                                                children:
                                                                    phoneNumbers
                                                                        .map(
                                                                          (number) =>
                                                                              ListTile(
                                                                            leading:
                                                                                const Icon(Icons.phone),
                                                                            title:
                                                                                Text(number),
                                                                            onTap: () =>
                                                                                Navigator.pop(dialogContext, number),
                                                                          ),
                                                                        )
                                                                        .toList(),
                                                              ),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          dialogContext),
                                                                  child: Text(
                                                                    isArabic
                                                                        ? 'إلغاء'
                                                                        : 'Cancel',
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );

                                              if (selectedPhone != null) {
                                                await launchURL(
                                                  'tel:${selectedPhone.replaceAll(RegExp(r'\s+'), '')}',
                                                );
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '32vnfu67' /* اتصال */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (listViewContactsRow.whatsapp !=
                                                null &&
                                            listViewContactsRow.whatsapp != '')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await launchURL(
                                                  'https://wa.me/${listViewContactsRow.whatsapp}');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'dor7vf24' /* واتساب */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (listViewContactsRow.email != null &&
                                            listViewContactsRow.email != '')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await launchURL(
                                                  'mailto:${listViewContactsRow.email}');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '2yb6q9bx' /* إيميل */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (listViewContactsRow.websiteUrl !=
                                                null &&
                                            listViewContactsRow.websiteUrl !=
                                                '')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await launchURL(
                                                  listViewContactsRow
                                                      .websiteUrl!);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'qxlz6pki' /* الموقع */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (listViewContactsRow.mapsUrl !=
                                                null &&
                                            listViewContactsRow.mapsUrl != '')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await launchURL(
                                                  listViewContactsRow.mapsUrl!);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'aly3oud4' /* الخريطة */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
