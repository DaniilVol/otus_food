// данные для комментария

class CommentData {
  final String login = 'User';
  final String commentDate =
      "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";
  final String commentPhoto = 'assets/img/burger.jpg';
  final String commentText;

  CommentData({required this.commentText});
}
