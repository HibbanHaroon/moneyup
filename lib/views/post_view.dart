import 'package:flutter/material.dart';
import 'package:moneyup/views/components/comment.dart';
import 'package:moneyup/views/components/post.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final bool _isFavorite = false;
  final bool _isUpvote = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.1,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Post",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  PostWidget(
                    enableGestureDetector: false,
                    personName: 'Noah Cent',
                    personImage: 'assets/person1.jpg',
                    time: '45 mins ago',
                    isFavorite: _isFavorite,
                    content: "Such a cute dog!!!",
                    postImage: 'assets/post1.png',
                    isUpvote: _isUpvote,
                    upvoteCount: "23.6k",
                    retweetCount: "20k",
                    commentCount: "18.9k",
                    viewCount: "90k",
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Comments",
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xFFFAFAFA),
                        ),
                      ),
                    ),
                  ),
                  const CommentWidget(
                    personName: "Grant Lee",
                    personImage: 'assets/person3.jpg',
                    time: "2 days ago",
                    comment:
                        "I would love to have a cutie pie like this. The hair's my favorite.",
                  ),
                  const CommentWidget(
                    personName: "Simmona Williams",
                    personImage: 'assets/person2.jpg',
                    time: "2 days ago",
                    comment:
                        "🐾 Oh my goodness, look at that adorable fluff ball! This picture is just overflowing with cuteness! Those big, soulful eyes and that wagging tail are melting my heart.",
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                        maxHeight: 100), // Maximum height for the container
                    child: TextField(
                      controller: _commentController,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 4,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Leave a comment',
                        hintStyle: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                    final comment = _commentController.text;
                    _commentController.clear();
                    // Process the comment as desired
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
