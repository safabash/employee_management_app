import 'package:employee_management_app/dashboard/create_edit_employee_screen.dart';
import 'package:employee_management_app/dashboard/employee_detail_screen.dart';
import 'package:employee_management_app/dashboard/model/employees_list_model.dart';
import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_management_app/dashboard/controller/dashboard_controller.dart';

class EmployeeDataWidget extends StatelessWidget {
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.shouldRetry.value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Rate limit exceeded. Please try again later.'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  controller.fetchEmployees(); // Retry fetching employees
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }
      if (controller.employees.isEmpty) {
        return const Center(child: Text('No employees found'));
      }

      return Container(
        decoration: BoxDecoration(
          color: ColorManagerLight.scaffoldBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Employee list",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManagerLight.textColor,
                    fontSize: 22,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const CreateEditEmployeePage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManagerLight.primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      "Create",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorManagerLight.scaffoldBgColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                // Table Header
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  children: [
                    tableHeader("Full Name"),
                    if (!Responsive.isMobile(context)) tableHeader("Age"),
                    tableHeader("Salary"),
                    tableHeader("Actions"),
                  ],
                ),

                // Table Data
                for (var employee in controller.employees)
                  tableRow(
                    context,
                    employeeId: employee.id,
                    name: employee.employeeName,
                    image: employee.profileImage,
                    salary: employee.employeeSalary.toString(),
                    age: employee.employeeAge.toString(),
                    employeeDetail: employee,
                    color: Colors.blue, // Example color, adjust as needed
                  ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Showing ${controller.employees.length} out of ${controller.employees.length} Results"),
                  const Text(
                    "View All",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget tableHeader(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorManagerLight.textColor,
        ),
      ),
    );
  }

  TableRow tableRow(BuildContext context,
      {required String name,
      required String image,
      required String salary,
      required String age,
      required Color color,
      required int employeeId,
      EmployeeDetail? employeeDetail}) {
    final theme = Theme.of(context);
    return TableRow(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        children: [
          // Full Name
          GestureDetector(
            onTap: () {
              Get.to(EmployeeDetailPage(employeeId: employeeId));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  if (!Responsive.isMobile(context))
                    CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              const Icon(Icons.person),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person),
                    ),
                  const SizedBox(width: 5),
                  Text(
                    name,
                    style: theme.textTheme.displayMedium,
                  ),
                ],
              ),
            ),
          ),
          // Age
          if (!Responsive.isMobile(context))
            Text(
              age,
              style: theme.textTheme.displayMedium,
            ),
          // Salary
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                height: 10,
                width: 10,
              ),
              const SizedBox(width: 10),
              Text(
                salary,
                style: theme.textTheme.displayMedium,
              ),
            ],
          ),
          // Actions
          if (Responsive.isMobile(context))
            DropdownButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.grey),
              items: [
                DropdownMenuItem<String>(
                  value: 'view',
                  child: Text(
                    'View',
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'edit',
                  child: Text('Edit', style: theme.textTheme.displayMedium),
                ),
                DropdownMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete', style: theme.textTheme.displayMedium),
                ),
              ],
              onChanged: (value) {
                // Handle dropdown selection
                switch (value) {
                  case 'view':
                    Get.to(EmployeeDetailPage(employeeId: employeeId));
                    break;
                  case 'edit':
                    Get.to(() => CreateEditEmployeePage());
                    break;
                  case 'delete':
                    controller.deleteEmployee(employeeId);
                    break;
                }
              },
            )
          else
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.grey),
                  onPressed: () {
                    Get.to(() =>
                        CreateEditEmployeePage(employeeDetail: employeeDetail));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: ColorManagerLight.redColor),
                  onPressed: () {
                    controller.deleteEmployee(employeeId).whenComplete(() {
                      controller.fetchEmployees();
                    });
                  },
                ),
              ],
            ),
        ]);
  }
}
