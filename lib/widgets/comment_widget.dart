import 'package:flutter/material.dart';
import 'package:otus_food/models/comment_data_model.dart';

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
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    commentData.login,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Text(
                    commentData.commentDate,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),

              Text(
                commentData.commentText,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 15.0),
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
                height: 200.0,
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
