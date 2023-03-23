import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key, this.user});

  final dynamic user;

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  fav = true;
                });
              },
              icon: fav == false
                  ? const Icon(Icons.favorite_border)
                  : const Icon(Icons.favorite))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              // height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: Image.network(
                      widget.user['avatar_url'],
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    widget.user['login'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
