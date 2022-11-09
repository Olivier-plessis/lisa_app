import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:lisa_app/generated/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.google).existsSync(), true);
    expect(File(Images.svgLisa).existsSync(), true);
  });
}
