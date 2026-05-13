class EmployeeImageModel {
  String? status;
  String? message;
  List<EmployeeImageData>? data;

  EmployeeImageModel({this.status, this.message, this.data});

  factory EmployeeImageModel.fromJson(Map<String, dynamic> json) {
    return EmployeeImageModel(
      status: json['Status'],
      message: json['Message'],
      data: json['Data'] != null
          ? (json['Data'] as List).map((i) => EmployeeImageData.fromJson(i)).toList()
          : null,
    );
  }
}

class EmployeeImageData {
  String? name;
  String? imgpath;

  EmployeeImageData({this.name, this.imgpath});

  factory EmployeeImageData.fromJson(Map<String, dynamic> json) {
    return EmployeeImageData(
      name: json['name'],
      imgpath: json['imgpath'],
    );
  }
}