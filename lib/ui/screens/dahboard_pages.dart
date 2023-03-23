import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_user/ui/screens/profile_page.dart';
import 'package:github_user/ui/screens/view_favorite_pages.dart';
import 'package:github_user/ui/screens/view_popular_pages.dart';

class DashboardPages extends StatefulWidget {
  const DashboardPages({super.key});

  @override
  State<DashboardPages> createState() => _DashboardPagesState();
}

class _DashboardPagesState extends State<DashboardPages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Github Apps Demo'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const ProfilPage()));
              },
              icon: const Icon(Icons.info),
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
              child: Text('Popular'),
            ),
            Tab(
              icon: Icon(Icons.favorite),
              child: Text('Favorite'),
            )
          ]),
        ),
        body: const TabBarView(
          children: [
            ViewPopularPages(),
            ViewFavoritePages(),
          ],
        ),
      ),
    );
  }
}
