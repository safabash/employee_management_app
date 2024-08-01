import 'dart:developer';

import 'package:employee_management_app/shared/utils/snackbar_utils.dart';
import 'package:get/get.dart';

import 'package:employee_management_app/dashboard/model/employees_list_model.dart';
import 'package:employee_management_app/dashboard/service/dashboard_service.dart'; // Update import as per your file structure

class DashboardController extends GetxController {
  var employees = <EmployeeDetail>[].obs;
  var isLoading = true.obs;
  final DashboardService dashboardService = DashboardService();
  var employee = EmployeeDetail(
    id: 0,
    employeeName: '',
    employeeSalary: 0,
    employeeAge: 0,
    profileImage: '',
  ).obs;

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  Future<void> fetchEmployees() async {
    try {
      isLoading(true);
      EmployeesListModel fetchedEmployees =
          await dashboardService.fetchEmployees();
      employees.assignAll(fetchedEmployees.data);
    } on RateLimitException {
      SnackbarUtil.showErrorSnackbar(
        'Rate Limit Exceeded',
        'You have made too many requests. Please try again later.',
      );
    } catch (e) {
      SnackbarUtil.showErrorSnackbar(
        'Error',
        'Failed to fetch employees. Please try again later.',
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchEmployeeById(int id) async {
    try {
      isLoading(true);
      final response = await dashboardService.fetchEmployeeById(id);
      EmployeeDetail fetchedEmployee = response.data;
      employee.value = fetchedEmployee;
      log(fetchedEmployee.employeeName);
    } on RateLimitException {
      SnackbarUtil.showErrorSnackbar(
        'Rate Limit Exceeded',
        'You have made too many requests. Please try again later.',
      );
    } catch (e) {
      SnackbarUtil.showErrorSnackbar(
        'Error',
        'Failed to fetch employee. Please try again later.',
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> createEmployee(String name, String salary, String age) async {
    try {
      isLoading(true);
      await dashboardService.createEmployee(name, salary, age);
      await fetchEmployees(); // Refetch employees to include the new one
      SnackbarUtil.showSuccessSnackbar(
        'Success',
        'Employee created successfully',
      );
    } on RateLimitException {
      SnackbarUtil.showErrorSnackbar(
        'Rate Limit Exceeded',
        'You have made too many requests. Please try again later.',
      );
    } catch (e) {
      SnackbarUtil.showErrorSnackbar(
        'Error',
        'Failed to create employee. Please try again later.',
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateEmployee(
      int id, String name, String salary, String age) async {
    try {
      isLoading(true);
      await dashboardService.updateEmployee(id, name, salary, age);
      await fetchEmployees(); // Refetch employees to include the updated one
      SnackbarUtil.showSuccessSnackbar(
        'Success',
        'Employee updated successfully',
      );
    } on RateLimitException {
      SnackbarUtil.showErrorSnackbar(
        'Rate Limit Exceeded',
        'You have made too many requests. Please try again later.',
      );
    } catch (e) {
      SnackbarUtil.showErrorSnackbar(
        'Error',
        'Failed to update employee. Please try again later.',
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteEmployee(int id) async {
    try {
      isLoading(true);
      await dashboardService.deleteEmployee(id);
      await fetchEmployees(); // Refetch employees to exclude the deleted one
      SnackbarUtil.showSuccessSnackbar(
        'Success',
        'Employee deleted successfully',
      );
    } on RateLimitException {
      SnackbarUtil.showErrorSnackbar(
        'Rate Limit Exceeded',
        'You have made too many requests. Please try again later.',
      );
    } catch (e) {
      SnackbarUtil.showErrorSnackbar(
        'Error',
        'Failed to delete employee. Please try again later.',
      );
    } finally {
      isLoading(false);
    }
  }
}
