import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/app_strings.dart';
import '../../network/api_Client.dart';
import '../../network/request_option_builder.dart';

//base url of localhost................................
//live Server
// const baseUrl "https://reconnectApi.colliersasia.com/api/";
//for dev
const baseUrl = "http://192.168.3.11:9202/api/";
//for uat...............................................
// const baseUrl = "https://beta-reconnect-mobileapi.colliersasia.com/api/";

const loginUser = 'token';
// const loginUser2 = 'token';
const loginUser2 = 'tokenmanual';
const crmDashboard = 'CRMDashboard';
const companyList = 'CompanySearch';
const pursuitList = 'companyPursuit';
const timelineList = 'getTimeLineData';
const summaryView = 'getCompanySummary';
const contactList = 'getContactList';
const activityList = 'getModuleActivityList';
const updateSummaryInfo = 'updateSummaryEdit';

const searchFilterDropdownURL = 'filter-data';

class MyApiClient {
  final http.Client httpClient;

  MyApiClient({required this.httpClient});

  GetStorage box = GetStorage();
  late SharedPreferences prefs;
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'accept': '*/*'
  };

  // // Create a custom client with a SecurityContext that doesn't validate certificates
  // final client = http.Client(
  //   // Pass a custom SecurityContext with allowBadCertificates set to true
  //   http.SecurityContext(allowBadCertificates: true),
  // );

  getCompanyList(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');
      print(query['ActionID']);
      print(httpClient.post(
          Uri.parse(baseUrl + companyList + '?ActionID=${query['ActionID']}'),
          body: json.encode(mapData),
          headers: headers));

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.companyList,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  createCompany(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      dynamic bodyMapData = {"newCompanyDetail": mapData};
      print('bodyMapData ${bodyMapData.toString()}');
      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
          AppStrings.apiEndpoints.createCompany,
          data: bodyMapData,
          queryParameters: query,
          options: (await AppRequestOptionsBuilder().defaultHeaderWithToken())
              .build());
      print('response createCompany');
      print(response);
      print(response);
      print('response createCompany');
      print(response.data);
      box.write('add_company_res', response);
      box.write('is_redirectFromAdd', 'true');
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return response.statusCode;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getTimelinesList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.timelineTab,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPursuitList(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');
      print(query['ActionID']);
      print(httpClient.post(
          Uri.parse(baseUrl + pursuitList + '?ActionID=${query['ActionID']}'),
          body: json.encode(mapData),
          headers: headers));

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.pursuitTab,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSummaryList(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');
      print(query['ActionID']);
      print(httpClient.post(
          Uri.parse(baseUrl + summaryView + '?ActionID=${query['ActionID']}'),
          body: json.encode(mapData),
          headers: headers));

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.summaryTab,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getContactList(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');
      print(query['ActionID']);
      print(httpClient.post(
          Uri.parse(baseUrl + contactList + '?ActionID=${query['ActionID']}'),
          body: json.encode(mapData),
          headers: headers));

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.contactsTab,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getActivityList(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');
      print(query['ActionID']);
      print(httpClient.post(
          Uri.parse(baseUrl + activityList + '?ActionID=${query['ActionID']}'),
          body: json.encode(mapData),
          headers: headers));

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.activityTab,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      print("activity compant list  : ${response}");
      if (response.statusCode == 200) {
        print("activity compant list  : ${response.data}");
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCompanyRegionalEntityFlag(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getTopTagsList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getMarketSectorList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getAccountManagerList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCompanyAutoComplete(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.autoComplete,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getDuplicateCompanyName(mapData, query) async {
    try {
      // print(query['ActionID']);
      // print(httpClient.post(
      //     Uri.parse(baseUrl + updateSummaryInfo + '?ActionID=${query['ActionID']}'),
      //     body: json.encode(mapData),
      //     headers: headers));

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getDuplicateCompany,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }


  getRegionalEntityFlag(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }




  getEventTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getTeamMemberList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLanguageList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  createActivity(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
          AppStrings.apiEndpoints.createActivity,
          data: mapData,
          queryParameters: query,
          options: (await AppRequestOptionsBuilder().defaultHeaderWithToken())
              .build());
      print('response createActivity');
      print(response);
      print(response.data);
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return response.statusCode;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  deleteContact(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');
      print(query['ContactID']);
      print(httpClient.post(
          Uri.parse(baseUrl + companyList + '?ContactID=${query['ContactID']}'),
          body: json.encode(mapData),
          headers: headers));

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.deleteContacts,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getActivityTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCompanyFillList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getOnBehalfOfList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getActivityStatusList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getFollowUpByList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getContactFillList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPursuitFillList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPropertyFillList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getFillList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        // AppStrings.apiEndpoints.getFillList,
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getEditDetails(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');
      print(query['ActionID']);

      print(httpClient.post(
          Uri.parse(baseUrl +
              summaryView +
              '?ActionId=${query['ActionId']}&&ActivityId=${query['ActivityId']}'),
          body: json.encode(mapData),
          headers: headers));

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getActivityInfo,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  createContact(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
          AppStrings.apiEndpoints.createContact,
          data: mapData,
          queryParameters: query,
          options: (await AppRequestOptionsBuilder().defaultHeaderWithToken())
              .build());
      print('response createContact');
      print(response);
      print(response.data);
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        // return response.statusCode;
        return response.data;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  updateContact(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
          AppStrings.apiEndpoints.updateContact,
          data: mapData,
          queryParameters: query,
          options: (await AppRequestOptionsBuilder().defaultHeaderWithToken())
              .build());
      print('response updateContact');
      print(response);
      print(response.data);
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        // return response.statusCode;
        return response.data;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getEditDetailsContact(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');
      print(query['ActionID']);

      print(httpClient.post(
          Uri.parse(baseUrl + summaryView + '?contactID=${query['contactID']}'),
          body: json.encode(mapData),
          headers: headers));

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getContactInfo,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  addToWatchList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.addToWatchList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  removeToWatchList(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.removeCompanyWatchlist,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  verifyContact(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getVerifyContact,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  updateStarActivity(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');
      print('mapData  ${[json.encode(mapData)].toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getUpdateStarActivity,
        data: json.encode([mapData]),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  updateConfidential(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');
      print('mapData  ${mapData.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getUpdateConfidential,
        data: json.encode([mapData]),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  updateContactLockDetail(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getUpdateContactLockDetail,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  changePassword(user_id, new_password, retype_password) async {
    // try {
    //   Map<String, String> headers = {'Content-type': 'application/json'};
    //
    //   dynamic mapData = {
    //     "new_password" : new_password,
    //     // "retype_password" : retype_password,
    //     "user_id" : user_id
    //   };
    //   print(mapData);
    //   var response = await httpClient.post(
    //       Uri.parse(baseUrl + changePasswordURL),
    //       body: json.encode(mapData),
    //       headers: headers);
    //   if (response.statusCode == 200) {
    //     Map<String, dynamic> jsonResponse = json.decode(response.body);
    //     print(jsonResponse);
    //     return jsonResponse;
    //   } else
    //     print('erro');
    // } catch (e) {
    //   print('exception : ' + e.toString());
    // }
  }

  newActivity(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');
      print('mapData  ${mapData.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getNewActivity,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }
  //
  // login(userName, password, isUser) async {
  //   try {
  //     Map<String, String> headers = {
  //       'Content-type': 'application/json',
  //       'accept': '*/*'
  //     };
  //     dynamic mapData = isUser
  //         ? {"UserName": userName}
  //         : {"UserName": userName, "Password": password};
  //     print('login mapData : ' + mapData.toString());
  //     var url = isUser ? loginUser : loginUser2;
  //     print('login url : ' + baseUrl + url);
  //     var response = await httpClient.post(Uri.parse(baseUrl + url),
  //         body: json.encode(mapData), headers: headers);
  //     print(response.body.toString());
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonResponse = json.decode(response.body);
  //       LoginDTO _loginDTO = LoginDTO.fromJson(jsonResponse);
  //       setUserInfo(_loginDTO, userName, password);
  //       return jsonResponse;
  //     } else
  //       print('erro');
  //   } catch (e) {
  //     print('exception : ' + e.toString());
  //   }
  // }

  loginADAuth(token) async {
    try {
      var Headers = {
        'Content-type': 'application/json',
        "Authorization": "Bearer $token"
      };
      String url = 'https://graph.microsoft.com/v1.0/me/';

      var response = await httpClient.get(Uri.parse(url), headers: Headers);
      print(response.body.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  // setUserInfo(LoginDTO loginDTO, String? userName, String? password) async {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs.setString(AppStrings.token, loginDTO.token);
  //   prefs.setString(AppStrings.loginId, userName!);
  //   prefs.setString(AppStrings.password, password!);
  //   prefs.setString(AppStrings.userName, loginDTO.userName);
  //   prefs.setString(AppStrings.userId, loginDTO.userID.toString());
  //   prefs.setString(AppStrings.countryId, loginDTO.countryID.toString());
  //
  //   prefs.setString(AppStrings.orgSlId, loginDTO.orgSlID.toString());
  //   prefs.setString(AppStrings.pageNo, '0');
  //   if (prefs.getString(AppStrings.lang) == null) {
  //     prefs.setString(AppStrings.lang, loginDTO.lang);
  //   } else {
  //     if (prefs.getString('language_code') == "zh") {
  //       prefs.setString(AppStrings.lang, "zh-CHS");
  //     } else {
  //       prefs.setString(AppStrings.lang, "en-US");
  //     }
  //   }
  // }

  // get search filter data
  getSearchFilterData(user_id) async {
    try {
      Map<String, String> headers = {'Content-type': 'application/json'};

      dynamic mapData = {
        'user_id': user_id,
      };
      var response = await httpClient.post(
          Uri.parse(baseUrl + searchFilterDropdownURL),
          body: json.encode(mapData),
          headers: headers);
      if (response.statusCode == 200) {
        Map<dynamic, dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getKeyActivityList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getContactTabDasList(mapData) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData  ${mapData.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.contactsTabMain,
        data: json.encode(mapData),
        //queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCardScanKeyword(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getCardScanKeyword,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getContactTabSummaryList(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.ContactSummary,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  followUpCompleted(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.followUpCompleted,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  updateUserLanguage(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getUpdateUserLanguage,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getFindepartmentList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCountryList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getProgressList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getOfficeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getBuildingsList(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.buildingsList,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUnitsListData(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFloorList,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getStackingPlanListData(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getStackingPlanList,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getListingsListData(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getPropertyListing,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getRelationshipsListData(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getRelationshipDetail,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getTransactionsListData(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getTransactionDetail,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSelectCityList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getMacroMarketList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getMicroMarketList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  addNewUnit(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.addFloorUnit,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  addNewRelationship(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      // print('mapData ${mapData.toString()}');
      // print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.addRelationship,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUnitAreaList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUnitStatusList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getMeasurementTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUnitConditionList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUnitUsageList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getFloorNoList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUnitNoList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getAreaUnitList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getAreaTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getTransactionTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getTransactorList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCurrenyList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUnitOccupier(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.apiUnitOccupier,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getEditTransactionList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.apiTransactionEdit,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getListingDetails(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getAreaList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getRegionList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getRentList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPropertyClassList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getEfficiencyList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getAvailableDataList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getOperatingChargesList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLumpsumSaleList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getFloorPlateList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getTransactionInfo,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getInclusionsList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSeatAvailableList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPezaList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCostPerMonthList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getDateOfAvailabilityList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCommonAreaChargesList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getDivisibleList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getOwnershipList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getHandoverConditionList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLeaseTermList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSubLeaseList(query)async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  get24x7List(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getAcceptOnlineGamingList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getAvailableRangeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCreatedRangeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getYearBuiltList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUpdatedRangeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getListingStatusList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPropertyTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPropertSubTypeList(query)  async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUnitViewList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUtilitiesRegularOfficeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getFacilityProviderList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUtilitiesAfterOfficeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getUseOfReceptionAreaList(query)  async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSecurityList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getMaintenanceList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getInternetList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getHardPhoneList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSoftPhoneList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getKitchenList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getWorkstationsTablesList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getChairsList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getComputersList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getFacilityTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getDeveloperComplete(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.autoComplete,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPropertyListingAutoComplete(query)  async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.autoComplete,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getCityListingAutoComplete(query)  async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.autoComplete,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLeaseCityList(query)  async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLeaseMacroMarketList(query)   async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLeaseMicroMarketList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getAvailabilityTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLeaseListingStatusList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLeaseListingSourceList(query)async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLeaseListingTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getLeaseSubLeaseList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getRentFreeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getListingTypeList(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPropertyDataHeader(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getPropertyData,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getListingsLeaseData(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getListingLeaseDetail,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getListingsSaleData(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getListingSaleDetail,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getListingsCoWorkingData(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getListingCoWorkingDetail,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getPropertyNameAutoComplete(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.autoComplete,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getBuildingExpertList(query)async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSupplyLeaseSearchResultList(mapData) async {
    try {
      prefs = await SharedPreferences.getInstance();
      // print('query  ${query.toString()}');
      print('mapData  ${mapData.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.supplyLeaseSearchResult,
        data: json.encode(mapData),
        // queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSupplySaleSearchResultList(mapData)async {
    try {
      prefs = await SharedPreferences.getInstance();
      // print('query  ${query.toString()}');
      print('mapData  ${mapData.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.supplySaleSearchResult,
        data: json.encode(mapData),
        // queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSupplyCoWorkingSearchResultList(mapData) async {
    try {
      prefs = await SharedPreferences.getInstance();
      // print('query  ${query.toString()}');
      print('mapData  ${mapData.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.supplyCoWorkingSearchResult,
        data: json.encode(mapData),
        // queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getSortByList(query)async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  TransactionTabList(mapData) async {
    try {
      prefs = await SharedPreferences.getInstance();

      print('mapData  ${mapData.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getTransactionTabDetail,
        data: json.encode(mapData),
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getBuildingsListFliter(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.buildingsListFilter,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getClientName(query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.autoComplete,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getOptionSharing(query)  async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.autoComplete,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getOptionDataList(mapData, query)async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getOptionListData,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getOptionDetailsDataList(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.OptionDetailsData,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  companyRelationshipTypeContainer(query)async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  dropdownList(query)async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  deleteListing(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  deleteRelationship(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.apiDeleteRelationship,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  getAutoCompleteList(Map<String, dynamic> query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.autoCompleteColName,
        //data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  reportContainer(Map<String, dynamic> query) async{
    try {
      prefs = await SharedPreferences.getInstance();
      // print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.getFillList,
        // data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  insertListingLease(mapData, query)async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.apiInsertUpdateLease,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  insertListingSale(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.apiInsertUpdateSale,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }

  insertListingCoWorking(mapData, query) async {
    try {
      prefs = await SharedPreferences.getInstance();
      print('mapData ${mapData.toString()}');
      print('query  ${query.toString()}');

      ApiClient apiClient = ApiClient.defaultClient();
      var response = await apiClient.dioClient.post(
        AppStrings.apiEndpoints.apiInsertUpdateCoWorking,
        data: json.encode(mapData),
        queryParameters: query,
        options:
        (await AppRequestOptionsBuilder().defaultHeaderWithToken()).build(),
      );
      if (response.statusCode == 200) {
        dynamic jsonResponse = response.data;
        return jsonResponse;
      } else
        print('erro');
    } catch (e) {
      print('exception : ' + e.toString());
    }
  }
}
