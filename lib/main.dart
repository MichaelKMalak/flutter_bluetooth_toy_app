import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/services/bluetooth_service.dart';
import 'ui/app_colors.dart';
import 'ui/bluetooth_scan/bluetooth_scan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bluetooth Toy App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.primaryDark,
        accentColor: AppColors.secondaryColor,
        appBarTheme: const AppBarTheme(
          brightness: Brightness.dark,
        ),
        primaryTextTheme: TextTheme(
          headline6: w700BitterFont,
        ),
        textTheme: TextTheme(
          subtitle1: w700BitterFont.apply(color: AppColors.black),
          headline6: w700BitterFont.apply(color: AppColors.black),
          bodyText2: w700BitterFont.apply(color: AppColors.black),
        ),
      ),
      home: BluetoothScanPage(bluetoothService: BluetoothService()),
    );
  }
}
