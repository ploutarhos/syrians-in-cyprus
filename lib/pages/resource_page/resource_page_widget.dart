import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'resource_page_model.dart';
export 'resource_page_model.dart';

class ResourcePageWidget extends StatefulWidget {
  const ResourcePageWidget({
    super.key,
    required this.resourceId,
  });

  final String? resourceId;

  static String routeName = 'ResourcePage';
  static String routePath = '/resourcePage';

  @override
  State<ResourcePageWidget> createState() => _ResourcePageWidgetState();
}

class _ResourcePageWidgetState extends State<ResourcePageWidget> {
  late ResourcePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late final Future<List<Map<String, dynamic>>> _sourceLinksFuture;

  Future<List<Map<String, dynamic>>> _loadSourceLinks() async {
    final resourceId = widget.resourceId;
    if (resourceId == null || resourceId.isEmpty) {
      return <Map<String, dynamic>>[];
    }
    final rows = await SupaFlow.client
        .from('resource_links')
        .select('label_en, label_ar, url')
        .eq('resource_id', resourceId)
        .eq('is_active', true)
        .order('sort_order', ascending: true);
    return List<Map<String, dynamic>>.from(rows);
  }

  // The old Android release still needs the inline URLs until users update.
  // In the updated app, show the separately labelled source buttons instead.
  String _articleBody(String? value, String? slug) {
    final body = value ?? '';
    if (slug != 'official-visa-requirements-syrians-cyprus') {
      return body;
    }
    for (final marker in ['\nOfficial sources:', '\nالمصادر الرسمية:']) {
      final index = body.lastIndexOf(marker);
      if (index >= 0) {
        return body.substring(0, index).trimRight();
      }
    }
    return body;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResourcePageModel());
    _sourceLinksFuture = _loadSourceLinks();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ResourcesRow>>(
      future: ResourcesTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget!.resourceId,
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
        List<ResourcesRow> resourcePageResourcesRowList = snapshot.data!;

        final resourcePageResourcesRow = resourcePageResourcesRowList.isNotEmpty
            ? resourcePageResourcesRowList.first
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
                  if (context.canPop()) {
                    context.pop();
                  } else if (resourcePageResourcesRow?.categoryId != null &&
                      resourcePageResourcesRow!.categoryId!.isNotEmpty) {
                    context.goNamed(
                      CategoryPageWidget.routeName,
                      queryParameters: {
                        'categoryId': serializeParam(
                          resourcePageResourcesRow.categoryId,
                          ParamType.String,
                        ),
                        'categorySlug': serializeParam(
                          '',
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    context.go('/');
                  }
                },
              ),
              title: Text(
                valueOrDefault<String>(
                  FFLocalizations.of(context).languageCode == 'ar'
                      ? resourcePageResourcesRow?.titleAr
                      : resourcePageResourcesRow?.titleEn,
                  'العنوان',
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
                        ? 'مشاركة المقال'
                        : 'Share article',
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final resourceId = widget.resourceId;
                      if (resourceId == null || resourceId.isEmpty) {
                        return;
                      }
                      final isArabic =
                          FFLocalizations.of(context).languageCode == 'ar';
                      final title = isArabic
                          ? resourcePageResourcesRow?.titleAr ?? ''
                          : resourcePageResourcesRow?.titleEn ?? '';
                      final shareUrl =
                          'https://ploutarhos.github.io/syrians-in-cyprus/#/resourcePage?resourceId=' +
                              Uri.encodeQueryComponent(resourceId);
                      await Share.share(
                        (isArabic
                                ? 'اقرأ هذا المقال في تطبيق السوريين في قبرص'
                                : 'Read this article in the Syrians in Cyprus app') +
                            '\n\n' +
                            title +
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
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 18.0, 20.0, 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (resourcePageResourcesRow?.resourceType != 'template')
                        Text(
                          _articleBody(
                            FFLocalizations.of(context).languageCode == 'ar'
                                ? resourcePageResourcesRow?.bodyAr
                                : resourcePageResourcesRow?.bodyEn,
                            resourcePageResourcesRow?.slug,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: true,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (resourcePageResourcesRow?.previewImageUrl !=
                                    '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        resourcePageResourcesRow!
                                            .previewImageUrl!,
                                        width: 200.0,
                                        height: 350.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                if (resourcePageResourcesRow?.resourceType ==
                                    'template')
                                  Text(
                                    valueOrDefault<String>(
                                      FFLocalizations.of(context)
                                                  .languageCode ==
                                              'ar'
                                          ? resourcePageResourcesRow?.bodyAr
                                          : resourcePageResourcesRow?.bodyEn,
                                      'المعلومات غير متوفرة حالياً',
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
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                if ((resourcePageResourcesRow?.fileUrlEn != '') ||
                                    (resourcePageResourcesRow?.fileUrlAr !=
                                        '') ||
                                    (resourcePageResourcesRow?.fileUrl != ''))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await launchURL(
                                            FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'ar'
                                                ? resourcePageResourcesRow!
                                                    .fileUrlAr!
                                                : resourcePageResourcesRow!
                                                    .fileUrlEn!);
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'mw9dt5ne' /* عرض المستند */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 180.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (resourcePageResourcesRow?.downloadUrl != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await launchURL(
                                            resourcePageResourcesRow!
                                                .downloadUrl!);
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'jx6j17yz' /* تحميل المستند */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 180.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (resourcePageResourcesRow?.getField<String>(
                                            'audio_download_url_1') !=
                                        null &&
                                    resourcePageResourcesRow?.getField<String>(
                                            'audio_download_url_1') !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await launchURL(resourcePageResourcesRow!
                                            .getField<String>(
                                                'audio_download_url_1')!);
                                      },
                                      text: FFLocalizations.of(context)
                                                  .languageCode ==
                                              'ar'
                                          ? 'تحميل التسجيلات 01–50'
                                          : 'Download Audio 01–50',
                                      options: FFButtonOptions(
                                        width: 220.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (resourcePageResourcesRow?.getField<String>(
                                            'audio_download_url_2') !=
                                        null &&
                                    resourcePageResourcesRow?.getField<String>(
                                            'audio_download_url_2') !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await launchURL(resourcePageResourcesRow!
                                            .getField<String>(
                                                'audio_download_url_2')!);
                                      },
                                      text: FFLocalizations.of(context)
                                                  .languageCode ==
                                              'ar'
                                          ? 'تحميل التسجيلات 51–100'
                                          : 'Download Audio 51–100',
                                      options: FFButtonOptions(
                                        width: 220.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                FutureBuilder<List<Map<String, dynamic>>>(
                                  future: _sourceLinksFuture,
                                  builder: (context, linksSnapshot) {
                                    if (!linksSnapshot.hasData &&
                                        !linksSnapshot.hasError) {
                                      return const SizedBox.shrink();
                                    }

                                    final links = linksSnapshot.data ??
                                        <Map<String, dynamic>>[];
                                    if (links.isNotEmpty) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: links.map((link) {
                                          final url = (link['url'] ?? '').toString();
                                          final label = (FFLocalizations.of(context)
                                                      .languageCode == 'ar'
                                                  ? link['label_ar']
                                                  : link['label_en'])
                                              ?.toString() ?? '';
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton.icon(
                                                onPressed: url.isEmpty
                                                    ? null
                                                    : () async {
                                                        await launchURL(url);
                                                      },
                                                icon: const Icon(
                                                  Icons.open_in_new,
                                                  size: 18.0,
                                                ),
                                                label: Text(
                                                  label,
                                                  textAlign: TextAlign.center,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(context)
                                                          .success,
                                                  foregroundColor: Colors.white,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                          horizontal: 12.0,
                                                          vertical: 13.0),
                                                  minimumSize:
                                                      const Size.fromHeight(
                                                          48.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    }

                                    final sourceUrl = (resourcePageResourcesRow
                                                    ?.officialSourceUrl
                                                    ?.isNotEmpty ??
                                                false)
                                        ? resourcePageResourcesRow!
                                            .officialSourceUrl!
                                        : (resourcePageResourcesRow
                                                ?.externalUrl ??
                                            '');
                                    if (sourceUrl.isEmpty) {
                                      return const SizedBox.shrink();
                                    }

                                    return FFButtonWidget(
                                      onPressed: () async {
                                        await launchURL(sourceUrl);
                                      },
                                      text:
                                          FFLocalizations.of(context).getText(
                                        'c28q4i0h' /* فتح المصدر الرسمي */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 180.0,
                                        height: 40.0,
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
