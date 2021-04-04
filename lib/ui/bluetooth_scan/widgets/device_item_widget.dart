import 'package:flutter/material.dart';

import '../../../core/models/bluetooth_device_model.dart';
import '../../bluetooth_device_info/bluetooth_device_info_page.dart';

class DeviceItemWidget extends StatelessWidget {
  const DeviceItemWidget({Key? key, required this.device}) : super(key: key);
  final BluetoothDeviceModel device;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey<String>(device.id),
      children: [
        ListTile(
          title: Text(device.getName),
          trailing: Icon(
            Icons.bluetooth,
            color: device.connectable ? Colors.blueAccent : Colors.black,
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
                builder: (BuildContext context) =>
                    BluetoothDeviceInfoPage(device: device)),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
