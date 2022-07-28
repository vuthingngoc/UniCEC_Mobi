import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicec_mobi/models/enums/priority_status.dart';
import '../../../constants/Theme.dart';
import '../../../models/entities/competition_activity/competition_activity_model.dart';
import '../../../models/enums/competition_activity_status.dart';

class ViewCompetitionMenu extends StatelessWidget {
  const ViewCompetitionMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CompetitionActivityModel> fakeData = [
      CompetitionActivityModel(
        id: 1,
        competitionId: 1,
        createTime: "createTime",
        ending: "ending",
        name: "Task này dùng để test thôi nah nah Task này dùng để test thôi nah Task này dùng để test thôi nah  ",
        assigner: "Lam Minh An",
        priority: PriorityStatus.High,
        status: CompetitionActivityStatus.Open,
      ),
      CompetitionActivityModel(
        id: 2,
        competitionId: 1,
        createTime: "createTime",
        ending: "ending",
        name: "Task này dùng để test thôi",
        assigner: "Lam Minh An",
        priority: PriorityStatus.Medium,
        status: CompetitionActivityStatus.OnGoing,
      ),
      CompetitionActivityModel(
        id: 3,
        competitionId: 1,
        createTime: "createTime",
        ending: "ending",
        name: "Task này dùng để test thôi",
        assigner: "Lam Minh An",
        priority: PriorityStatus.Low,
        status: CompetitionActivityStatus.Pending,
      ),
      CompetitionActivityModel(
        id: 3,
        competitionId: 1,
        createTime: "createTime",
        ending: "ending",
        name: "Task này dùng để test thôi",
        assigner: "Lam Minh An",
        priority: PriorityStatus.Low,
        status: CompetitionActivityStatus.Finished,
      ),
      CompetitionActivityModel(
        id: 3,
        competitionId: 1,
        createTime: "createTime",
        ending: "ending",
        name: "Task này dùng để test thôi",
        assigner: "Lam Minh An",
        priority: PriorityStatus.Low,
        status: CompetitionActivityStatus.Completed,
      ),
    ];
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: fakeData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black87,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color.fromARGB(255, 235, 237, 241),
                ),
                onPressed: () {},
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(fakeData[index].id.toString(),
                                style: TextStyle(fontSize: 18, color: Colors.grey)),
                          ),
                          Text(fakeData[index].name,
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 8),
                          child: Text("|",
                              style: TextStyle(fontSize: 18,  color: Colors.blueGrey)),
                        ),
                        Text(fakeData[index].assigner,
                            style: TextStyle(fontSize: 18)),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 8),
                          child: Text("|",
                              style: TextStyle(fontSize: 18,  color: Colors.blueGrey)),
                        ),
                        if (fakeData[index].status.toString() == "CompetitionActivityStatus.OnGoing")
                          Text("Đang diễn ra", style: TextStyle(fontSize: 18, color: Colors.amber),),
                        if (fakeData[index].status.toString() == "CompetitionActivityStatus.Open")
                          Text("Mở", style: TextStyle(fontSize: 18, color: Colors.purple),),
                        if (fakeData[index].status.toString() == "CompetitionActivityStatus.Pending")
                          Text("Chờ", style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),),
                        if (fakeData[index].status.toString() == "CompetitionActivityStatus.Finished")
                          Text("Hoàn thành", style: TextStyle(fontSize: 18, color: Colors.green),),
                        if (fakeData[index].status.toString() == "CompetitionActivityStatus.Completed")
                          Text("Kết thúc", style: TextStyle(fontSize: 18, color: Colors.grey),),
                        if (fakeData[index].status.toString() == "CompetitionActivityStatus.Cancelling")
                          Text("Hủy", style: TextStyle(fontSize: 18, color: Colors.red),),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 8),
                          child: Text("|",
                              style: TextStyle(fontSize: 18,  color: Colors.blueGrey)),
                        ),
                        if (fakeData[index].priority.toString() == "PriorityStatus.High")
                          Icon(Icons.warning,color: Colors.red,),
                        if (fakeData[index].priority.toString() == "PriorityStatus.Medium")
                          Icon(Icons.warning,color: Colors.amber,),
                        if (fakeData[index].priority.toString() == "PriorityStatus.Low")
                          Icon(Icons.warning,color: Colors.green,)
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
    // return ListView.builder(
    //   return Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //
    //     ),
    // ),
    // );
  }
}
