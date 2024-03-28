import 'package:meta/meta.dart';

// import '../provider/api.dart';
import '../provider/api.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({required this.apiClient}) : assert(apiClient != null);

  // login(email, password,isUser) {
  //   return apiClient.login(email, password,isUser);
  // }

  loginADAuth(token) {
    return apiClient.loginADAuth(token);
  }

  changePassword(user_id, new_password, retype_password) {
    return apiClient.changePassword(user_id, new_password, retype_password);
  }

  getCompanyList(mapData, query) {
    return apiClient.getCompanyList(mapData, query);
  }

  createCompany(mapData, query) {
    return apiClient.createCompany(mapData, query);
  }

  getTimelinesList(query) {
    return apiClient.getTimelinesList(query);
  }

  getPursuitList(mapData, query) {
    return apiClient.getPursuitList(mapData, query);
  }

  getSummaryList(mapData, query) {
    return apiClient.getSummaryList(mapData, query);
  }

  getContactTabSummaryList(mapData, query) {
    return apiClient.getContactTabSummaryList(mapData, query);
  }

  getContactList(mapData, query) {
    return apiClient.getContactList(mapData, query);
  }

  getActivityList(mapData, query) {
    return apiClient.getActivityList(mapData, query);
  }

  getCompanyRegionalEntityFlag(query) {
    return apiClient.getCompanyRegionalEntityFlag(query);
  }

  getTopTagsList(query) {
    return apiClient.getTopTagsList(query);
  }

  getMarketSectorList(query) {
    return apiClient.getMarketSectorList(query);
  }

  getAccountManagerList(query) {
    return apiClient.getAccountManagerList(query);
  }

  getEventTypeList(query) {
    return apiClient.getEventTypeList(query);
  }

  getTeamMemberList(query) {
    return apiClient.getTeamMemberList(query);
  }

  getDuplicateCompanyName(mapData, query) {
    return apiClient.getDuplicateCompanyName(mapData, query);
  }

  getCompanyAutoComplete(query) {
    return apiClient.getCompanyAutoComplete(query);
  }

  // updateSummaryInfo(mapData, query) {
  //   return apiClient.updateSummaryInfo(mapData, query);
  // }

  getRegionalEntityFlag(query) {
    return apiClient.getRegionalEntityFlag(query);
  }

  // getActivitiesTabList(mapData, query) {
  //   return apiClient.getActivitiesTabList(mapData, query);
  // }

  // getActivitiesTabHeader(mapData) {
  //   return apiClient.getActivitiesTabHeader(mapData);
  // }

  createActivity(mapData, query) {
    return apiClient.createActivity(mapData, query);
  }

  getActivityTypeList(query) {
    return apiClient.getActivityTypeList(query);
  }

  getCompanyFillList(query) {
    return apiClient.getCompanyFillList(query);
  }

  getContactFillList(query) {
    return apiClient.getContactFillList(query);
  }

  getPursuitFillList(query) {
    return apiClient.getPursuitFillList(query);
  }

  getPropertyFillList(query) {
    return apiClient.getPropertyFillList(query);
  }

  getOnBehalfOfList(query) {
    return apiClient.getOnBehalfOfList(query);
  }

  getActivityStatusList(query) {
    return apiClient.getActivityStatusList(query);
  }

  getFollowUpByList(query) {
    return apiClient.getFollowUpByList(query);
  }

  getFillList(query) {
    return apiClient.getFillList(query);
  }

  getLanguageList(query) {
    return apiClient.getLanguageList(query);
  }

  getEditDetails(mapData, query) {
    return apiClient.getEditDetails(mapData, query);
  }
  deleteContact(mapData, query) {
    return apiClient.deleteContact(mapData, query);
  }
  createContact(mapData, query) {
    return apiClient.createContact(mapData, query);
  }

  updateContact(mapData, query) {
    return apiClient.updateContact(mapData, query);
  }

  getEditDetailsContact(mapData, query) {
    return apiClient.getEditDetailsContact(mapData, query);
  }

  getSearchFilterData(user_id) {
    return apiClient.getSearchFilterData(user_id);
  }

  getKeyActivityList(query) {
    return apiClient.getKeyActivityList(query);
  }

  addToWatchList(query) {
    return apiClient.addToWatchList(query);
  }

  removeToWatchList(mapData, query) {
    return apiClient.removeToWatchList(mapData,query);
  }

  verifyContact(query) {
    return apiClient.verifyContact(query);
  }

  updateStarActivity(mapData, query) {
    return apiClient.updateStarActivity(mapData, query);
  }

  updateConfidential(mapData, query) {
    return apiClient.updateConfidential(mapData, query);
  }

  getContactTabDasList(mapData) {
    return apiClient.getContactTabDasList(mapData);
  }


  getCardScanKeyword(query) {
    return apiClient.getCardScanKeyword(query);
  }

  updateContactLockDetail(query) {
    return apiClient.updateContactLockDetail(query);
  }

  newActivity(mapData, query) {
    return apiClient.newActivity(mapData, query);
  }

  followUpCompleted(query) {
    return apiClient.followUpCompleted(query);
  }

  updateUserLanguage(query) {
    return apiClient.updateUserLanguage(query);
  }

  getFindepartmentList(query) {
    return apiClient.getFindepartmentList(query);
  }

  getCountryList( query) {
    return apiClient.getCountryList(query);
  }

  getProgressList( query) {
    return apiClient.getProgressList(query);
  }

  getOfficeList(query) {
    return apiClient.getOfficeList(query);
  }

  getBuildingsList(mapData, query) {
    return apiClient.getBuildingsList(mapData, query);
  }

  getUnitsListData(mapData, query) {
    return apiClient.getUnitsListData(mapData, query);
  }
  getStackingPlanListData(mapData, query) {
    return apiClient.getStackingPlanListData(mapData, query);
  }

  getListingsListData(mapData,query) {
    return apiClient.getListingsListData(mapData, query);
  }

  getRelationshipsListData(mapData,query) {
    return apiClient.getRelationshipsListData(mapData, query);
  }

  getTransactionsListData(mapData, query) {
    return apiClient.getTransactionsListData(mapData, query);
  }

  getSelectCityList(query) {
    return apiClient.getSelectCityList(query);
  }

  getMacroMarketList(query) {
    return apiClient.getMacroMarketList(query);
  }

  getMicroMarketList(query) {
    return apiClient.getMicroMarketList(query);
  }

  addNewUnit(mapData, query) {
    return apiClient.addNewUnit(mapData, query);
  }

  addNewRelationship(mapData, query) {
    return apiClient.addNewRelationship(mapData, query);
  }

  getUnitAreaList(query) {
    return apiClient.getUnitAreaList(query);
  }

  getUnitStatusList(query) {
    return apiClient.getUnitStatusList(query);
  }

  getMeasurementTypeList(query) {
    return apiClient.getMeasurementTypeList(query);
  }

  getUnitConditionList(query) {
    return apiClient.getUnitConditionList(query);
  }

  getUnitUsageList(query) {
    return apiClient.getUnitUsageList(query);
  }

  getFloorNoList( query) {
    return apiClient.getFloorNoList(query);
  }

  getUnitNoList(query) {
    return apiClient.getUnitNoList(query);
  }

  getAreaUnitList(query) {
    return apiClient.getAreaUnitList(query);
  }

  getAreaTypeList(query) {
    return apiClient.getAreaTypeList(query);
  }

  getTransactionTypeList(query) {
    return apiClient.getTransactionTypeList(query);
  }

  getTransactorList(query) {
    return apiClient.getTransactorList(query);
  }

  getCurrenyList(query) {
    return apiClient.getCurrenyList(query);
  }

  getUnitOccupier(mapData, query) {
    return apiClient.getUnitOccupier(mapData, query);
  }

  getEditTransactionList(query) {
    return apiClient.getEditTransactionList(query);
  }



  getListingDetails(mapData, query) {
    return apiClient.getListingDetails(mapData, query);
  }


  getAreaList(query) {
    return apiClient.getAreaList(query);
  }

  getRegionList( query) {
    return apiClient.getRegionList(query);
  }

  getRentList(query) {
    return apiClient.getRentList(query);
  }

  getPropertyClassList(query) {
    return apiClient.getPropertyClassList(query);
  }

  getEfficiencyList(query) {
    return apiClient.getEfficiencyList(query);
  }

  getAvailableDataList(query) {
    return apiClient.getAvailableDataList(query);
  }

  getOperatingChargesList(query) {
    return apiClient.getOperatingChargesList(query);
  }

  getLumpsumSaleList( query) {
    return apiClient.getLumpsumSaleList(query);
  }

  getFloorPlateList(query) {
    return apiClient.getFloorPlateList(query);
  }

  getInclusionsList( query) {
    return apiClient.getInclusionsList(query);
  }

  getSeatAvailableList( query) {
    return apiClient.getSeatAvailableList(query);
  }

  getPezaList( query) {
    return apiClient.getPezaList(query);
  }

  getCostPerMonthList(query) {
    return apiClient.getCostPerMonthList(query);
  }

  getDateOfAvailabilityList(query) {
    return apiClient.getDateOfAvailabilityList(query);
  }

  getCommonAreaChargesList( query) {
    return apiClient.getCommonAreaChargesList(query);
  }

  getDivisibleList(query) {
    return apiClient.getDivisibleList(query);
  }

  getOwnershipList( query) {
    return apiClient.getOwnershipList(query);
  }

  getHandoverConditionList(query) {
    return apiClient.getHandoverConditionList(query);
  }

  getLeaseTermList( query) {
    return apiClient.getLeaseTermList(query);
  }

  getSubLeaseList(query) {
    return apiClient.getSubLeaseList(query);
  }

  get24x7List( query) {
    return apiClient.get24x7List(query);
  }

  getAcceptOnlineGamingList(query) {
    return apiClient.getAcceptOnlineGamingList(query);
  }

  getAvailableRangeList( query) {
    return apiClient.getAvailableRangeList(query);
  }
  getCreatedRangeList( query) {
    return apiClient.getAvailableRangeList(query);
  }

  getYearBuiltList(query) {
    return apiClient.getYearBuiltList(query);
  }

  getUpdatedRangeList(query) {
    return apiClient.getUpdatedRangeList(query);
  }

  getListingStatusList(query) {
    return apiClient.getListingStatusList(query);
  }

  getPropertyTypeList( query) {
    return apiClient.getPropertyTypeList(query);
  }

  getPropertSubTypeList( query) {
    return apiClient.getPropertSubTypeList(query);
  }

  getUnitViewList( query) {
    return apiClient.getUnitViewList(query);
  }

  getUtilitiesRegularOfficeList(query) {
    return apiClient.getUtilitiesRegularOfficeList(query);
  }

  getFacilityProviderList(query) {
    return apiClient.getFacilityProviderList(query);
  }

  getUtilitiesAfterOfficeList(query) {
    return apiClient.getUtilitiesAfterOfficeList(query);
  }

  getUseOfReceptionAreaList(query) {
    return apiClient.getUseOfReceptionAreaList(query);
  }

  getSecurityList(query) {
    return apiClient.getSecurityList(query);
  }

  getMaintenanceList(query) {
    return apiClient.getMaintenanceList(query);
  }

  getInternetList(query) {
    return apiClient.getInternetList(query);
  }

  getHardPhoneList(query) {
    return apiClient.getHardPhoneList(query);
  }

  getSoftPhoneList(query) {
    return apiClient.getSoftPhoneList(query);
  }

  getKitchenList(query) {
    return apiClient.getKitchenList(query);
  }

  getWorkstationsTablesList(query) {
    return apiClient.getWorkstationsTablesList(query);
  }

  getChairsList(query) {
    return apiClient.getChairsList(query);
  }

  getComputersList(query) {
    return apiClient.getComputersList(query);
  }

  getFacilityTypeList(query) {
    return apiClient.getFacilityTypeList(query);
  }

  getDeveloperComplete( query) {
    return apiClient.getDeveloperComplete(query);
  }

  getPropertyListingAutoComplete(query) {
    return apiClient.getPropertyListingAutoComplete(query);
  }

  getCityListingAutoComplete(query) {
    return apiClient.getCityListingAutoComplete(query);
  }

  getLeaseCityList(query) {
    return apiClient.getLeaseCityList(query);
  }

  getLeaseMacroMarketList( query) {
    return apiClient.getLeaseMacroMarketList(query);
  }

  getLeaseMicroMarketList(query) {
    return apiClient.getLeaseMicroMarketList(query);
  }

  getAvailabilityTypeList( query) {
    return apiClient.getAvailabilityTypeList(query);
  }

  getLeaseListingStatusList(query) {
    return apiClient.getLeaseListingStatusList(query);
  }

  getLeaseListingSourceList( query) {
    return apiClient.getLeaseListingSourceList(query);
  }

  getLeaseListingTypeList(query) {
    return apiClient.getLeaseListingTypeList(query);
  }

  getLeaseSubLeaseList(query) {
    return apiClient.getLeaseSubLeaseList(query);
  }

  getRentFreeList( query) {
    return apiClient.getRentFreeList(query);
  }

  getListingTypeList(query) {
    return apiClient.getListingTypeList(query);
  }

  getPropertyDataHeader(mapData, query) {
    return apiClient.getPropertyDataHeader(mapData, query);
  }

  getListingsLeaseData( mapData, query) {
    return apiClient.getListingsLeaseData(mapData, query);
  }

  getListingsSaleData(mapData, query) {
    return apiClient.getListingsSaleData(mapData, query);
  }

  getListingsCoWorkingData( mapData, query) {
    return apiClient.getListingsCoWorkingData(mapData, query);
  }

  getPropertyNameAutoComplete( query) {
    return apiClient.getPropertyNameAutoComplete(query);
  }

  getBuildingExpertList( query) {
    return apiClient.getBuildingExpertList(query);
  }

  getSupplyLeaseSearchResultList( mapData) {
    return apiClient.getSupplyLeaseSearchResultList(mapData);
  }

  getSupplySaleSearchResultList( mapData) {
    return apiClient.getSupplySaleSearchResultList(mapData);
  }

  getSupplyCoWorkingSearchResultList(mapData) {
    return apiClient.getSupplyCoWorkingSearchResultList(mapData);
  }

  getSortByList(query) {
    return apiClient.getSortByList(query);
  }

  TransactionTabList( mapData) {
    return apiClient.TransactionTabList( mapData);
  }

  getBuildingsListFliter(mapData,query) {
    return apiClient.getBuildingsListFliter( mapData,query);
  }

  getClientName( query) {
    return apiClient.getClientName(query);
  }

  getOptionSharing(query) {
    return apiClient.getOptionSharing(query);
  }

  getOptionDataList(mapData,query) {
    return apiClient.getOptionDataList(mapData, query);
  }

  getOptionDetailsDataList( mapData,  query) {
    return apiClient.getOptionDetailsDataList(mapData, query);
  }

  companyRelationshipTypeContainer(query) {
    return apiClient.companyRelationshipTypeContainer(query);
  }

  dropdownList(query) {
    return apiClient.dropdownList(query);
  }


  deleteListing( mapData, query) {
    return apiClient.deleteListing(mapData, query);
  }
  deleteRelationship( mapData, query) {
    return apiClient.deleteRelationship(mapData, query);
  }

  getAutoCompleteList(Map<String, dynamic> query) {
    return apiClient.getAutoCompleteList(query);
  }

  reportContainer(Map<String, dynamic> query) {
    return apiClient.reportContainer(query);
  }

  insertListingLease( mapData,query) {
    return apiClient.insertListingLease(mapData, query);
  }
  insertListingSale( mapData,query) {
    return apiClient.insertListingSale(mapData, query);
  }
  insertListingCoWorking( mapData,query) {
    return apiClient.insertListingCoWorking(mapData, query);
  }




}
