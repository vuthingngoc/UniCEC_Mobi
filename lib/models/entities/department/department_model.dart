class DepartmentModel{
  int id;
  int universityId;
  int majorId;
  String departmentCode;
  String name;
  String description;
  bool status;

  DepartmentModel({
    required this.id,
    required this.universityId,
    required this.majorId,
    required this.departmentCode,
    required this.name,
    required this.description,
    required this.status
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json){
    int id = json['id'];
    int universityId = json['university_id'];
    int majorId = json['major_id'];
    String departmentCode = json['department_code'];
    String name = json['name'];
    String description = json['description'];
    bool status = json['status'];

    return DepartmentModel(
      id: id, 
      universityId: universityId, 
      majorId: majorId, 
      departmentCode: departmentCode, 
      name: name, 
      description: description, 
      status: status
    );
  }
}