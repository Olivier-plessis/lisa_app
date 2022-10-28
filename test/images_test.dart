import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lisa_app/generated/resources.dart';

void main() {
  test('images assets lisa screen', () {
    expect(File(Images.svgLisa).existsSync(), true);
  });
}
