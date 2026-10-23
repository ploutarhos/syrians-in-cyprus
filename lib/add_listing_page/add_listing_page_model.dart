import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'add_listing_page_widget.dart' show AddListingPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddListingPageModel extends FlutterFlowModel<AddListingPageWidget> {
  ///  Local state fields for this page.

  String listingType = '\"\"';

  String listingIntent = '\"\"';

  String housingKind = '\"\"';

  String itemCategory = '\"\"';

  String? currentUserId;

  bool marketplaceRulesAccepted = false;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - anonymousSignIn] action in AddListingPage widget.
  String? anonymousUserId;
  // State field(s) for tfCarMake widget.
  FocusNode? tfCarMakeFocusNode;
  TextEditingController? tfCarMakeTextController;
  String? Function(BuildContext, String?)? tfCarMakeTextControllerValidator;
  String? _tfCarMakeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '159o7nat' /* يرجى إدخال ماركة السيارة */,
      );
    }

    return null;
  }

  // State field(s) for tfCarModel widget.
  FocusNode? tfCarModelFocusNode;
  TextEditingController? tfCarModelTextController;
  String? Function(BuildContext, String?)? tfCarModelTextControllerValidator;
  // State field(s) for tfCarYear widget.
  FocusNode? tfCarYearFocusNode;
  TextEditingController? tfCarYearTextController;
  String? Function(BuildContext, String?)? tfCarYearTextControllerValidator;
  String? _tfCarYearTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9xp9oy9m' /* يرجى إدخال سنة الصنع */,
      );
    }

    return null;
  }

  // State field(s) for tfCarPrice widget.
  FocusNode? tfCarPriceFocusNode;
  TextEditingController? tfCarPriceTextController;
  String? Function(BuildContext, String?)? tfCarPriceTextControllerValidator;
  // State field(s) for ddCarDistrict widget.
  String? ddCarDistrictValue;
  FormFieldController<String>? ddCarDistrictValueController;
  // State field(s) for tfCarArea widget.
  FocusNode? tfCarAreaFocusNode;
  TextEditingController? tfCarAreaTextController;
  String? Function(BuildContext, String?)? tfCarAreaTextControllerValidator;
  // State field(s) for tfCarTitle widget.
  FocusNode? tfCarTitleFocusNode;
  TextEditingController? tfCarTitleTextController;
  String? Function(BuildContext, String?)? tfCarTitleTextControllerValidator;
  // State field(s) for tfCarDescription widget.
  FocusNode? tfCarDescriptionFocusNode;
  TextEditingController? tfCarDescriptionTextController;
  String? Function(BuildContext, String?)?
      tfCarDescriptionTextControllerValidator;
  String? _tfCarDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nhakgbus' /* يرجى إضافة وصف مختصر للسيارة و... */,
      );
    }

    return null;
  }

  // State field(s) for tfCarWhatsApp widget.
  FocusNode? tfCarWhatsAppFocusNode;
  TextEditingController? tfCarWhatsAppTextController;
  String? Function(BuildContext, String?)? tfCarWhatsAppTextControllerValidator;
  String? _tfCarWhatsAppTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7rudmwsf' /* يرجى إدخال رقم واتساب صحيح حتى... */,
      );
    }

    return null;
  }

  // State field(s) for ddAccommodationType widget.
  String? ddAccommodationTypeValue;
  FormFieldController<String>? ddAccommodationTypeValueController;
  // State field(s) for tfAccommodationBedrooms widget.
  FocusNode? tfAccommodationBedroomsFocusNode;
  TextEditingController? tfAccommodationBedroomsTextController;
  String? Function(BuildContext, String?)?
      tfAccommodationBedroomsTextControllerValidator;
  // State field(s) for tfAccommodationPrice widget.
  FocusNode? tfAccommodationPriceFocusNode;
  TextEditingController? tfAccommodationPriceTextController;
  String? Function(BuildContext, String?)?
      tfAccommodationPriceTextControllerValidator;
  // State field(s) for ddAccommodationDistrict widget.
  String? ddAccommodationDistrictValue;
  FormFieldController<String>? ddAccommodationDistrictValueController;
  // State field(s) for tfAccommodationArea widget.
  FocusNode? tfAccommodationAreaFocusNode;
  TextEditingController? tfAccommodationAreaTextController;
  String? Function(BuildContext, String?)?
      tfAccommodationAreaTextControllerValidator;
  // State field(s) for tfAccommodationTitle widget.
  FocusNode? tfAccommodationTitleFocusNode;
  TextEditingController? tfAccommodationTitleTextController;
  String? Function(BuildContext, String?)?
      tfAccommodationTitleTextControllerValidator;
  // State field(s) for tfAccommodationDescription widget.
  FocusNode? tfAccommodationDescriptionFocusNode;
  TextEditingController? tfAccommodationDescriptionTextController;
  String? Function(BuildContext, String?)?
      tfAccommodationDescriptionTextControllerValidator;
  String? _tfAccommodationDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8ft3pn4e' /* يرجى إضافة وصف مختصر للسكن وأي... */,
      );
    }

    return null;
  }

  // State field(s) for tfAccommodationWhatsApp widget.
  FocusNode? tfAccommodationWhatsAppFocusNode;
  TextEditingController? tfAccommodationWhatsAppTextController;
  String? Function(BuildContext, String?)?
      tfAccommodationWhatsAppTextControllerValidator;
  String? _tfAccommodationWhatsAppTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sd3ojeen' /* يرجى إدخال رقم واتساب صحيح حتى... */,
      );
    }

    return null;
  }

  // State field(s) for ddItemCategory widget.
  String? ddItemCategoryValue;
  FormFieldController<String>? ddItemCategoryValueController;
  // State field(s) for tfItemPrice widget.
  FocusNode? tfItemPriceFocusNode;
  TextEditingController? tfItemPriceTextController;
  String? Function(BuildContext, String?)? tfItemPriceTextControllerValidator;
  // State field(s) for ddItemDistrict widget.
  String? ddItemDistrictValue;
  FormFieldController<String>? ddItemDistrictValueController;
  // State field(s) for tfItemArea widget.
  FocusNode? tfItemAreaFocusNode;
  TextEditingController? tfItemAreaTextController;
  String? Function(BuildContext, String?)? tfItemAreaTextControllerValidator;
  // State field(s) for tfItemTitle widget.
  FocusNode? tfItemTitleFocusNode;
  TextEditingController? tfItemTitleTextController;
  String? Function(BuildContext, String?)? tfItemTitleTextControllerValidator;
  // State field(s) for tfItemDescription widget.
  FocusNode? tfItemDescriptionFocusNode;
  TextEditingController? tfItemDescriptionTextController;
  String? Function(BuildContext, String?)?
      tfItemDescriptionTextControllerValidator;
  String? _tfItemDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm0tg0h1k' /* يرجى إضافة وصف مختصر للغرض وأي... */,
      );
    }

    return null;
  }

  // State field(s) for tfItemWhatsApp widget.
  FocusNode? tfItemWhatsAppFocusNode;
  TextEditingController? tfItemWhatsAppTextController;
  String? Function(BuildContext, String?)?
      tfItemWhatsAppTextControllerValidator;
  String? _tfItemWhatsAppTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g4yb3chm' /* يرجى إدخال رقم واتساب صحيح حتى... */,
      );
    }

    return null;
  }

  bool isDataUploading_uploadPhoto1Supabase = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto1Supabase =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPhoto1Supabase = '';

  bool isDataUploading_uploadPhoto2Supabase = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto2Supabase =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPhoto2Supabase = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ListingsRow? createdCarListing;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ListingsRow? createdAccommodationListing;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ListingsRow? createdItemListing;

  @override
  void initState(BuildContext context) {
    tfCarMakeTextControllerValidator = _tfCarMakeTextControllerValidator;
    tfCarYearTextControllerValidator = _tfCarYearTextControllerValidator;
    tfCarDescriptionTextControllerValidator =
        _tfCarDescriptionTextControllerValidator;
    tfCarWhatsAppTextControllerValidator =
        _tfCarWhatsAppTextControllerValidator;
    tfAccommodationDescriptionTextControllerValidator =
        _tfAccommodationDescriptionTextControllerValidator;
    tfAccommodationWhatsAppTextControllerValidator =
        _tfAccommodationWhatsAppTextControllerValidator;
    tfItemDescriptionTextControllerValidator =
        _tfItemDescriptionTextControllerValidator;
    tfItemWhatsAppTextControllerValidator =
        _tfItemWhatsAppTextControllerValidator;
  }

  @override
  void dispose() {
    tfCarMakeFocusNode?.dispose();
    tfCarMakeTextController?.dispose();

    tfCarModelFocusNode?.dispose();
    tfCarModelTextController?.dispose();

    tfCarYearFocusNode?.dispose();
    tfCarYearTextController?.dispose();

    tfCarPriceFocusNode?.dispose();
    tfCarPriceTextController?.dispose();

    tfCarAreaFocusNode?.dispose();
    tfCarAreaTextController?.dispose();

    tfCarTitleFocusNode?.dispose();
    tfCarTitleTextController?.dispose();

    tfCarDescriptionFocusNode?.dispose();
    tfCarDescriptionTextController?.dispose();

    tfCarWhatsAppFocusNode?.dispose();
    tfCarWhatsAppTextController?.dispose();

    tfAccommodationBedroomsFocusNode?.dispose();
    tfAccommodationBedroomsTextController?.dispose();

    tfAccommodationPriceFocusNode?.dispose();
    tfAccommodationPriceTextController?.dispose();

    tfAccommodationAreaFocusNode?.dispose();
    tfAccommodationAreaTextController?.dispose();

    tfAccommodationTitleFocusNode?.dispose();
    tfAccommodationTitleTextController?.dispose();

    tfAccommodationDescriptionFocusNode?.dispose();
    tfAccommodationDescriptionTextController?.dispose();

    tfAccommodationWhatsAppFocusNode?.dispose();
    tfAccommodationWhatsAppTextController?.dispose();

    tfItemPriceFocusNode?.dispose();
    tfItemPriceTextController?.dispose();

    tfItemAreaFocusNode?.dispose();
    tfItemAreaTextController?.dispose();

    tfItemTitleFocusNode?.dispose();
    tfItemTitleTextController?.dispose();

    tfItemDescriptionFocusNode?.dispose();
    tfItemDescriptionTextController?.dispose();

    tfItemWhatsAppFocusNode?.dispose();
    tfItemWhatsAppTextController?.dispose();
  }
}
