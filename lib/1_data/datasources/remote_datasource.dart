import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "https://jaguars-food-backend.vercel.app/";

class Auth {
  static Future<Map> signUpAdmin(

      // returns {"message":"Account created", "data": ...} on success
      // returns {"status":"fail", "message": ...} on failure

      String orgName,
      int lunchPrice,
      String currency,
      String currencyCode,
      String orgEmail,
      String password,
      String firstName,
      String lastName,
      String phoneNumber) async {
    String postUrl = "api/auth/user/signup";
    Map<String, dynamic> body = {
      "organization_name": orgName,
      "lunch_price": '$lunchPrice',
      "currency": currency,
      "currency_code": currencyCode,
      "email": orgEmail,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phoneNumber
    };
    try {
      var response = await http.post(Uri.parse(baseUrl + postUrl), body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return {"status": "fail", "message": 'Something went wrong '};
    }
  }

  static Future<Map> signUpStaff(

      // returns {"message":"Signup Successful","signUp": ...} on success
      // returns {"message": ... ,"error": ...} on failure

      String orgEmail,
      String otpToken,
      String password,
      String firstName,
      String lastName,
      String phoneNumber) async {
    String postUrl = "api/auth/organization/staff/signup";
    Map<String, dynamic> body = {
      "email": orgEmail,
      "otp_token": otpToken,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phoneNumber
    };
    try {
      var response = await http.post(Uri.parse(baseUrl + postUrl), body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return {"status": 'fail', "message": 'something went wrong'};
    }
  }

  static Future<Map> login(String email, String password) async {
    // returns {"token": ...} on success
    // returns {"status": "fail", "message": ...} on failure

    String postUrl = "api/auth/login";
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };
    try {
      var response = await http.post(Uri.parse(baseUrl + postUrl), body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return {"status": "fail", "message": 'something went wrong'};
    }
  }

  static Future<Map> staffInvite(String email, token) async {
    // returns {"message":"Invitation sent successfully","statusCode":200} on success
    // returns {"status":"fail","message":"Error: Unauthorized"} on failure

    String postUrl = "api/orgs/invite";
    Map<String, dynamic> body = {"email": email};
    Map<String, String> headers = {"authorization": "Bearer $token"};
    try {
      var response = await http.post(Uri.parse(baseUrl + postUrl),
          headers: headers, body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return {"status": "fail", "message": "something went wrong"};
    }
  }
}

class Lunch{

  static Future<Map> sendLunch(List<int> receivers, int quantity, String note, String authToken) async{
    String postUrl = "api/lunch/send";
    var headers = {
      "authorization": "Bearer $authToken"
    };
    var body = {
      "receivers": '$receivers',
      "quantity": '$quantity',
      "note": note
    };
    try{
      var response = await http.post(
        Uri.parse(baseUrl + postUrl),
        headers: headers,
        body: body
      );
        return jsonDecode(response.body);
    } catch (e){
      return {"status": "fail", "message": "something went wrong"};
    }
  }

  static Future<Map> getLunch(authToken) async {
    String getUrl = 'api/lunch/1';
    var headers = {
      "authorization": "Bearer $authToken"
    };
    try{
      var response = await http.get(
        Uri.parse(baseUrl + getUrl),
        headers: headers
      );
      return jsonDecode(response.body);
    } catch(e){
      return {"status": "fail", "message": "something went wrong"};
    }
  }

  static Future redeemLunch(authToken) async {
    String getUrl = "api/redeem/1";
    var headers = {
      "authorization": "Bearer $authToken"
    };
    try{
      var response = await http.get(
        Uri.parse(baseUrl + getUrl),
        headers: headers
      );
      return jsonDecode(response.body);
    } catch(e){
      return {"status": "fail", "message": "something went wrong"};
    }
  }

  static Future allLunch(authToken) async {
    String getUrl = "api/lunch";
    var headers = {
      "authorization": "Bearer $authToken"
    };
    try{
      var response = await http.get(
        Uri.parse(baseUrl + getUrl),
        headers: headers
      );
      return jsonDecode(response.body);
    } catch(e){
      return {"status": "fail", "message": "something went wrong"};
    }
  }
}

