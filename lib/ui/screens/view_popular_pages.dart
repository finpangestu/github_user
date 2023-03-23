import 'package:flutter/material.dart';
import 'package:github_user/bloc/api_bloc.dart';
import 'package:github_user/ui/screens/detail_user_page.dart';
import 'package:github_user/ui/widgets/user_box.dart';

class ViewPopularPages extends StatefulWidget {
  const ViewPopularPages({super.key});

  @override
  State<ViewPopularPages> createState() => _ViewPopularPagesState();
}

class _ViewPopularPagesState extends State<ViewPopularPages> {
  final apiBloc = ApiBloc();

  @override
  void initState() {
    apiBloc.fetchApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, dynamic>>(
      stream: apiBloc.api,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final data = snapshot.data!;

        return ListView.builder(
            itemCount: data['items'].length,
            itemBuilder: (context, index) {
              final user = data['items'][index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserDetailPage(
                                user: user,
                              )));
                },
                child: UserBox(
                  imageUser: user['avatar_url'],
                  nameUser: user['login'],
                  typeUser: user['type'],
                ),
              );
            });
      },
    );
  }

  @override
  void dispose() {
    apiBloc.dispose();
    super.dispose();
  }
}
