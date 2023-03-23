import 'package:flutter/material.dart';

class UserBox extends StatelessWidget {
  const UserBox({
    super.key,
    required this.imageUser,
    required this.nameUser,
    required this.typeUser,
  });
  final String imageUser;
  final String nameUser;
  final String typeUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: NetworkImage(imageUser),
              fit: BoxFit.cover,
              width: 70,
              height: 70,
            ),
            // Image.asset(imageUser,
            //     width: 70, height: 70, fit: BoxFit.cover)
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameUser,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  typeUser,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
