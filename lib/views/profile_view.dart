import 'package:flutter/material.dart';
import 'package:moneyup/constants/colors.dart';
import 'package:moneyup/views/components/bottom_navigation_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height:
                      220, // Adjust the height as desired to make the cover photo slightly bigger
                  child: Image.asset(
                    'assets/cover-photo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top:
                      180, // Adjust the position to match the desired overlap between the cover photo and second container
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height:
                        600, // Adjust the height of the second container as desired
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: AppColors.backgroundColor,
                    ),
                    child: Column(
                      children: [
                        Text("hhhh"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
