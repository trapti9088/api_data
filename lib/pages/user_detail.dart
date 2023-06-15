import 'package:club_api/model/user_model.dart';
import 'package:flutter/material.dart';

import 'api_helper.dart';

class UserDetail extends StatefulWidget {
  final int userId;
  UserDetail({
    required this.userId,
    super.key,
  });

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  late Future<UserModel> UserData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserData = Apihelper().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
              future: UserData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(snapshot
                                    .data!.data![widget.userId].user!.picture
                                    .toString()),
                                const SizedBox(height: 10,),
                                Text(
                                    snapshot
                                        .data!.data![widget.userId].user!.name
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                                Text(
                                    snapshot.data!.data![widget.userId].user!
                                        .position
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(16)),

                          ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.data![widget.userId].status.toString(),style: TextStyle(color: Colors.white,fontSize: 32),
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      const Text("In-time:   ",style: TextStyle(color: Colors.white,fontSize: 16),),
                                      Text(snapshot.data!.data![widget.userId].inTime.toString(),style: TextStyle(color: Colors.white,fontSize: 16)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text("Out-time:   ",style: TextStyle(color: Colors.white,fontSize: 16)),
                                      Text(snapshot.data!.data![widget.userId].outTime.toString(),style: TextStyle(color: Colors.white,fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(snapshot.data!.data![widget.userId].date.toString(),style: TextStyle(color: Colors.white,fontSize: 16)),

                                ],
                              ),
                            ),
                        ])
                      ),
                    ],
                  ));
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
