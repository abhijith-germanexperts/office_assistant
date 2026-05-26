import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_context/one_context.dart';

enum HttpMethod {
  GET,
  POST,
  PUT,
  DELETE,
  NOTOKENEEDGET,
  NOTOKENNEEDPOST,
  POSTWITHOUTENCODE
}

class ApiService {
  static final ApiService instance = ApiService._internal();
  http.Client? _client;

  ApiService._internal() {
    _client = http.Client();
  }

  // ✅ Global API Key used for every request
  final String apiKey = "a4db08b7-5729-4ba9-8c08-f2df493465a1";

  static final Map<String, DateTime> _lastRequestTimeMap = {};

  void closeAllRequest() async {
    _client?.close();
    _client = null;
  }

  http.Client get client {
    _client ??= http.Client();
    return _client!;
  }

  Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<http.Response> request({
    required String endpoint,
    required HttpMethod method,
    Map<String, dynamic>? body,
    bool? needDefaultBase = false,
    bool preventDuplicates = false,
    int duplicateWindowSeconds = 5,
  }) async {

    // 1️⃣ DUPLICATE REQUEST BLOCKER
    if (preventDuplicates == true) {
      String requestKey = "$endpoint|${body != null ? jsonEncode(body) : ''}";
      DateTime? lastTime = _lastRequestTimeMap[requestKey];
      DateTime now = DateTime.now();

      if (lastTime != null) {
        int difference = now.difference(lastTime).inSeconds;
        if (difference < duplicateWindowSeconds) {
          debugPrint("🛑 DUPLICATE BLOCKED: $requestKey");
          return http.Response(
              jsonEncode({"success": false, "message": "Please wait a moment.", "code": 429}),
              429
          );
        }
      }
      _lastRequestTimeMap[requestKey] = now;
      _lastRequestTimeMap.removeWhere((k, v) => DateTime.now().difference(v).inSeconds > 60);
    }

    debugPrint("API Request - Endpoint: $endpoint");
    http.Response? response;

    try {
      // 2️⃣ NETWORK CHECK
      if (!await isNetworkAvailable()) {
        OneContext().showSnackBar(
            builder: (_) => const SnackBar(
              content: Text("No internet connection. Please Try again."),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 5),
            )
        );
        throw Exception("No internet connection");
      }

      // 3️⃣ EXECUTE CALL
      response = await _makeRequest(endpoint, method, body, needDefaultBase: needDefaultBase ?? false);

      var data = response.body;
      if (data.isEmpty) {
        throw Exception("Response body is empty");
      }

      Map<String, dynamic> responses;
      try {
        responses = json.decode(data);
      } catch (e) {
        responses = {};
      }

      // 4️⃣ GLOBAL ERROR INTERCEPTOR (Catches 401 Missing API Key, 503, 500, etc.)
      if (responses['success'] == false) {
        int errorCode = responses['code'] ?? response.statusCode;
        String errorMessage = responses['message'] ?? 'An unknown error occurred';

        debugPrint('🚨 API Error ($errorCode): $errorMessage');

        OneContext().showSnackBar(
            builder: (_) => SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5),
            )
        );
      }

      return response!;

    } catch (e) {
      debugPrint("API Caught Error: $e");
      rethrow;
    }
  }

  Future<http.Response> _makeRequest(
      String endpoint,
      HttpMethod method,
      Map<String, dynamic>? body, {
        needDefaultBase = false,
      }) async {

    final Uri url = needDefaultBase ? Uri.parse('YOUR_DEFAULT_BASE/$endpoint') : Uri.parse(endpoint);

    // ✅ API Key is always injected here
    final headers = {
      'apikey': apiKey,
      'Content-Type': 'application/json',
    };

    switch (method) {
      case HttpMethod.POSTWITHOUTENCODE:
        return await client.post(url, headers: headers, body: json.encode(body));
      case HttpMethod.POST:
      case HttpMethod.NOTOKENNEEDPOST:
        return await client.post(url, headers: headers, body: jsonEncode(body));
      case HttpMethod.GET:
      case HttpMethod.NOTOKENEEDGET:
        return await client.get(url, headers: headers);
      case HttpMethod.PUT:
        return await client.put(url, headers: headers, body: jsonEncode(body));
      case HttpMethod.DELETE:
        return await client.delete(url, headers: headers);
      default:
        throw Exception("Unsupported HTTP method");
    }
  }
}
// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:one_context/one_context.dart';
//
// enum HttpMethod {
//   GET,
//   POST,
//   PUT,
//   DELETE,
//   NOTOKENEEDGET,
//   NOTOKENNEEDPOST,
//   POSTWITHOUTENCODE
// }
//
// class ApiService {
//   static final ApiService instance = ApiService._internal();
//   http.Client? _client;
//
//   ApiService._internal() {
//     _client = http.Client();
//   }
//
//   // ✅ Only your hardcoded API Key remains
//   final String apiKey = "a4db08b7-5729-4ba9-8c08-f2df493465a1";
//
//   static final Map<String, DateTime> _lastRequestTimeMap = {};
//
//   void closeAllRequest() async {
//     _client?.close();
//     _client = null;
//   }
//
//   http.Client get client {
//     _client ??= http.Client();
//     return _client!;
//   }
//
//   Future<bool> isNetworkAvailable() async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       return false;
//     }
//   }
//
//   Future<http.Response> request({
//     required String endpoint,
//     required HttpMethod method,
//     Map<String, dynamic>? body,
//     bool? needDefaultBase = false,
//     bool preventDuplicates = false,
//     int duplicateWindowSeconds = 5,
//   }) async {
//
//     // 1️⃣ DUPLICATE CHECKER
//     if (preventDuplicates == true) {
//       String requestKey = "$endpoint|${body != null ? jsonEncode(body) : ''}";
//       DateTime? lastTime = _lastRequestTimeMap[requestKey];
//       DateTime now = DateTime.now();
//
//       if (lastTime != null) {
//         int difference = now.difference(lastTime).inSeconds;
//         if (difference < duplicateWindowSeconds) {
//           debugPrint("🛑 DUPLICATE BLOCKED: $requestKey");
//           return http.Response(
//               jsonEncode({"success": false, "message": "Please wait a moment.", "code": 429}),
//               429
//           );
//         }
//       }
//       _lastRequestTimeMap[requestKey] = now;
//       _lastRequestTimeMap.removeWhere((k, v) => DateTime.now().difference(v).inSeconds > 60);
//     }
//
//     debugPrint("API Request - Endpoint: $endpoint");
//     http.Response? response;
//
//     try {
//       if (!await isNetworkAvailable()) {
//         OneContext().showSnackBar(
//             builder: (_) => const SnackBar(
//               content: Text("No internet connection. Please Try again."),
//               backgroundColor: Colors.red,
//               duration: Duration(seconds: 5),
//             )
//         );
//         throw Exception("No internet connection");
//       }
//
//       // 2️⃣ EXECUTE API CALL (API Key is automatically injected in _makeRequest)
//       response = await _makeRequest(endpoint, method, body, needDefaultBase: needDefaultBase ?? false);
//
//       var data = response.body;
//       if (data.isEmpty) {
//         throw Exception("Response body is empty");
//       }
//
//       Map<String, dynamic> responses;
//       try {
//         responses = json.decode(data);
//       } catch (e) {
//         responses = {};
//       }
//
//       // 3️⃣ HANDLE NEW API ERROR RESPONSE (401 Missing/Invalid API Key)
//       if (responses['success'] == false && responses['code'] == 401) {
//         debugPrint('🚨 API Key Error: ${responses['message']}');
//
//         // Show a visual alert to the user that something is broken
//         OneContext().showSnackBar(
//             builder: (_) => SnackBar(
//               content: Text("Authentication Error: ${responses['message']}"),
//               backgroundColor: Colors.red,
//               duration: const Duration(seconds: 5),
//             )
//         );
//       }
//
//       return response!;
//
//     } catch (e) {
//       debugPrint("API Caught Error: $e");
//       rethrow;
//     }
//   }
//
//   Future<http.Response> _makeRequest(
//       String endpoint,
//       HttpMethod method,
//       Map<String, dynamic>? body, {
//         needDefaultBase = false,
//       }) async {
//
//     final Uri url = needDefaultBase ? Uri.parse('YOUR_DEFAULT_BASE/$endpoint') : Uri.parse(endpoint);
//
//     // ✅ API Key is now globally injected into EVERY request
//     final headers = {
//       'apikey': apiKey,
//       'Content-Type': 'application/json',
//     };
//
//     switch (method) {
//       case HttpMethod.POSTWITHOUTENCODE:
//         return await client.post(url, headers: headers, body: json.encode(body));
//       case HttpMethod.POST:
//       case HttpMethod.NOTOKENNEEDPOST: // Merged identical methods
//         return await client.post(url, headers: headers, body: jsonEncode(body));
//       case HttpMethod.GET:
//       case HttpMethod.NOTOKENEEDGET: // Merged identical methods
//         return await client.get(url, headers: headers);
//       case HttpMethod.PUT:
//         return await client.put(url, headers: headers, body: jsonEncode(body));
//       case HttpMethod.DELETE:
//         return await client.delete(url, headers: headers);
//       default:
//         throw Exception("Unsupported HTTP method");
//     }
//   }
// }