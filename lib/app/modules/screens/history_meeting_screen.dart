import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom/app/auth/auth_methods.dart';
import 'package:zoom/app/utils/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  HistoryMeetingScreen({Key? key}) : super(key: key);

  AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  // side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Room ID: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.grey[500],
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '${DateFormat.yMMMMEEEEd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14, left: 12),
                      child: CircleAvatar(
                        radius: 17,
                        backgroundImage:
                            NetworkImage(authMethods.user.photoURL!),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
