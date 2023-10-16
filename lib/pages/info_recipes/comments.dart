import 'package:flutter/material.dart';

class CommentData {
  final String login = 'User';
  final String data = DateTime.timestamp().toString();
  final String photo = 'assets/img/burger.jpg';
  final String text;

  CommentData({required this.text});
}

class CommentsWidget extends StatefulWidget {
  final CommentData commentData;
  const CommentsWidget({super.key, required this.commentData});

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
                height: 45,
                width: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(widget.commentData.photo),
                ))
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.commentData.login,
                  style: const TextStyle(color: Colors.green),
                ),
                Text(
                  widget.commentData.data,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
            Row(
              children: [Text(widget.commentData.text)],
            ),
            Row(
              children: [
                SizedBox(
                    height: 70,
                    width: 100,
                    child: Image.asset(widget.commentData.photo))
              ],
            )
          ],
        )
      ],
    );
  }
}
