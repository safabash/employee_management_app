import 'package:employee_management_app/dashboard/controller/dashboard_controller.dart';
import 'package:employee_management_app/dashboard/model/employees_list_model.dart';
import 'package:employee_management_app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_state_button/multi_state_button.dart';

class CreateEditEmployeePage extends StatefulWidget {
  final EmployeeDetail? employeeDetail;

  const CreateEditEmployeePage({super.key, this.employeeDetail});

  @override
  State<CreateEditEmployeePage> createState() => _CreateEditEmployeePageState();
}

class _CreateEditEmployeePageState extends State<CreateEditEmployeePage> {
  final DashboardController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.employeeDetail != null) {
      // controller.fetchEmployeeById(widget.employeeId!);
      _nameController.text = widget.employeeDetail?.employeeName ?? "";
      _ageController.text = widget.employeeDetail?.employeeAge.toString() ?? '';
      _salaryController.text =
          widget.employeeDetail?.employeeSalary.toString() ?? '';
    }
  }

  void _saveEmployee() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final age = int.parse(_ageController.text);
      final salary = int.parse(_salaryController.text);

      if (widget.employeeDetail == null) {
        controller.createEmployee(name, age.toString(), salary.toString());
        controller.fetchEmployees();
      } else {
        controller.updateEmployee(widget.employeeDetail?.id ?? 0, name,
            age.toString(), salary.toString());
        controller.fetchEmployees();
      }
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employeeDetail == null
            ? 'Create Employee'
            : 'Edit Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                style: theme.textTheme.labelLarge,
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: theme.textTheme.labelLarge,
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: theme.textTheme.labelLarge,
                controller: _salaryController,
                decoration: const InputDecoration(labelText: 'Salary'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a salary';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid salary';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                key: const Key('Register'),
                controller: MultiStateButtonController(),
                text: widget.employeeDetail == null ? 'Create' : 'Save',
                onPressed: _saveEmployee,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
