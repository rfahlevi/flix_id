// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flix_id/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/pages/movie-page/movie_page.dart';
import 'package:flix_id/presentation/pages/profile-page/profile_page.dart';
import 'package:flix_id/presentation/pages/ticket-page/ticket_page.dart';
import 'package:flix_id/presentation/providers/page/page_provider.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/bottom_nav_bar.dart';
import 'package:flix_id/presentation/widgets/bottom_nav_bar_item.dart';

class MainPage extends ConsumerStatefulWidget {
  final File? imageFile;
  const MainPage({
    Key? key,
    this.imageFile,
  }) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();

  @override
  void initState() {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (widget.imageFile != null && user != null) {
      ref.read(userDataProvider.notifier).uploadProfilePicture(
            user: user,
            imageFile: widget.imageFile!,
          );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed('login');
      } else if (next is AsyncError) {
        context.showSnackbar(next.error.toString());
      }
    });

    int selectedIndex = ref.watch(pageProvider);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) => ref.read(pageProvider.notifier).onPageChanged(value),
            children: const [
              MoviePage(),
              TicketPage(),
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
