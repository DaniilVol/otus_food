import 'package:flutter/material.dart';

class PushComment extends StatefulWidget {
  const PushComment({super.key});

  @override
  State<PushComment> createState() => _PushCommentState();
}

class _PushCommentState extends State<PushComment> {
  final controllerComment = TextEditingController();
  final List<CommentWidget> listComments = [];

  @override
  void dispose() {
    controllerComment.dispose();
    super.dispose();
  }

  void onTap() {
    listComments.add(
      CommentWidget(
          commentData: CommentData(commentText: controllerComment.text)),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
              listComments.length, (index) => listComments[index]),
        ),
        TextField(
          controller: controllerComment,
        ),
        ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
                minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 2, 56, 4)),
                elevation: MaterialStateProperty.all(0),
                splashFactory: NoSplash.splashFactory),
            child: const Text(
              'Отправить',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}

class CommentData {
  final String login = 'User';
  final String commentDate =
      "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}";
  final String commentPhoto = 'assets/img/burger.jpg';
  final String commentText;

  CommentData({required this.commentText});
}

class CommentWidget extends StatelessWidget {
  final CommentData commentData;

  const CommentWidget({
    super.key,
    required this.commentData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(commentData.commentPhoto),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    commentData.login,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(commentData.commentDate),
                ],
              ),
              const SizedBox(height: 5.0),

              Text(commentData.commentText),

              const SizedBox(height: 10.0),
              // AspectRatio(
              //   aspectRatio: 16 / 9, // Пропорции изображения (ширина и высота)
              //   child: Image.network(
              //     commentData.commentPhoto,
              //     fit: BoxFit
              //         .contain,
              //   ),
              // ),
              Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(commentData.commentPhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
