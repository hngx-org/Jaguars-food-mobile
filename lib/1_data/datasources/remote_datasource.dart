import 'dart:async';
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
    const Duration timeoutDuration = Duration(seconds: 15);
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
      var response = await http
          .post(Uri.parse(baseUrl + postUrl), body: body)
          .timeout(timeoutDuration, onTimeout: () {
        throw TimeoutException('The request timed out');
      });
      return jsonDecode(response.body);
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
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
    const Duration timeoutDuration = Duration(seconds: 15);
    String postUrl = "api/auth/staff/signup";
    Map<String, dynamic> body = {
      "email": orgEmail,
      "otp_token": otpToken,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phoneNumber
    };
    try {
      var response = await http
          .post(Uri.parse(baseUrl + postUrl), body: body)
          .timeout(timeoutDuration, onTimeout: () {
        throw TimeoutException('The request timed out');
      });
      return jsonDecode(response.body);
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }

  static Duration timeoutDuration = const Duration(seconds: 15);
  static Future<Map> login(String email, String password) async {
    // returns {"token": ...} on success
    // returns {"status": "fail", "message": ...} on failure

    String postUrl = "api/auth/login";
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };
    try {
      var response = await http
          .post(Uri.parse(baseUrl + postUrl), body: body)
          .timeout(timeoutDuration, onTimeout: () {
        throw TimeoutException('The request timed out');
      });
      if (response.statusCode == 200) {
        // Successful login
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        return {
          "status": "fail",
          "message": "Login failed. Please check your credentials."
        };
      }
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }

  static Future<Map> staffInvite(String email, token) async {
    // returns {"message":"Invitation sent successfully","statusCode":200} on success
    // returns {"status":"fail","message":"Error: Unauthorized"} on failure

    String postUrl = "api/orgs/invite";
    Map<String, dynamic> body = {"email": email};
    Map<String, String> headers = {"authorization": "Bearer $token"};
    try {
      var response = await http
          .post(Uri.parse(baseUrl + postUrl), headers: headers, body: body)
          .timeout(timeoutDuration, onTimeout: () {
        throw TimeoutException('The request timed out');
      });
      return jsonDecode(response.body);
    } catch (e) {
      return {"status": "fail", "message": "Something went wrong"};
    }
  }

  static Future orgExists(String orgName) async {
    // returns true if an org exists
    // returns false if it doesnt
    // returns {"status": "fail", "message": "something went wrong"} for other issues
    String getUrl = "api/auth/organization/$orgName";
    try {
      var response = await http.get(Uri.parse(baseUrl + getUrl));
      if (response.body == "" || response.statusCode == 200) {
        return true;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }

  static Future loadUser(String token) async {
    // returns user details if success
    // returns false if it doesnt
    // returns {"status": "fail", "message": "something went wrong"} for other issues
    String getUrl = "api/user/profile";
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    try {
      var response = await http.get(
        Uri.parse(baseUrl + getUrl),
        headers: headers,
      );
      return jsonDecode(response.body);
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }

  static Future getUserLunch(String token) async {
    // returns user details if success
    // returns false if it doesnt
    // returns {"status": "fail", "message": "something went wrong"} for other issues
    String getUrl = "api/lunch/";
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    try {
      var response = await http.get(
        Uri.parse(baseUrl + getUrl),
        headers: headers,
      );
      return jsonDecode(response.body);
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }

  static Future searchUser(String token, int userId) async {
    // returns user details if success
    // returns false if it doesnt
    // returns {"status": "fail", "message": "something went wrong"} for other issues
    String getUrl = "api/search/$userId";
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    try {
      var response = await http.get(
        Uri.parse(baseUrl + getUrl),
        headers: headers,
      );
      return jsonDecode(response.body);
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }

  static Future getAllUser(String token) async {
    // returns user details if success
    // returns false if it doesnt
    // returns {"status": "fail", "message": "something went wrong"} for other issues
    String getUrl = "api/users/";
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    try {
      var response = await http.get(
        Uri.parse(baseUrl + getUrl),
        headers: headers,
      );
      return jsonDecode(response.body);
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }

  static Future<Map> forgotPassword(email) async {
    String getUrl = 'api/auth/forgot-password';
    var body = {
      "email": email,
    };
    try {
      var response = await http
          .post(
        Uri.parse(baseUrl + getUrl),
        body: body,
      )
          .timeout(timeoutDuration, onTimeout: () {
        throw TimeoutException('The request timed out');
      });
      return jsonDecode(response.body);
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }

  static Future<Map> resetPassword(email, password, otp) async {
    String getUrl = 'api/auth/reset-password';
    var body = {
      "email": email,
      "password": password, // the new password
      "otp": otp,
    };
    try {
      var response = await http
          .post(
        Uri.parse(baseUrl + getUrl),
        body: body,
      )
          .timeout(timeoutDuration, onTimeout: () {
        throw TimeoutException('The request timed out');
      });
      return jsonDecode(response.body);
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        // Handle other network errors or exceptions
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }
}

class Lunch {
  static Future<Map> sendLunch(
      List<int> receivers, int quantity, String note, String authToken) async {
    String postUrl = "api/lunch/send";
    var headers = {
      "Authorization": "Bearer $authToken",
      "Content-Type": "application/json"
    };
    var body = jsonEncode({
      "receivers": receivers,
      "quantity": quantity,
      "note": note,
    });
    try {
      var response = await http.post(Uri.parse(baseUrl + postUrl),
          headers: headers, body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return {"status": "fail", "message": "Something went wrong $e"};
    }
  }

  static Future<Map> getLunch(authToken) async {
    String getUrl = 'api/lunch/1';
    var headers = {"authorization": "Bearer $authToken"};
    try {
      var response =
          await http.get(Uri.parse(baseUrl + getUrl), headers: headers);
      return jsonDecode(response.body);
    } catch (e) {
      return {"status": "fail", "message": "Something went wrong"};
    }
  }

  static Future redeemLunch(authToken, String id) async {
    String getUrl = "api/user/redeem";
    var body = {
      "lunchId": id,
    };
    var headers = {"authorization": "Bearer $authToken"};
    try {
      var response = await http.post(Uri.parse(baseUrl + getUrl),
          headers: headers, body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return {"status": "fail", "message": "Something went wrong $e"};
    }
  }

  static Future allLunch(authToken) async {
    // returns a list
    String getUrl = "api/lunch";
    var headers = {"authorization": "Bearer $authToken"};
    try {
      var response =
          await http.get(Uri.parse(baseUrl + getUrl), headers: headers);
      return jsonDecode(response.body);
    } catch (e) {
      return [];
    }
  }
}
