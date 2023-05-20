import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostWidget extends StatefulWidget {
  final String personName;
  final String personImage;
  final String time;
  final bool isFavorite;
  final String postImage;
  final bool isUpvote;
  final String upvoteCount;
  final String retweetCount;
  final String commentCount;
  final String viewCount;
  final String content;

  const PostWidget({
    Key? key,
    required this.personName,
    required this.personImage,
    required this.time,
    required this.isFavorite,
    required this.postImage,
    required this.isUpvote,
    required this.upvoteCount,
    required this.retweetCount,
    required this.commentCount,
    required this.viewCount,
    required this.content,
  }) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late bool isFavorite;
  late bool isUpvote;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
    isUpvote = widget.isUpvote;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(widget.personImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        widget.personName,
                        style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      widget.time,
                      style: const TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  // Perform action for the favorite button
                },
                icon: SvgPicture.asset(
                  'assets/favorite.svg',
                  height: 24,
                  color: isFavorite ? Color(0xFF79F959) : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Perform action for the three dots button
                },
                icon: SvgPicture.asset(
                  'assets/three-dots-vertical.svg',
                  height: 21,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.content,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(11.0),
                    image: DecorationImage(
                      image: AssetImage(widget.postImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isUpvote = !isUpvote;
                        });
                        // Perform action for the upvote button
                      },
                      icon: SvgPicture.asset(
                        'assets/upvote.svg',
                        color: isUpvote ? Color(0xFF79F959) : Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    widget.upvoteCount,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Repeat the same pattern for other columns
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: IconButton(
                      onPressed: () {
                        // Perform action for the comment button
                      },
                      icon: SvgPicture.asset(
                        'assets/comment.svg',
                      ),
                    ),
                  ),
                  Text(
                    widget.commentCount,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Repeat the same pattern for other columns
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: IconButton(
                      onPressed: () {
                        // Perform action for the retweet button
                      },
                      icon: SvgPicture.asset(
                        'assets/retweet.svg',
                      ),
                    ),
                  ),
                  Text(
                    widget.retweetCount,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Repeat the same pattern for other columns
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: IconButton(
                      onPressed: () {
                        // Perform action for the view button
                      },
                      icon: SvgPicture.asset(
                        'assets/views.svg',
                      ),
                    ),
                  ),
                  Text(
                    widget.viewCount,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: IconButton(
                      onPressed: () {
                        // Perform action for the upload button
                      },
                      icon: SvgPicture.asset(
                        'assets/upload.svg',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
