import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_router_page_model.dart';
export 'category_router_page_model.dart';

class CategoryRouterPageWidget extends StatefulWidget {
  const CategoryRouterPageWidget({
    super.key,
    required this.categoryId,
    required this.categorySlug,
  });

  final String? categoryId;
  final String? categorySlug;

  static String routeName = 'CategoryRouterPage';
  static String routePath = '/categoryRouterPage';

  @override
  State<CategoryRouterPageWidget> createState() =>
      _CategoryRouterPageWidgetState();
}

class _CategoryRouterPageWidgetState extends State<CategoryRouterPageWidget> {
  late CategoryRouterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryRouterPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.categorySlug == 'locations') {
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(DistrictPageWidget.routeName);
      } else {
        if (widget!.categorySlug == 'contacts') {
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(UsefulContactsPageWidget.routeName);
        } else {
          if (widget!.categorySlug == 'marketplace') {
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed(MarketplacePageWidget.routeName);
          } else {
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed(
              CategoryPageWidget.routeName,
              queryParameters: {
                'categoryId': serializeParam(
                  widget!.categoryId,
                  ParamType.String,
                ),
                'categorySlug': serializeParam(
                  widget!.categorySlug,
                  ParamType.String,
                ),
              }.withoutNulls,
            );
          }
        }
      }
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).success,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'fxbubmfa' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
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
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
