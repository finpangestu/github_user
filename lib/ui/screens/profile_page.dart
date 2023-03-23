import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String loclatitude = '0, 0';
  String loclongitude = '0.0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: image != null
                        ? Image.file(
                            image!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/image_me.jpeg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const Text(
                    'Muhammad Alfin Pangestu',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'E-mail',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'muhammadalfinpangestu@gmail.com',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jabatan',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mobile Application Developer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'longitude',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    loclongitude,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'latitude',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    loclatitude,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                Position position = await _getGeoLocationPosition();
                setState(() {
                  loclatitude = '${position.latitude}';
                  loclongitude = '${position.longitude}';
                });
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                    Size.fromWidth(MediaQuery.of(context).size.width)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text('Refresh Geolocation'),
            ),
            ElevatedButton(
              onPressed: () {
                openCamera();
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                    Size.fromWidth(MediaQuery.of(context).size.width)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text('Capture Photo Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                openGallery();
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                    Size.fromWidth(MediaQuery.of(context).size.width)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text('Select Galery'),
            ),
          ],
        ),
      ),
    );
  }
}

String location = 'Belum Mendapatkan Lat dan long, Silahkan tekan button';
String address = 'Mencari lokasi...';

//getLongLAT
Future<Position> _getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //location service not enabled, don't continue
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return Future.error('Location service Not Enabled');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permission denied');
    }
  }

  //permission denied forever
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permission denied forever, we cannot access',
    );
  }
  //continue accessing the position of device
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}

File? image;

Future openCamera() async {
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  image = File(pickedImage!.path);
}

Future openGallery() async {
  final imageGallery =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  image = File(imageGallery!.path);
}
