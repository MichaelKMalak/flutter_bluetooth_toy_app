import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key, required this.onRefresh}) : super(key: key);
  final Future<void> Function() onRefresh;

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  bool shouldScanAgain = false;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 8), () {
      if (mounted) {
        setState(() {
          shouldScanAgain = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(
            child: CircularProgressIndicator(),
          ),
          if (shouldScanAgain)
            const Text(
                'Kindly Check that your bluetooth is open. \n Pull to refresh.'),
        ],
      ),
    );
  }
}
