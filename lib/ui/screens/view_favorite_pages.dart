import 'package:flutter/material.dart';
import 'package:github_user/ui/widgets/user_box.dart';

class ViewFavoritePages extends StatefulWidget {
  const ViewFavoritePages({super.key});

  @override
  State<ViewFavoritePages> createState() => _ViewFavoritePagesState();
}

class _ViewFavoritePagesState extends State<ViewFavoritePages> {
  int userFav = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: userFav != 0
          ? ListView.builder(
              itemCount: userFav,
              itemBuilder: (context, index) => const UserBox(
                imageUser: '',
                nameUser: '',
                typeUser: '',
              ),
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.hourglass_empty,
                    color: Colors.green,
                    size: 70,
                  ),
                  const SizedBox(height: 70),
                  const Text(
                    'Yeay, Data Favorit Kosong',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.lightGreen),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Silahkan Refresh Page untuk memperbarui data',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 12),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text('Refresh'),
                  )
                ],
              ),
            ),
    );
  }
}
