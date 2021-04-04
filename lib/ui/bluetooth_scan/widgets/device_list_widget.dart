import 'package:flutter/material.dart';

import '../../../core/models/bluetooth_device_model.dart';
import 'device_item_widget.dart';

class DeviceListWidget extends StatelessWidget {
  const DeviceListWidget(
      {Key? key, required this.deviceList, required this.onRefresh})
      : super(key: key);
  final List<BluetoothDeviceModel> deviceList;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Center(
        child: ListView(
          children: deviceList
              .map(
                (BluetoothDeviceModel device) => DeviceItemWidget(
                  key: ValueKey<String>(device.id),
                  device: device,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
