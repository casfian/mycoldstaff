import 'package:flutter/material.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class Scanattendance extends StatefulWidget {
  const Scanattendance({super.key});

  @override
  State<Scanattendance> createState() => _ScanattendanceState();
}

class _ScanattendanceState extends State<Scanattendance> {

  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scan Attendance'),
        ),
        body:  Center(
          child: ElevatedButton(
                  onPressed: () {
                    _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                        context: context,
                        onCode: (code) {
                          setState(() {
                            this.code = code;
                          });
                        });
                  },
                  child: Text(code ?? "Click me")),
        ),
      
    );
  }
}