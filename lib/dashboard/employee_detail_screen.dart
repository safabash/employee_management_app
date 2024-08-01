import 'package:employee_management_app/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeDetailPage extends StatelessWidget {
  final int employeeId;
  final DashboardController controller = Get.find();
  EmployeeDetailPage({Key? key, required this.employeeId}) : super(key: key) {
    controller.fetchEmployeeById(employeeId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final employee = controller.employee.value;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(employee.profileImage),
                ),
              ),
              const SizedBox(height: 20),
              Text('Name: ${employee.employeeName}',
                  style: theme.textTheme.titleMedium),
              const SizedBox(height: 10),
              Text('Age: ${employee.employeeAge}',
                  style: theme.textTheme.titleMedium),
              const SizedBox(height: 10),
              Text('Salary: \$${employee.employeeSalary}',
                  style: theme.textTheme.titleMedium),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Back'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
