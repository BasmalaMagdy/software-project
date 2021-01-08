class CommentDoc{
  final String cid;
  CommentDoc({this.cid});
}

class CommentData{
  final String cid;
  final String pid;
  final String uid;
  final String comment;
  CommentData({this.pid, this.cid, this.uid, this.comment});
}