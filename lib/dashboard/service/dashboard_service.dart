import 'dart:convert';
import 'dart:io'; // For HttpException
import 'package:employee_management_app/dashboard/model/employee_detail_response.dart';
import 'package:employee_management_app/dashboard/model/employees_list_model.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  final String baseUrl =
      'https://dummy.restapiexample.com/api/v1'; // Replace with your API base URL
  final int maxRetries = 3; // Maximum number of retry attempts
  final Duration retryDelay = const Duration(seconds: 2); // Initial retry delay

  Future<EmployeesListModel> fetchEmployees() async {
    return _fetchWithRetry(() async {
      final response = await http.get(Uri.parse('$baseUrl/employees'));

      if (response.statusCode == 200) {
        return EmployeesListModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 429) {
        throw RateLimitException('Too many requests');
      } else {
        throw Exception('Failed to load employees');
      }
    });
  }

  Future<EmployeeDetailResponse> fetchEmployeeById(int id) async {
    return _fetchWithRetry(() async {
      final response = await http.get(Uri.parse('$baseUrl/employee/$id'));

      if (response.statusCode == 200) {
        return EmployeeDetailResponse.fromJson(json.decode(response.body));
      } else if (response.statusCode == 429) {
        throw RateLimitException('Too many requests');
      } else {
        throw Exception('Failed to load employee');
      }
    });
  }

  Future<void> createEmployee(String name, String salary, String age) async {
    return _fetchWithRetry(() async {
      final response = await http.post(
        Uri.parse('$baseUrl/create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"name": name, "salary": salary, "age": age}),
      );

      if (response.statusCode != 200) {
        if (response.statusCode == 429) {
          throw RateLimitException('Too many requests');
        } else {
          throw Exception('Failed to create employee');
        }
      }
    });
  }

  Future<void> updateEmployee(
      int id, String name, String salary, String age) async {
    return _fetchWithRetry(() async {
      final response = await http.put(
        Uri.parse('$baseUrl/update/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"name": name, "salary": salary, "age": age}),
      );

      if (response.statusCode != 200) {
        if (response.statusCode == 429) {
          throw RateLimitException('Too many requests');
        } else {
          throw Exception('Failed to update employee');
        }
      }
    });
  }

  Future<void> deleteEmployee(int id) async {
    return _fetchWithRetry(() async {
      final response = await http.delete(
        Uri.parse('$baseUrl/delete/$id'),
      );

      if (response.statusCode != 200) {
        if (response.statusCode == 429) {
          throw RateLimitException('Too many requests');
        } else {
          throw Exception('Failed to delete employee');
        }
      }
    });
  }

  Future<T> _fetchWithRetry<T>(Future<T> Function() fetchFunction) async {
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        return await fetchFunction();
      } on RateLimitException {
        retryCount++;
        if (retryCount >= maxRetries) {
          rethrow; // If max retries reached, throw the exception
        }
        // Wait before retrying
        await Future.delayed(retryDelay * retryCount);
      } catch (e) {
        // For other exceptions, you might want to log or handle them differently
        rethrow;
      }
    }

    // If we exit the loop without returning, throw a generic exception
    throw Exception('Failed after $maxRetries retries');
  }
}

// Custom exception for rate limiting
class RateLimitException implements Exception {
  final String message;
  RateLimitException(this.message);
}
