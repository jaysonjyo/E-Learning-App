import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  // final BiometricSignature _biometricSignature = BiometricSignature();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          if (_supportState)
            Text("this device is supported")
          else
            Text("this device is not supported"),
          Divider(
            height: 100,
          ),
          ElevatedButton(
              onPressed: _getAvailableBiometrics,
              child: Text("get avilable biometrics"),)
        ],
      ),
    );
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> avilablebiometrics =
        await auth.getAvailableBiometrics();
    if (!mounted) {
      return;
    }
  }
}
