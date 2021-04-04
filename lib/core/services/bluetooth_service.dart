import 'package:bluetooth_toy_app/core/models/bluetooth_device_model.dart';
import 'package:flutter_blue/flutter_blue.dart';

const Duration _scanTimeOut = Duration(seconds: 4);

class BluetoothService {
  factory BluetoothService() => _instance;
  BluetoothService._internal();
  static final BluetoothService _instance = BluetoothService._internal();

  final FlutterBlue _flutterBlue = FlutterBlue.instance;

  Map<String, BluetoothDeviceModel> _deviceList =
      <String, BluetoothDeviceModel>{};

  List<BluetoothDeviceModel> get deviceList => _deviceList.values.toList();

  Future<dynamic> scanForDevices() async {
    _deviceList = <String, BluetoothDeviceModel>{};

    await _flutterBlue.startScan(timeout: _scanTimeOut);

    _flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (final ScanResult result in results) {
        final Map<String, BluetoothDeviceModel> entry =
            <String, BluetoothDeviceModel>{
          result.device.id.id: BluetoothDeviceModel.fromScanResult(result)
        };
        _deviceList.addAll(entry);
      }
    });

    await _flutterBlue.stopScan();
  }
}
