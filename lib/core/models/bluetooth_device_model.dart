import 'package:flutter_blue/flutter_blue.dart';

class BluetoothDeviceModel {
  BluetoothDeviceModel({
    required this.localName,
    required this.connectable,
    required this.manufacturerData,
    required this.serviceData,
    required this.serviceUuids,
    required this.name,
    required this.id,
    required this.type,
    required this.rssi,
  });

  BluetoothDeviceModel.fromScanResult(ScanResult result)
      : localName = result.advertisementData.localName,
        connectable = result.advertisementData.connectable,
        manufacturerData = result.advertisementData.manufacturerData,
        serviceData = result.advertisementData.serviceData,
        serviceUuids = result.advertisementData.serviceUuids,
        name = result.device.name,
        id = result.device.id.id,
        type = result.device.type.toString().split('.')[1],
        rssi = result.rssi;

  final String name;
  final int rssi;
  final String type;
  final String id;
  final String localName;
  final bool connectable;
  final Map<int, List<int>> manufacturerData;
  final Map<String, List<int>> serviceData;
  final List<String> serviceUuids;

  String get getName {
    /// Retrieving empty name is an open bug in flutter_blue: https://github.com/pauldemarco/flutter_blue/issues/157
    if (name.isNotEmpty) {
      return name;
    } else if (localName.isNotEmpty) {
      return localName;
    }
    return id;
  }
}
