class APIEndpoints {
  APIEndpoints();

  String get baseURL {
    //return "https://reconnectApiuat.colliersasia.com/api/";

//    //live Server
//     return "https://reconnectApi.colliersasia.com/api/";
//   for development

    return "http://192.168.3.11:9202/api/";
//  return "https://beta-reconnect-mobileapi.colliersasia.com/api/";


//   for apk
//     return "http://103.208.225.98:9202/api/";

  }
//for build only
  bool get isUser {
    return false;
  }

  //ad auth creentials.............

  //for dev..............................................................................
  // String clientID = '92a370bd-3e3b-4cfb-ba52-5981caddb4b0';
  // String tenantID = '9d9e219e-03e6-423c-aa79-8ed95f108067';
  // String redirectURI = 'msauth://com.colliers.reconnect/LrNW6FTUKBhGMUJ9u9lzzyGqUcs%3D';

  //for uat..............................................................................
  String clientID = '4d7fe1fa-f1d1-44d3-b841-e47e5d80078a';
  String tenantID = '049e3382-8cdc-477b-9317-951b04689668';
  String redirectURI = 'msauth://com.colliers.reconnect/LrNW6FTUKBhGMUJ9u9lzzyGqUcs%3D';



  String get getCardScanKeyword{
    return "GetCardScanKeyword";
  }


  String get loginUser {
    return "token";
  }

  String get crmDashboard {
    return "CRMDashboard";
  }

  String get companyList {
    return "CompanySearch";
  }

  String get watchList {
    return "DashboardWatchlist";
  }

  String get activitiesList {
    return "getDashboardActivityList";
  }

  String get searchActivitiesList {
    return "ActivitySearch";
  }

  String get overdueList {
    return "getDashboardActivityList";
  }

  String get followupsList {
    return "getDashboardActivityList";
  }

  String get buildingsList {
    return "BuildingSearch";
  }
  String get buildingsListFilter {
    return "BuildingSearchFilter";
  }

  String get activityTab {
    return "getModuleActivityList";
  }


  String get activityTabMainList {
    return "getActivitySearch";
  }

  String get activityTabMainHeader {
    return "getActivitySummary";
  }

  String get locationTab {
    return "getCompanyLocationList";
  }

  String get deleteLocation {
    return "deleteCompanyLocation";
  }

  String get deleteRelationship {
    return "deleteRelationship";
  }
  String get contactsTabMain {
    return "apiGetContactList";
  }

  String get contactsTab {
    return "getContactList";
  }

  String get deleteContacts {
    return "deleteContact";
  }

  String get getContactInfo {
    return "editContact";
  }

  String get summaryTab {
    return "getCompanySummary";
  }
  String get ContactSummary {
    return "ContactSummary";
  }

  String get timelineTab {
    return "getTimeLineData";
  }

  String get pursuitTab {
    return "companyPursuit";
  }

  String get getFillList {
    return "GetFillList";
  }

  String get addToWatchList {
    return "AddToWatchList";
  }

  String get removeCompanyWatchlist {
    return "removeCompanyWatchlist";
  }

  String get updateSummaryEdit {
    return "updateSummary";
  }

  String get createContact {
    return "saveContact";
  }

  String get updateContact {
    return "updateContact";
  }

  String get getDuplicateCompany {
    return "getDuplicateCompany";
  }

  String get createActivity {
    return "saveUpdateActivity";
  }

  String get createCompany {
    return "saveCompany";
  }

  String get autoComplete {
    return "AutoComplete";
  }
  String get autoCompleteColName {
    return "AutoCompleteColName";
  }

  String get getActivityInfo {
    return "editActivity";
  }

  String get createTransaction {
    return "saveTransaction";
  }

  String get updateTransaction {
    return "updateTransaction";
  }

  String get deleteActivity {
    return "deleteActivity";
  }

  String get removeOverdue {
    return "RemoveOverdue";
  }

  String get followUpCompleted {
    return "followUpCompleted";
  }

  String get getTransactionInfo {
    return "editTransaction";
  }
  String get apiTransactionEdit {
    return "apiTransactionEdit";
  }

  String get addFloorUnit {
    return "addNewUnit";
  }

  String get getFloorList {
    return "getFloorList";
  }
  String get getStackingPlanList {
    return "getStackingPlanList";
  }

  String get getPropertyData {
    return "getPropertyData";
  }

  String get getPropertyListing{
    return "getPropertyListing";
  }

  String get getListingLeaseDetail{
    return "getListingLeaseDetail";
  }

  String get getListingSaleDetail{
    return "getListingSaleDetail";
  }

  String get getListingCoWorkingDetail{
    return "getListingCoWorkingDetail";
  }
  String get getTransactionTabDetail{
    return "transactionByUnit";
  }

  String get getRelationshipDetail{
    return "getRelationshipDetail";
  }

  String get getTransactionDetail{
    return "getTransactionDetail";
  }

  String get getUnitFilterList {
    return "unitFilterList";
  }

  String get getUnitOccupier {
    return "getUnitOccupier";
  }
  String get apiUnitOccupier {
    return "apiUnitOccupier";
  }

  String get validateTransaction {
    return "validateTransaction";
  }

  String get getUnitTransaction {
    return "getUnitTransaction";
  }

  String get getVerifyContact {
    return "verifyContact";
  }

  String get getUpdateStarActivity {
    return "updateStarActivity";
  }

  String get getUpdateConfidential{
    return "updateConfidential";
  }

  String get getUpdateContactLockDetail{
    return "updateContactLockDetail";
  }

  String get getNewActivity{
    return "newActivity";
  }

  String get getUpdateUserLanguage{
    return "UpdateUserLanguage";
  }

  String get getBuildingInfoHeader{
    return "getPropertyData";
  }

  String get supplyLeaseSearchResult{
    return "supplyLeaseSearchResult";
  }

  String get supplySaleSearchResult{
    return "supplySaleSearchResult";
  }

  String get supplyCoWorkingSearchResult{
    return "supplyCoWorkingSearchResult";
  }
  String get getOptionListData{
    return "getOptionListData";
  }
  String get OptionDetailsData{
    return "OptionDetailsData";
  }

  String get addRelationship {
    return "apiInsertRelationship";
  }
  String get apiDeleteRelationship {
    return "apiDeleteRelationship";
  }
  String get apiInsertUpdateLease {
    return "apiInsertUpdateLease";
  }
  String get apiInsertUpdateSale {
    return "apiInsertUpdateSale";
  }
  String get apiInsertUpdateCoWorking {
    return "apiInsertUpdateCoWorking";
  }


}
