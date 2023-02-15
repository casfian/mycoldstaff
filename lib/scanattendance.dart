import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class Scanattendance extends StatefulWidget {
  const Scanattendance({super.key});

  @override
  State<Scanattendance> createState() => _ScanattendanceState();
}

class _ScanattendanceState extends State<Scanattendance> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();

  String? code = '';
  bool _scanButtonVisible = true;
  bool _confirmButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QRCode'),
      ),
      body: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(code!),
                Visibility(
                  visible: _scanButtonVisible,
                  child: ElevatedButton(
                      onPressed: () async {
                        _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                            context: context,
                            onCode: (code) {
                              setState(() {
                                this.code = code;
                                _confirmButtonVisible = true;
                                _scanButtonVisible = false;
                              });
                            });
                      },
                      child: const Text("Scan QRCode")),
                ),
                Visibility(
                  visible: _confirmButtonVisible,
                  child: ElevatedButton(
                      onPressed: () async {
                        //code
                        await FirebaseFirestore.instance
                            .collection('attendence')
                            .add({'fullname': code, 'hadir': 'ya'});
                        setState(() {
                          _confirmButtonVisible = false;
                          _scanButtonVisible = true;
                          code = '';
                        });
                      },
                      child: const Text("Confirm & Save")),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
