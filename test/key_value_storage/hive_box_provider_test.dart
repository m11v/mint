import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mintminter_mint/mint.dart';

void main() {
  group('HiveBoxProvider', () {
    const boxName = 'boxName';
    const boxNameA = 'nameA';
    const boxNameB = 'nameB';
    const key = 'key';
    const value = 'value';

    tearDownAll(() async {
      HiveBoxProvider.dispose();

      for (File file in [
        File('$boxName.hive'),
        File('$boxName.lock'),
        File('$boxNameA.hive'),
        File('$boxNameA.lock'),
        File('$boxNameB.hive'),
        File('$boxNameB.lock')
      ]) {
        if (await file.exists()) file.delete();
      }
    });

    test('Throw exception when get HiveBoxProvider before create one', () {
      expect(() => HiveBoxProvider.getInstance(boxName: boxName),
          throwsA(const TypeMatcher<NoHiveBoxProviderError>()));
    });

    test(
        'Return the same HiveBoxProvider instance when get HiveBoxProvider instance after creation',
        () async {
      final instance = await HiveBoxProvider.createAndInit(
          boxName: boxName, isFlutter: false);
      expect(
        instance,
        HiveBoxProvider.getInstance(boxName: boxName),
      );
      expect(
        HiveBoxProvider.getInstance(boxName: boxName),
        HiveBoxProvider.getInstance(boxName: boxName),
      );
    });

    test('Create different HiveBoxProvider instance by name', () async {
      final instance1 = await HiveBoxProvider.createAndInit(
          boxName: boxNameA, isFlutter: false);
      final instance2 = await HiveBoxProvider.createAndInit(
          boxName: boxNameB, isFlutter: false);
      expect(
        instance1,
        isNot(instance2),
      );
    });

    test('Test put, get and delete key value pair in HiveBoxProvider instance',
        () {
      final box = HiveBoxProvider.getInstance(boxName: boxName);
      // When the key-value is not put in
      // containsKey() returns false
      expect(box.containsKey(key), false);
      // get() returns null when the default value is not set
      expect(box.get(key), null);
      // get() returns default value when the default value is set
      expect(box.get(key, defaultValue: 'default'), 'default');

      // When the key-value is put in
      box.put(key, value);
      // containsKey() returns true
      expect(box.containsKey(key), true);
      // get() returns the value
      expect(box.get(key), value);

      // When the key-value is deleted
      box.delete(key);
      // containsKey() returns false
      expect(box.containsKey(key), false);
      // get() returns null when the default value is not set
      expect(box.get(key), null);
    });

    test('Throw exception when try to create HiveBoxProvider again', () {
      expect(
          () =>
              HiveBoxProvider.createAndInit(boxName: boxName, isFlutter: false),
          throwsA(const TypeMatcher<HiveBoxProviderHasBeenCreatedError>()));
    });

    test('Throw exception when try to get HiveBoxProvider after dispose it',
        () {
      HiveBoxProvider.dispose();
      expect(() => HiveBoxProvider.getInstance(boxName: boxName),
          throwsA(const TypeMatcher<NoHiveBoxProviderError>()));
    });
  });
}
