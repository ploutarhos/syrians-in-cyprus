import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'contact_detail_page_model.dart';
export 'contact_detail_page_model.dart';

class ContactDetailPageWidget extends StatefulWidget {
  const ContactDetailPageWidget({
    super.key,
    required this.contactId,
  });

  final String? contactId;

  static String routeName = 'ContactDetailPage';
  static String routePath = '/contactDetailPage';

  @override
  State<ContactDetailPageWidget> createState() =>
      _ContactDetailPageWidgetState();
}

class _ContactDetailPageWidgetState extends State<ContactDetailPageWidget> {
  late ContactDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactDetailPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContactsRow>>(
      future: ContactsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget!.contactId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFB8E6E3),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ContactsRow> contactDetailPageContactsRowList = snapshot.data!;

        final contactDetailPageContactsRow =
            contactDetailPageContactsRowList.isNotEmpty
                ? contactDetailPageContactsRowList.first
                : null;

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
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'qmuartzc' /* بيانات الاتصال */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
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
                ),
              ),
              actions: [
                Builder(
                  builder: (shareContext) => IconButton(
                    tooltip: FFLocalizations.of(context).languageCode == 'ar'
                        ? 'مشاركة جهة الاتصال'
                        : 'Share contact',
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final contactId = widget.contactId;
                      if (contactId == null || contactId.isEmpty) {
                        return;
                      }
                      final isArabic =
                          FFLocalizations.of(context).languageCode == 'ar';
                      final contactName = isArabic
                          ? (contactDetailPageContactsRow?.nameAr ?? '')
                          : (contactDetailPageContactsRow?.nameEn ?? '');
                      final shareUrl =
                          'https://ploutarhos.github.io/syrians-in-cyprus/#/contactDetailPage?contactId=' +
                              Uri.encodeQueryComponent(contactId);
                      await Share.share(
                        (isArabic
                                ? 'شاهد بيانات جهة الاتصال في تطبيق السوريين في قبرص'
                                : 'View this contact in the Syrians in Cyprus app') +
                            '\n\n' +
                            contactName +
                            '\n\n' +
                            shareUrl,
                        sharePositionOrigin:
                            getWidgetBoundingBox(shareContext),
                      );
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        FFLocalizations.of(context).languageCode == 'ar'
                            ? contactDetailPageContactsRow?.nameAr
                            : contactDetailPageContactsRow?.nameEn,
                        '\"\"',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    if ((contactDetailPageContactsRow?.specialtyAr != '\"\"') ||
                        (contactDetailPageContactsRow?.specialtyEn != '\"\"'))
                      Text(
                        valueOrDefault<String>(
                          FFLocalizations.of(context).languageCode == 'ar'
                              ? contactDetailPageContactsRow?.specialtyAr
                              : contactDetailPageContactsRow?.specialtyEn,
                          '\"\"',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    if ((contactDetailPageContactsRow?.notesAr != null &&
                            contactDetailPageContactsRow?.notesAr != '') ||
                        (contactDetailPageContactsRow?.notesEn != null &&
                            contactDetailPageContactsRow?.notesEn != ''))
                      Text(
                        valueOrDefault<String>(
                          FFLocalizations.of(context).languageCode == 'ar'
                              ? contactDetailPageContactsRow?.notesAr
                              : contactDetailPageContactsRow?.notesEn,
                          '\"\"',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        if (contactDetailPageContactsRow?.phone != null &&
                            contactDetailPageContactsRow?.phone != '')
                          FFButtonWidget(
                            onPressed: () async {
                              final rawPhone =
                                  contactDetailPageContactsRow?.phone ?? '';
                              final phoneNumbers = rawPhone
                                  .split(RegExp(r'[/,;]'))
                                  .map((number) => number.trim())
                                  .where((number) => number.isNotEmpty)
                                  .toList();

                              if (phoneNumbers.isEmpty) {
                                return;
                              }

                              final selectedPhone = phoneNumbers.length == 1
                                  ? phoneNumbers.first
                                  : await showDialog<String>(
                                      context: context,
                                      builder: (dialogContext) {
                                        final isArabic =
                                            FFLocalizations.of(context)
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
                                            mainAxisSize: MainAxisSize.min,
                                            children: phoneNumbers
                                                .map(
                                                  (number) => ListTile(
                                                    leading: const Icon(
                                                        Icons.phone),
                                                    title: Text(number),
                                                    onTap: () => Navigator.pop(
                                                        dialogContext, number),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  dialogContext),
                                              child: Text(isArabic
                                                  ? 'إلغاء'
                                                  : 'Cancel'),
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
                            text: FFLocalizations.of(context).getText(
                              'ui90hk99' /* اتصال */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        if (contactDetailPageContactsRow?.whatsapp != null &&
                            contactDetailPageContactsRow?.whatsapp != '')
                          FFButtonWidget(
                            onPressed: () async {
                              await launchURL(
                                  'https://wa.me/${contactDetailPageContactsRow?.whatsapp}');
                            },
                            text: FFLocalizations.of(context).getText(
                              'fkyq1042' /* واتساب */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        if (contactDetailPageContactsRow?.email != null &&
                            contactDetailPageContactsRow?.email != '')
                          FFButtonWidget(
                            onPressed: () async {
                              await launchURL(
                                  'mailto:${contactDetailPageContactsRow?.email}');
                            },
                            text: FFLocalizations.of(context).getText(
                              'k927zbxy' /* إيميل */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        if (contactDetailPageContactsRow?.websiteUrl != null &&
                            contactDetailPageContactsRow?.websiteUrl != '')
                          FFButtonWidget(
                            onPressed: () async {
                              await launchURL(
                                  contactDetailPageContactsRow!.websiteUrl!);
                            },
                            text: FFLocalizations.of(context).getText(
                              'm3bdwe7z' /* الموقع */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        if (contactDetailPageContactsRow?.mapsUrl != null &&
                            contactDetailPageContactsRow?.mapsUrl != '')
                          FFButtonWidget(
                            onPressed: () async {
                              await launchURL(
                                  contactDetailPageContactsRow!.mapsUrl!);
                            },
                            text: FFLocalizations.of(context).getText(
                              '2ckn2asj' /* الخريطة */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                      ],
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
