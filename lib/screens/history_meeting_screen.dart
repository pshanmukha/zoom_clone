import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class HistoryMeetingscreen extends StatelessWidget {
  const HistoryMeetingscreen({Key? key}) : super(key: key);

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

        return (snapshot.data! as dynamic).docs.length == 0
            ? Center(
                child:
                    Lottie.network('https://assets8.lottiefiles.com/packages/lf20_z4cshyhf.json'),
              )
            : ListView.builder(
                itemCount: (snapshot.data! as dynamic).docs.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                  ),
                  subtitle: Text(
                    'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                  ),
                ),
              );
      },
    );
  }
}
