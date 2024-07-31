import 'package:employee_management_app/dashboard/model/employees_list_model.dart';
import 'package:employee_management_app/dashboard/service/dashboard_service.dart';
import 'package:employee_management_app/shared/utils/snackbar_utils.dart';
import 'package:get/get.dart';
// Adjust the import path as needed

class DashboardController extends GetxController {
  var employees = <EmployeeDetail>[].obs;
  var isLoading = true.obs;
  final DashboardService dashboardService = DashboardService();
  var employee = EmployeeDetail(
          id: 0,
          employeeName: '',
          employeeSalary: 0,
          employeeAge: 0,
          profileImage: '')
      .obs;
  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  void fetchEmployees() async {
    try {
      isLoading(true);
      EmployeesListModel fetchedEmployees =
          await dashboardService.fetchEmployees();
      employees.assignAll(fetchedEmployees.data);
    } catch (e) {
      SnackbarUtil.showErrorSnackbar('Error', 'Failed to fetch employees');
    } finally {
      isLoading(false);
    }
  }

  void fetchEmployeeById(int id) async {
    try {
      isLoading(true);
      EmployeeDetail fetchedEmployee =
          await dashboardService.fetchEmployeeById(id);
      employee.value = fetchedEmployee;
    } catch (e) {
      SnackbarUtil.showErrorSnackbar('Error', 'Failed to fetch employee');
    } finally {
      isLoading(false);
    }
  }

  void createEmployee(String name, String salary, String age) async {
    try {
      isLoading(true);
      await dashboardService.createEmployee(name, salary, age);
      fetchEmployees();
      SnackbarUtil.showSuccessSnackbar(
          'Success', 'Employee created successfully');
    } catch (e) {
      SnackbarUtil.showErrorSnackbar('Error', 'Failed to create employee');
    } finally {
      isLoading(false);
    }
  }

  void updateEmployee(int id, String name, String salary, String age) async {
    try {
      isLoading(true);
      await dashboardService.updateEmployee(id, name, salary, age);
      fetchEmployees();
      SnackbarUtil.showSuccessSnackbar(
          'Success', 'Employee updated successfully');
    } catch (e) {
      SnackbarUtil.showErrorSnackbar('Error', 'Failed to update employee');
    } finally {
      isLoading(false);
    }
  }

  void deleteEmployee(int id) async {
    try {
      isLoading(true);
      await dashboardService.deleteEmployee(id);
      fetchEmployees();
      SnackbarUtil.showSuccessSnackbar(
          'Success', 'Employee deleted successfully');
    } catch (e) {
      SnackbarUtil.showErrorSnackbar('Error', 'Failed to delete employee');
    } finally {
      isLoading(false);
    }
  }
}
