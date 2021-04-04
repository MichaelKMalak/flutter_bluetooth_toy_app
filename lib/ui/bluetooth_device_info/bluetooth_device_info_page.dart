import 'package:bluetooth_toy_app/core/services/bluetooth_service.dart';
import 'package:bluetooth_toy_app/ui/app_colors.dart';
import 'package:bluetooth_toy_app/ui/bluetooth_scan/bluetooth_scan_page.dart';
import 'package:flutter/material.dart';

import '../../core/models/bluetooth_device_model.dart';

class BluetoothDeviceInfoPage extends StatelessWidget {
  const BluetoothDeviceInfoPage({Key? key, required this.device})
      : super(key: key);
  final BluetoothDeviceModel device;

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return WillPopScope(
      onWillPop: () async {
        /// Remove WillPopScope in case you don't want to rescan for bluetooth devices on pop
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => BluetoothScanPage(
                bluetoothService: BluetoothService(),
              ),
            ),
            (Route<dynamic> route) => false);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(device.getName),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20),
              Text('connectable: ${device.connectable}',
                  style: theme.headline6),
              const SizedBox(height: 20),
              Text('name: ${device.name}', style: theme.headline6),
              const SizedBox(height: 20),
              Text('local name: ${device.localName}', style: theme.headline6),
              const SizedBox(height: 20),
              Text('type: ${device.type}', style: theme.headline6),
              const SizedBox(height: 20),
              Text('id: ${device.id}', style: theme.headline6),
              const SizedBox(height: 20),
              Text('rssi: ${device.rssi}', style: theme.headline6),
            ],
          ),
        ),
      ),
    );
  }
}
