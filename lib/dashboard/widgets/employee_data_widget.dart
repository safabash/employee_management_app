import 'package:employee_management_app/shared/assets/asset_manager.dart';
import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmployeeDataWidget extends StatefulWidget {
  const EmployeeDataWidget({super.key});

  @override
  _EmployeeDataWidgetState createState() => _EmployeeDataWidgetState();
}

class _EmployeeDataWidgetState extends State<EmployeeDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:ColorManagerLight.scaffoldBgColor, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recruitment Progress",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManagerLight.textColor,
                  fontSize: 22,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorManagerLight.primaryColor,
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  "View All",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: ColorManagerLight.textColor),
                ),
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              /// Table Header
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  )),
                ),
                children: [
                  tableHeader("Full Name"),
                  if (!Responsive.isMobile(context))
                    tableHeader("Designation"),
                  tableHeader("Status"),
                  if (!Responsive.isMobile(context)) tableHeader(""),
                ],
              ),

              /// Table Data
              tableRow(
                context,
                name: "Mary G Lolus",
                color: Colors.blue,
                image: "assets/user1.jpg",
                designation: "Project Manager",
                status: "Practical Round",
              ),
              tableRow(
                context,
                name: "Vince Jacob",
                color: Colors.blue,
                image: "assets/user2.jpg",
                designation: "UI/UX Designer",
                status: "Practical Round",
              ),
              tableRow(
                context,
                name: "Nell Brian",
                color: Colors.green,
                image: "assets/user3.jpg",
                designation: "React Developer",
                status: "Final Round",
              ),
              tableRow(
                context,
                name: "Vince Jacob",
                color: Colors.yellow,
                image: "assets/user2.jpg",
                designation: "UI/UX Designer",
                status: "HR Round",
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Showing 4 out of 4 Results"),
                Text(
                  "View All",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TableRow tableRow(context, {name, image, designation, status, color}) {
    return TableRow(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        children: [
          //Full Name
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset(
                    ImageAssets.userIcon,
                    width: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(name)
              ],
            ),
          ),
          // Designation
          if (!Responsive.isMobile(context)) Text(designation),
          //Status
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
              SizedBox(
                width: 10,
              ),
              Text(status),
            ],
          ),
          // Menu icon
          if (!Responsive.isMobile(context))
            Image.asset(
               ImageAssets.userIcon,
              color: Colors.grey,
              height: 30,
            )
        ]);
  }

  Widget tableHeader(text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color:ColorManagerLight.textColor),
      ),
    );
  }
}