import 'package:flutter/material.dart';
import 'package:ks2020/models/user_model.dart';
import 'package:ks2020/services/auth/auth_service.dart';
import 'package:ks2020/services/database/user_database_service.dart';
import 'package:provider/provider.dart';

import 'widgets/event.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: FutureBuilder<String>(
            future: AuthService().uid,
            builder: (_, assa) {
              return !assa.hasData
                  ? Container()
                  : StreamBuilder<UserModel>(
                      stream: UserDatabaseService(uid: assa.data).user,
                      builder: (context, ass) {
                        if (ass.hasData) {
                          return Provider<UserModel>.value(
                            value: ass.data,
                            child: ListView.builder(
                              itemCount: eventList.length + 1,
                              itemBuilder: (_, i) => i == 0
                                  ? Padding(
                                      padding: EdgeInsets.all(32),
                                      child: Text(
                                        'Events',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : eventList[i - 1],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
            },
          ),
        ),
      ),
    );
  }

  List<EventCard> eventList = [
    EventCard(
      time: '12 : 00 AM',
      title: 'Character Sketching',
    ),
    EventCard(
      time: '12 : 00 AM',
      title: 'Monochrome Pecil Design',
    ),
    EventCard(
      time: '12 : 00 AM',
      title: 'Some shit',
    ),
  ];

  ListView buildEventList() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            'Events',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),
        EventCard(
          time: '12 : 00 PM',
          title: 'Monochrome Pecil Design',
        ),
        EventCard(
          time: '12 : 00 PM',
          title: 'Monochrome Pecil Design',
        ),
      ],
    );
  }
}
