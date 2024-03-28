

import 'api_Endpoints.dart';

class AppStrings {
  // static final errorMessages = ErrorMessages();
  // static final textFieldConstant = InputFields();
  // static final appTitle = AppTitle();
  // static final appSubTitle = AppSubTitle();
  // static final buttons = Buttons();
  static final apiEndpoints = APIEndpoints();
  // static final appActionId = AppActionId();

  static String  companyNameDashboard = 'companyName';
  static String companyNameLocalDashboard = 'companyNameLocal';


  static String success = "Success";
  static String failure = "Failure";

  static String token = 'token';
  static String userName = 'userName';
  static String password = 'password';
  static String userId = 'userId';
  static String countryId = 'countryId';
  static String moduleid = 'moduleid';
  static String lang = 'lang';
  static String orgSlId = 'orgSlId';
  static String comId = 'comId';
  static String loginId = 'loginId';
  static String pageNo = 'pageNo';
  static String refTable = 'refTable';
  static String refTableContact = 'refTableContact';
  static String totalRecordContact = 'totalRecordContact';
  static String refTableactivitiesTab = 'refTableactivitiesTab';
  static String totalRecordactivitiesTab = 'totalRecordactivitiesTab';

  static String totalRecord = 'totalRecord';
  static String companyID = 'companyID';
  static String companyNameLogin = 'companyNameSelected';
  static String companyName = 'companyNameSelected';
  static String contactIDSelected = 'contactID';
  static String contactNameSelected = 'contactNameSelected';
  static String activeCompanytabName = 'activeCompanytabName';
  static String companyNameOnlyControllerClear = 'companyNameOnlyControllerClear';

  static const String okay = "OK";

  static const int summeryScreen = 0;
  static const int contactScreen = 1;
  static const int activityScreen = 2;
  static const int locationScreen = 3;

  static const int create = 0;
  static const int edit = 1;

  static const String myAccountCard = "MYACCOUNTCARD";
  static const String buildingCard = "BUILDINGCARD";
  static const String activityCard = "ACTIVITYCARD";
  static const String contactCard = "CONTACTCARD";
  static const String locationCard = "LOCATIONCARD";

  static const String dropDownHintText = "Select";
  static const String buildingInfoCard = "buildingInfoCard";
  static const String buildingOccupanyDetailCard = "buildingOccupanyDetailCard";



  static const int dashboardFlag = 1;
  static const int buildingFlag = 2;
  static const int companyFlag = 3;


  static const dashboardUrl =
      "https://app.powerbi.com/view?r=eyJrIjoiODAxMGNhZTQtZjU0Yi00ZDU0LTk0MzEtNzRkMWIzMjViMGJmIiwidCI6IjA0OWUzMzgyLThjZGMtNDc3Yi05MzE3LTk1MWIwNDY4OTY2OCIsImMiOjZ9";

  static const websiteUrl = "https://reconnect.colliersasia.com/login";
  static const sharePointUrl =
      "https://colliers.sharepoint.com/teams/asia_colliers_connected/SitePages/REConnect.aspx";

  //validation messages................
  static const String search_pop_message =
      "Please select atleast one field for search.";
  static const String company_validate_message = "Please enter company name.";
  static const String regional_validate_message =
      "Please select regional entity flag.";
  static const String country_validate_message = "Please select country.";
  static const String websiteUrl_validate_message = "Invalid Web Url.";
  static const String first_name_validate_message = "Please enter first name.";
  static const String last_name_validate_message = "Please enter last name.";
  static const String email_validate_message = "Please enter proper Email-ID.";
  static const String mobile_validate_message = "Please enter mobile no.";

  // Activity Validation Messages
  static const String activity_company_validate_message ="Please select Company";
  static const String activity_contact_validate_message ="Please select Contact";
  static const String activity_property_validate_message ="Please select Property";

  static const String activity_date_validate_message ="Please select activity date";
  static const String activity_type_validate_message =
      "Please select activity type";
  static const String activity_notes_validate_message =
      "Please enter activity notes";
  static const String activity_notes_validate_length =
      "Please enter activity notes with alteast 5 character";

  // Transaction Validation Messages
  static const String transaction_floor_no_validate_message =
      "Please enter floor no.";
  static const String transaction_unit_no_validate_message =
      "Please enter unit no.";
  static const String transaction_unit_no_max_length_validate_message =
      "Unit no cannot be greater than 10.";
  static const String transaction_date_validate_message =
      "Please enter transaction date.";
  static const String transaction_curreny_select_validate_message =
      "Please select currency type.";
  static const String transaction_rent_validate_message = "Please enter rent.";

  static const String emailPattern =
      "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})";



}
// TODO Implement this library.