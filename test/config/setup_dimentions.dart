import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const double mobDesignWidthInPx = 414;
const double mobDesignHeightInPx = 896;
const mobileDeviceSize = Size(mobDesignWidthInPx, mobDesignHeightInPx);

Future<void> setupDimensions(WidgetTester tester) async {
  await tester.binding.setSurfaceSize(mobileDeviceSize);
  tester.view.physicalSize = mobileDeviceSize;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
}
