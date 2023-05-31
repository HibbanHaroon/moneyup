import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneyup/constants/colors.dart';
import 'package:moneyup/constants/routes.dart';

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
  final bool enableGestureDetector;

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
    this.enableGestureDetector = true,
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

  Widget _buildPanelRow(String svgPath, String title, String description) {
    return InkWell(
      onTap: () {
        // Perform action based on the selected row
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.lightTextColor,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Color(0xFF71717A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onRetweetButtonPressed() {
    // Perform action for the retweet button
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              _buildPanelRow('assets/reup.svg', 'ReUp', 'Retweet the post'),
              const Divider(),
              _buildPanelRow(
                'assets/requote.svg',
                'ReQuote',
                'Add Quote to your retweet',
              ),
            ],
          ),
        );
      },
    );
  }

  void _onPostWidgetTapped() {
    if (widget.enableGestureDetector) {
      Navigator.of(context).pushNamed(
        postRoute,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPostWidgetTapped,
      child: Column(
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
                            letterSpacing: 0.5,
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
                        onPressed: _onRetweetButtonPressed,
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
      ),
    );
  }
}
