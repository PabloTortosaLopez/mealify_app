// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_client/local_storage_client.dart';

void main() {
  group('LocalStorageClient', () {
    test('can be instantiated', () {
      expect(LocalStorageClient(), isNotNull);
    });
  });
}
