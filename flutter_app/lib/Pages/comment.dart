/* import 'package:flutter/material.dart';
import 'package:flutter_app/Components/comment_card.dart';

class Comment extends StatefulWidget {
       Comment({Key key, this.comment}) : super(key: key);
       final Map comment;

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {

  List<Map> comments = [
    { 'comment':'good',
    },
    {
      'comment1': 'nice',
    },
    {
      'comment2': 'nice556',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            //for (var comment in comments) CardReview(comment: comment),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ), // mediaquery to get all width
            Positioned(
              bottom: 0,
              child: Container(
                //padding: EdgeInsets.symmetric(horizontal: 8 ,vertical: 0),
                //color: Colors.grey,
                height: 80,
                width: 400, //  width:MediaQuery.of(context).size.width
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                            color: Colors.grey,
                          ))),
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.send), onPressed: () {}),
                              contentPadding: EdgeInsets.all(20),
                              /*border: OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.grey) ,
                              borderRadius: BorderRadius.circular(30),
                            ),*/
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(style: BorderStyle.none)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(style: BorderStyle.none)),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
           //=========================

          ],
            //==============================================
          
            
        ),  
      ),
    );
  }
}
 */
