import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const double mobDesignWidthInPx = 375;
const double mobDesignHeightInPx = 812;
const mobileDeviceSize = Size(mobDesignWidthInPx, mobDesignHeightInPx);

Future<void> setupDimensions(WidgetTester tester) async {
  await tester.binding.setSurfaceSize(mobileDeviceSize);
  tester.view.physicalSize = mobileDeviceSize;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
}
