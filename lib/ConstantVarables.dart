import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstantVarable {
  static String baseUrl = "https://hcm.bsmart-apps.com/be";
  static String apiImg = "https://www.q8pulse.app/public/";
  static String apiMap = "AIzaSyCZCgOpXKbNdhTHAe4ANYKteYQSIYZYlGA";

  static String lang;
  static String userOrCompany;
  static String otp;
  static String accessToken;
  static String userName;
  static String loginError;
  static String lookupsName;

  static final GlobalKey<FormState> regformKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> regScaffoldkey = GlobalKey<ScaffoldState>();

  static bool regAutoValid = false;

  static final GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> loginScaffoldkey =
      GlobalKey<ScaffoldState>();
  static bool loginAutoValid = false;
  static final GlobalKey<FormState> passFormKey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> passScaffoldKey =
      GlobalKey<ScaffoldState>();
  static bool passAutoValidate = false;

  static final GlobalKey<FormState> addPageFormKey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> addPageScaffoldkey =
      GlobalKey<ScaffoldState>();
  static bool addPageAutoValid = false;

  static final GlobalKey<FormState> sendMessageFormKey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> sendMessageScaffoldkey =
      GlobalKey<ScaffoldState>();
  static bool sendMessageAutoValid = false;

  static final GlobalKey<FormState> registerPhoneFormKey =
      GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> registerPhoneScaffoldkey =
      GlobalKey<ScaffoldState>();
  static bool registerPhoneAutoValid = false;

  static final GlobalKey<FormState> socialFormKey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> socialScaffoldkey =
      GlobalKey<ScaffoldState>();
  static bool socialAutoValid = false;

  static final TextEditingController userNameController =
      TextEditingController();

  static final TextEditingController lastNameController =
      TextEditingController();
  static final TextEditingController oldPassController =
      TextEditingController();
  static final TextEditingController nameArController = TextEditingController();
  static final TextEditingController nameEnController = TextEditingController();
  static final TextEditingController messageController =
      TextEditingController();
  static final TextEditingController searchController = TextEditingController();
  static final TextEditingController pageNameController =
      TextEditingController();
  static final TextEditingController pagePhoneController =
      TextEditingController();
  static final TextEditingController pageAddressController =
      TextEditingController();
  static final TextEditingController pageAboutController =
      TextEditingController();
  /////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////
  ///
  ///  static final TextEditingController fNameController = TextEditingController();
  static final TextEditingController fNameController = TextEditingController();
  static final TextEditingController lNameController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController phoneController = TextEditingController();
  static final TextEditingController passController = TextEditingController();
  static final TextEditingController confirmPasswordController =
      TextEditingController();

  ///////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////
  static final TextEditingController coupnTilteController =
      TextEditingController();
  static final TextEditingController couponDiscController =
      TextEditingController();
  static final TextEditingController couponAdvController =
      TextEditingController();
  static final TextEditingController couponTermsController =
      TextEditingController();
  static final TextEditingController couponPriceController =
      TextEditingController();
  static final TextEditingController couponDiscontController =
      TextEditingController();
  static final TextEditingController couponFinalPricetController =
      TextEditingController();
  static final TextEditingController chooseTitleController =
      TextEditingController();
  static final TextEditingController choosePriceController =
      TextEditingController();
  static final TextEditingController chooseDiscountController =
      TextEditingController();
  static final TextEditingController chooseFinalPriceController =
      TextEditingController();
  ////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  static final TextEditingController permissionStartDateController =
      TextEditingController();
  static final TextEditingController permissionEndDateController =
      TextEditingController();
  // static final TextEditingController vacationStartCalender =
  //     TextEditingController();
  static final TextEditingController amountController = TextEditingController();

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
  ///
  ///
  ///

  static final TextEditingController vacationBalanceadjustNotesVontroller =
      TextEditingController();
  static final TextEditingController vacationBalanceadjustValueVontroller =
      TextEditingController();
  static final TextEditingController textEditingController =
      TextEditingController();
  static final TextEditingController terminasionNotescontroller =
      TextEditingController();
  static final TextEditingController loanValuecontroller =
      TextEditingController();
  static final TextEditingController payrollValueController =
      TextEditingController();
  static final TextEditingController payrollNotesController =
      TextEditingController();
  static final TextEditingController vacationNotesController =
      TextEditingController();
  static final TextEditingController permissionNotesController =
      TextEditingController();

  static int vacationStartDay;
  static int vacationStartMonth;
  static int vacationStartYear;
  static int vacationEndDay;
  static int vacationEndMonth;
  static int vacationEndYear;
  static String vacationStartCalender;
  static String vacationEndCalender;
  static String permissionDate;

  static String terminasionLastWorkinDayCalender;
}
