import 'package:flutter/material.dart';
import 'package:ks2020/models/user_model.dart';
import 'package:ks2020/services/database/user_database_service.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  final String title, time;

  const EventCard({Key key, this.title, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);
    bool sub = user.subs.map((e) => e.toString().trim()).toList().contains(
          title.replaceAll(' ', ''),
        );

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        '/event${time.trim()}',
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 16),
          Flexible(
            flex: 1,
            child: Image.asset('assets/bullet.png'),
          ),
          Flexible(
            flex: 2,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/arrow.png',
                width: 12,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white.withOpacity(0.2),
              // height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {
                sub
                    ? UserDatabaseService(uid: user.uid).unsubscribe(
                        title.replaceAll(' ', ''),
                      )
                    : UserDatabaseService(uid: user.uid).subscribe(
                        title.replaceAll(' ', ''),
                      );
              },
              icon: Icon(
                sub ? Icons.notifications : Icons.notifications_none,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
