class EmployeesListModel {
    String status;
    List<EmployeeDetail> data;
    String message;

    EmployeesListModel({
        required this.status,
        required this.data,
        required this.message,
    });

    EmployeesListModel copyWith({
        String? status,
        List<EmployeeDetail>? data,
        String? message,
    }) => 
        EmployeesListModel(
            status: status ?? this.status,
            data: data ?? this.data,
            message: message ?? this.message,
        );

    factory EmployeesListModel.fromJson(Map<String, dynamic> json) => EmployeesListModel(
        status: json["status"],
        data: List<EmployeeDetail>.from(json["data"].map((x) => EmployeeDetail.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class EmployeeDetail {
    int id;
    String employeeName;
    int employeeSalary;
    int employeeAge;
    String profileImage;

    EmployeeDetail({
        required this.id,
        required this.employeeName,
        required this.employeeSalary,
        required this.employeeAge,
        required this.profileImage,
    });

    EmployeeDetail copyWith({
        int? id,
        String? employeeName,
        int? employeeSalary,
        int? employeeAge,
        String? profileImage,
    }) => 
        EmployeeDetail(
            id: id ?? this.id,
            employeeName: employeeName ?? this.employeeName,
            employeeSalary: employeeSalary ?? this.employeeSalary,
            employeeAge: employeeAge ?? this.employeeAge,
            profileImage: profileImage ?? this.profileImage,
        );

    factory EmployeeDetail.fromJson(Map<String, dynamic> json) => EmployeeDetail(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
        "profile_image": profileImage,
    };
}