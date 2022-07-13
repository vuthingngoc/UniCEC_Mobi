class SeedsWalletModel{
  int id;
  int studentId;
  double amount;
  bool status;

  SeedsWalletModel({
    required this.id,
    required this.studentId,
    required this.amount,
    required this.status
  });

  factory SeedsWalletModel.fromJson(Map<String, dynamic> json){
    int id = json['id'];
    int studentId = json['student_id'];
    double amount = json['amount'];
    bool status = json['status'];

    return SeedsWalletModel(
      id: id, 
      studentId: studentId, 
      amount: amount, 
      status: status
    );
  }
}