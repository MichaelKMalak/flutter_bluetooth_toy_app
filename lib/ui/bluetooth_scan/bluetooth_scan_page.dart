import 'package:bluetooth_toy_app/core/models/bluetooth_device_model.dart';
import 'package:bluetooth_toy_app/core/services/message_service.dart';
import 'package:flutter/material.dart';

import '../../core/services/bluetooth_service.dart';
import 'widgets/device_list_widget.dart';
import 'widgets/loading_widget.dart';

class BluetoothScanPage extends StatefulWidget {
  const BluetoothScanPage({Key? key, required this.bluetoothService})
      : super(key: key);

  final BluetoothService bluetoothService;

  @override
  _BluetoothScanPageState createState() => _BluetoothScanPageState();
}

class _BluetoothScanPageState extends State<BluetoothScanPage> {
  bool isLoading = true;
  List<BluetoothDeviceModel>? deviceList;

  void setLoadingToTrue() => setState(() {
        isLoading = true;
      });

  void setLoadingToFalse() => setState(() {
        isLoading = false;
      });

  void setDeviceList(List<BluetoothDeviceModel> deviceList) => setState(() {
        this.deviceList = deviceList;
        isLoading = false;
      });

  @override
  void initState() {
    super.initState();
    onScanDevicesTap();
  }

  Future<void> onScanDevicesTap() async {
    setLoadingToTrue();
    try {
      await widget.bluetoothService.scanForDevices();
      setDeviceList(widget.bluetoothService.deviceList);
    } on Exception catch (e) {
      MessageService.showError(e);
    }
    setLoadingToFalse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Bluetooth Devices')),
      body: isLoading
          ? LoadingWidget(onRefresh: onScanDevicesTap)
          : DeviceListWidget(
              deviceList: deviceList!,
              onRefresh: onScanDevicesTap,
            ),
    );
  }
}
