import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/services/database.dart';

import '../models/comment.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  CommentCard({Key key, this.comment}) : super(key: key);
  final CommentData comment;

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    final UserData user = context.watch<UserData>();
    //final List<CommentData> comments = context.watch<List<CommentData>>();
    //print(comments);
    return user == null
        ? Loading()
        : Card(
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(user.name),
                        ),
                        //trailing: Icon(Icon.filter_list),
                        isThreeLine: true,
                        subtitle: Text("${widget.comment.comment}"),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Rate : ${widget.comment.rate}',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),
                ),
                if (user.uid == widget.comment.uid)
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          DatabaseService()
                              .DeleteCommentData(comment: widget.comment);
                        }),
                  ),
              ],
            ),
          );
  }
}
