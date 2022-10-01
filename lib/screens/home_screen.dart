import 'package:chatt/helper.dart';
import 'package:chatt/pages/calls_page.dart';
import 'package:chatt/pages/contacts_page.dart';
import 'package:chatt/pages/messages_page.dart';
import 'package:chatt/pages/notifications_page.dart';
import 'package:chatt/screens/profile_screen.dart';
import 'package:chatt/theme.dart';
import 'package:chatt/widgets/glowing_action_button.dart';
import 'package:chatt/widgets/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/avatar.dart';
import 'package:chatt/app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Message Page');

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final pageTitles = const ['Messages', 'Notifications', 'Calls', 'Contacts'];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            //need to wrap with the center
            return Center(
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search,
            onTap: () {
              print('to do search ');
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Hero(
              tag: 'hero-profile-picture',
              child: Avatar.small(
                url: context.currentUserImage,
                onTap: () {
                  Navigator.of(context).push(ProfileScreen.route);
                },
              ),
            ),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar:
          _BottomNavigationBar(onItemSelected: _onNavigationItemSelected),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                index: 0,
                onTap: handleItemSelected,
                lable: 'messaging',
                icon: CupertinoIcons.bubble_left_bubble_right_fill,
                isSelected: (selectedIndex == 0),
              ),
              _NavigationBarItem(
                index: 1,
                onTap: handleItemSelected,
                lable: 'Notification',
                icon: CupertinoIcons.bell_solid,
                isSelected: (selectedIndex == 1),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: GlowingActionButton(
                    color: AppColors.secondary,
                    icon: CupertinoIcons.add,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => const Dialog(
                          child: AspectRatio(
                            aspectRatio: 8 / 7,
                            child: ContactsPage(),
                          ),
                        ),
                      );
                    }),
              ),
              _NavigationBarItem(
                index: 2,
                onTap: handleItemSelected,
                lable: 'Calls',
                icon: CupertinoIcons.phone_fill,
                isSelected: (selectedIndex == 2),
              ),
              _NavigationBarItem(
                index: 3,
                onTap: handleItemSelected,
                lable: 'Contacts',
                icon: CupertinoIcons.person_2_fill,
                isSelected: (selectedIndex == 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.lable,
    required this.icon,
    required this.index,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final String lable;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(lable,
                style: isSelected
                    ? const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary)
                    : const TextStyle(
                        fontSize: 11,
                      )),
          ],
        ),
      ),
    );
  }
}
