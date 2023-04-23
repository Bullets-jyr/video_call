import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatelessWidget {
  const CamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LIVE',
        ),
      ),
      body: FutureBuilder<bool>(
          future: init(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: [],
            );
          }),
    );
  }

  Future<bool> init() async {
    final resp = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    // denied : 권한을 물어보기 전 상태
    // granted : 권한을 제공한 상태
    // restricted : Only iOS, 부분적?!
    // limited : Only iOS, 몇가지 권한만 허락?!
    // permanentlyDenied : 실제 권한 거절 상태
    if (cameraPermission != PermissionStatus.granted ||
        microphonePermission != PermissionStatus.granted) {
      throw 'You do not have camera or microphone permission.';
    }

    return true;
  }
}
