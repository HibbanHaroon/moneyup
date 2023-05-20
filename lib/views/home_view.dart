import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneyup/constants/routes.dart';
import 'package:moneyup/views/components/post.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  bool _isFavorite = false;
  bool _isUpvote = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Money ",
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          letterSpacing: -1,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Up",
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          letterSpacing: -1,
                          color: Color(0xFF79F959),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/search.svg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F3F46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(52.5),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cash in...",
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color(0xFFA1A1AA),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            PostWidget(
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
            PostWidget(
              personName: 'Lucy Badgely',
              personImage: 'assets/person2.jpg',
              time: '5 hours ago',
              isFavorite: _isFavorite,
              content: "My pretty cat with pink glasses",
              postImage: 'assets/post2.jpg',
              isUpvote: _isUpvote,
              upvoteCount: "12.4k",
              retweetCount: "18k",
              commentCount: "25k",
              viewCount: "50k",
            ),
            PostWidget(
              personName: 'Mike Brown',
              personImage: 'assets/person3.jpg',
              time: '10 days ago',
              isFavorite: _isFavorite,
              content:
                  "Scored an amazing shot in the last match. Check it out!",
              postImage: 'assets/post3.jpg',
              isUpvote: _isUpvote,
              upvoteCount: "10.4k",
              retweetCount: "10k",
              commentCount: "22k",
              viewCount: "20k",
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF1E1E1E),
          unselectedItemColor: const Color(0xFF5A5A5A),
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/feed.svg',
                height: 24,
                color: _currentIndex == 0 ? Colors.white : Colors.grey,
              ),
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/group.svg',
                height: 24,
                color: _currentIndex == 1 ? Colors.white : Colors.grey,
              ),
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/map.svg',
                height: 24,
                color: _currentIndex == 2 ? Colors.white : Colors.grey,
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/alert.svg',
                height: 24,
                color: _currentIndex == 3 ? Colors.white : Colors.grey,
              ),
              label: 'Alerts',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/profile.svg',
                height: 24,
                color: _currentIndex == 4 ? Colors.white : Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              switch (index) {
                case 0:
                  Navigator.of(context).pushReplacementNamed(homeRoute);
                  break;
                case 1:
                  break;
                case 2:
                  break;
                case 3:
                  break;
                case 4:
                  break;
              }
            });
          },
        ),
      ),
    );
  }
}
