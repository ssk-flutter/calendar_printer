import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => App(),
  ));
}
