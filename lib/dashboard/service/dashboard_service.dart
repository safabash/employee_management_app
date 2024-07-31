import 'dart:convert';
import 'package:employee_management_app/dashboard/model/employees_list_model.dart';
import 'package:http/http.dart' as http;


class DashboardService {
  final String baseUrl = 'https://api.example.com'; // Replace with your API base URL

  Future<EmployeesListModel> fetchEmployees() async {
    final response = await http.get(Uri.parse('$baseUrl/employees'));

    if (response.statusCode == 200) {
      return EmployeesListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load employees');
    }
  }
   Future<EmployeeDetail> fetchEmployeeById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/employee/$id'));

    if (response.statusCode == 200) {
      return EmployeeDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load employee');
    }
  }

  Future<void> createEmployee(String name, String salary, String age) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"name": name, "salary": salary, "age": age}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create employee');
    }
  }

  Future<void> updateEmployee(int id, String name, String salary, String age) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"name": name, "salary": salary, "age": age}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }

  Future<void> deleteEmployee(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/delete/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }
}
