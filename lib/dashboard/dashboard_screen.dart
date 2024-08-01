import 'package:employee_management_app/dashboard/controller/dashboard_controller.dart';
import 'package:employee_management_app/dashboard/widgets/calender_widget.dart';
import 'package:employee_management_app/dashboard/widgets/employee_data_widget.dart';
import 'package:employee_management_app/dashboard/widgets/header_widget.dart';
import 'package:employee_management_app/dashboard/widgets/notification_card_widget.dart';
import 'package:employee_management_app/dashboard/widgets/profile_card_widget.dart';
import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

final DashboardController controller = Get.find();

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    controller.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.r),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: ColorManagerLight.scaffoldBgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            /// Header Part
            HeaderWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            NotificationCardWidget(),
                            const SizedBox(
                              height: 20,
                            ),
                            if (Responsive.isMobile(context)) ...{
                              CalendarWidget(),
                              SizedBox(
                                height: 20.h,
                              ),
                            },
                            EmployeeDataWidget(),
                          ],
                        ),
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              CalendarWidget(),
                              const SizedBox(
                                height: 20,
                              ),
                              ProfileCardWidget(),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
