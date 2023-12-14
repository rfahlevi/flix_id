// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/pages/movie-page/movie_page.dart';
import 'package:flix_id/presentation/pages/profile-page/profile_page.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/bottom_nav_bar.dart';
import 'package:flix_id/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed('login');
      } else if (next is AsyncError) {
        context.showSnackbar(next.error.toString());
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            children: const [
              MoviePage(),
              Center(child: Text('Ticket Page')),
              ProfilePage(),
            ],
          ),
          BottomNavBar(
            items: [
              BottomNavBarItem(
                index: 0,
                isSelected: selectedIndex == 0,
                label: 'Home',
                image: 'assets/movie.png',
                selectedImage: 'assets/movie-selected.png',
              ),
              BottomNavBarItem(
                index: 1,
                isSelected: selectedIndex == 1,
                label: 'Ticket',
                image: 'assets/ticket.png',
                selectedImage: 'assets/ticket-selected.png',
              ),
              BottomNavBarItem(
                index: 2,
                isSelected: selectedIndex == 2,
                label: 'Profile',
                image: 'assets/profile.png',
                selectedImage: 'assets/profile-selected.png',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;

                pageController.animateToPage(
                  selectedIndex,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              });
            },
            selectedIndex: selectedIndex,
          )
        ],
      ),
    );
  }
}
