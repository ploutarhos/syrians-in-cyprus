import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'listing_detail_page_model.dart';
export 'listing_detail_page_model.dart';

class ListingDetailPageWidget extends StatefulWidget {
  const ListingDetailPageWidget({
    super.key,
    required this.listingId,
  });

  final String? listingId;

  static String routeName = 'ListingDetailPage';
  static String routePath = '/listingDetailPage';

  @override
  State<ListingDetailPageWidget> createState() =>
      _ListingDetailPageWidgetState();
}

class _ListingDetailPageWidgetState extends State<ListingDetailPageWidget> {
  late ListingDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

    @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _showReportListingDialog(String? listingId) async {
    if (listingId == null || listingId.isEmpty) {
      return;
    }

    final isArabic =
        FFLocalizations.of(context).languageCode == 'ar';

    String selectedReason = 'fraud';
    final detailsController = TextEditingController();
    bool isSubmitting = false;
    String? errorMessage;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            final reasons = <String, String>{
              'fraud': isArabic
                  ? 'احتيال أو معلومات مضللة'
                  : 'Fraud or misleading information',
              'inappropriate': isArabic
                  ? 'محتوى غير لائق أو محظور'
                  : 'Inappropriate or prohibited content',
              'incorrect_contact': isArabic
                  ? 'معلومات اتصال غير صحيحة'
                  : 'Incorrect contact details',
              'unavailable': isArabic
                  ? 'الإعلان لم يعد متاحاً'
                  : 'Listing no longer available',
              'other': isArabic ? 'سبب آخر' : 'Other',
            };

            return AlertDialog(
              title: Text(
                isArabic ? 'الإبلاغ عن الإعلان' : 'Report listing',
                textAlign:
                    isArabic ? TextAlign.right : TextAlign.left,
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      isArabic
                          ? 'اختر سبب الإبلاغ. سيتم مراجعة الإعلان.'
                          : 'Select a reason. The listing will be reviewed.',
                      textAlign:
                          isArabic ? TextAlign.right : TextAlign.left,
                    ),
                    const SizedBox(height: 16.0),
                    DropdownButtonFormField<String>(
                      value: selectedReason,
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: isArabic ? 'السبب' : 'Reason',
                        border: const OutlineInputBorder(),
                      ),
                      items: reasons.entries
                          .map(
                            (entry) => DropdownMenuItem<String>(
                              value: entry.key,
                              child: Text(entry.value),
                            ),
                          )
                          .toList(),
                      onChanged: isSubmitting
                          ? null
                          : (value) {
                              if (value != null) {
                                setDialogState(() {
                                  selectedReason = value;
                                });
                              }
                            },
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: detailsController,
                      enabled: !isSubmitting,
                      maxLines: 4,
                      maxLength: 500,
                      textAlign:
                          isArabic ? TextAlign.right : TextAlign.left,
                      decoration: InputDecoration(
                        labelText: isArabic
                            ? 'تفاصيل إضافية (اختياري)'
                            : 'Additional details (optional)',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Align(
                      alignment: isArabic
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () async {
                          await launchURL(
                            'https://ploutarhos.github.io/syrians-in-cyprus/privacy.html',
                          );
                        },
                        icon: const Icon(Icons.privacy_tip_outlined),
                        label: Text(
                          isArabic ? 'سياسة الخصوصية' : 'Privacy Policy',
                        ),
                      ),
                    ),
                    if (errorMessage != null) ...[
                      const SizedBox(height: 8.0),
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red),
                        textAlign:
                            isArabic ? TextAlign.right : TextAlign.left,
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isSubmitting
                      ? null
                      : () => Navigator.pop(dialogContext),
                  child: Text(isArabic ? 'إلغاء' : 'Cancel'),
                ),
                FilledButton(
                  onPressed: isSubmitting
                      ? null
                      : () async {
                          setDialogState(() {
                            isSubmitting = true;
                            errorMessage = null;
                          });

                          try {
                            await SupaFlow.client
                                .from('listing_reports')
                                .insert({
                              'listing_id': listingId,
                              'reason': selectedReason,
                              'details':
                                  detailsController.text.trim().isEmpty
                                      ? null
                                      : detailsController.text.trim(),
                            });

                            if (dialogContext.mounted) {
                              Navigator.pop(dialogContext);
                            }

                            if (mounted) {
                              ScaffoldMessenger.of(this.context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(
                                    isArabic
                                        ? 'شكراً. تم إرسال البلاغ للمراجعة.'
                                        : 'Thank you. The listing has been reported for review.',
                                  ),
                                ),
                              );
                            }
                          } catch (error) {
                            final duplicate =
                                error.toString().contains('23505');

                            setDialogState(() {
                              isSubmitting = false;
                              errorMessage = duplicate
                                  ? (isArabic
                                      ? 'لقد أبلغت عن هذا الإعلان مسبقاً.'
                                      : 'You have already reported this listing.')
                                  : (isArabic
                                      ? 'تعذر إرسال البلاغ. حاول مرة أخرى.'
                                      : 'The report could not be submitted. Please try again.');
                            });
                          }
                        },
                  child: isSubmitting
                      ? const SizedBox(
                          width: 18.0,
                          height: 18.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          isArabic ? 'إرسال البلاغ' : 'Submit report',
                        ),
                ),
              ],
            );
          },
        );
      },
    );

    detailsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListingsRow>>(
      future: ListingsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget!.listingId,
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
        List<ListingsRow> listingDetailPageListingsRowList = snapshot.data!;

        final listingDetailPageListingsRow =
            listingDetailPageListingsRowList.isNotEmpty
                ? listingDetailPageListingsRowList.first
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
              title: Text(
                FFLocalizations.of(context).getText(
                  'lyqheu9e' /* إعلانات */,
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
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [
                Builder(
                  builder: (shareContext) => IconButton(
                    tooltip: FFLocalizations.of(context).languageCode == 'ar'
                        ? 'مشاركة الإعلان'
                        : 'Share listing',
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final listingId = widget.listingId;
                      if (listingId == null || listingId.isEmpty) {
                        return;
                      }
                      final isArabic =
                          FFLocalizations.of(context).languageCode == 'ar';
                      final listingTitle =
                          listingDetailPageListingsRow?.title ?? '';
                      final shareUrl =
                          'https://ploutarhos.github.io/syrians-in-cyprus/#/listingDetailPage?listingId=' +
                              Uri.encodeQueryComponent(listingId);
                      await Share.share(
                        (isArabic
                                ? 'شاهد هذا الإعلان في تطبيق السوريين في قبرص'
                                : 'View this listing in the Syrians in Cyprus app') +
                            '\n\n' +
                            listingTitle +
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
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        listingDetailPageListingsRow?.title,
                        '\"\"',
                      ),
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
                    Text(
                      valueOrDefault<String>(
                        listingDetailPageListingsRow?.description,
                        '\"\"',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      valueOrDefault<String>(
                        listingDetailPageListingsRow?.district,
                        '\"\"',
                      ),
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
                    Text(
                      '€${valueOrDefault<String>(
                        listingDetailPageListingsRow?.price?.toString(),
                        '0',
                      )}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Text(
                      dateTimeFormat(
                        "yMMMd",
                        listingDetailPageListingsRow!.createdAt!,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
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
                    if (listingDetailPageListingsRow?.listingType == 'car')
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (listingDetailPageListingsRow?.carMake != '')
                            Text(
                              FFLocalizations.of(context).languageCode == 'ar'
                                  ? 'الشركة:${listingDetailPageListingsRow?.carMake}'
                                  : 'Make:${listingDetailPageListingsRow?.carMake}',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                          if (listingDetailPageListingsRow?.carModel != '')
                            Text(
                              FFLocalizations.of(context).languageCode == 'ar'
                                  ? 'الموديل:${listingDetailPageListingsRow?.carModel}'
                                  : 'Model:${listingDetailPageListingsRow?.carModel}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                          if (listingDetailPageListingsRow?.carYear != 0)
                            Text(
                              FFLocalizations.of(context).languageCode == 'ar'
                                  ? 'السنة:${listingDetailPageListingsRow?.carYear.toString()}'
                                  : 'Year:${listingDetailPageListingsRow?.carYear.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                        ],
                      ),
                    if (listingDetailPageListingsRow?.listingType ==
                        'accommodation')
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (listingDetailPageListingsRow?.housingKind != '')
                            Text(
                              FFLocalizations.of(context).languageCode == 'ar'
                                  ? 'نوع السكن:${listingDetailPageListingsRow?.housingKind}'
                                  : 'Housing type:${listingDetailPageListingsRow?.housingKind}',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                          if (valueOrDefault<bool>(
                            listingDetailPageListingsRow?.bedrooms.toString() !=
                                '0',
                            true,
                          ))
                            Text(
                              FFLocalizations.of(context).languageCode == 'ar'
                                  ? 'غرف النوم:${listingDetailPageListingsRow?.bedrooms.toString()}'
                                  : 'Bedrooms:${listingDetailPageListingsRow?.bedrooms.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                        ],
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (listingDetailPageListingsRow?.contactPhone != '')
                          FFButtonWidget(
                            onPressed: () async {
                              await launchURL(
                                  'tel:${listingDetailPageListingsRow?.contactPhone}');
                            },
                            text: FFLocalizations.of(context).getText(
                              'r0xghbor' /* اتصال */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).success,
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
                        if (listingDetailPageListingsRow?.contactWhatsapp != '')
                          FFButtonWidget(
                            onPressed: () async {
                              await launchURL(
                                  'https://wa.me/${listingDetailPageListingsRow?.contactWhatsapp}');
                            },
                            text: FFLocalizations.of(context).getText(
                              'enirxifg' /* واتساب */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).success,
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
                                           ].divide(SizedBox(width: 10.0)),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          await _showReportListingDialog(
                            widget.listingId,
                          );
                        },
                        icon: const Icon(
                          Icons.flag_outlined,
                          size: 20.0,
                        ),
                        label: Text(
                          FFLocalizations.of(context).languageCode == 'ar'
                              ? 'الإبلاغ عن الإعلان'
                              : 'Report listing',
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFB3261E),
                          side: const BorderSide(
                            color: Color(0xFFB3261E),
                            width: 1.0,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
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
