class CommentDoc {
  final String cid;
  CommentDoc({this.cid});
}

class CommentData {
  final String cid;
  final String pid;
  final String uid;
  final String comment;
  final String uname;
  final double rate;
  CommentData(
      {this.pid, this.cid, this.uid, this.comment, this.uname, this.rate});
}
