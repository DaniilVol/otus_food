import 'package:flutter/material.dart';
import 'package:otus_food/models/comment_data_model.dart';
import 'package:otus_food/widgets/comment_widget.dart';

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
    if (controllerComment.text.isNotEmpty) {
      listComments.add(
        CommentWidget(
            commentData: CommentData(commentText: controllerComment.text)),
      );
      controllerComment.text = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
              listComments.length, (index) => listComments[index]),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: TextField(
            onEditingComplete: onTap,
            controller: controllerComment,
            maxLines: 3,
            decoration: InputDecoration(
                hintText: 'оставить комментарий',
                fillColor: Colors.white,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 12, 86, 14), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5))),
          ),
        ),
        const SizedBox(
          height: 20,
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
