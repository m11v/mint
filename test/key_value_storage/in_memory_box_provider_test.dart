import 'package:flutter_test/flutter_test.dart';
import 'package:mintminter_mint/mint.dart';

void main() {
  group('InMemoryBoxProvider', () {
    const boxName = 'boxName';
    const key = 'key';
    const value = 'value';

    tearDownAll(() {
      InMemoryBoxProvider.dispose();
    });

    test('Throw exception when get InMemoryBoxProvider before create one', () {
      expect(() => InMemoryBoxProvider.getInstance(boxName),
          throwsA(const TypeMatcher<NoInMemoryBoxProviderError>()));
    });

    test(
        'Return the same InMemoryBoxProvider instance when get InMemoryBoxProvider instance after creation',
        () async {
      final instance = InMemoryBoxProvider.create(boxName);
      expect(instance, InMemoryBoxProvider.getInstance(boxName));
      expect(InMemoryBoxProvider.getInstance(boxName),
          InMemoryBoxProvider.getInstance(boxName));
    });

    test('Create different InMemoryBoxProvider instance by name', () async {
      final instance1 = InMemoryBoxProvider.create('nameA');
      final instance2 = InMemoryBoxProvider.create('nameB');
      expect(instance1, isNot(instance2));
    });

    test(
        'Test put, get and delete key value pair in InMemoryBoxProvider instance',
        () {
      final box = InMemoryBoxProvider.getInstance(boxName);
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

    test('Throw exception when try to create InMemoryBoxProvider again', () {
      expect(() => InMemoryBoxProvider.create(boxName),
          throwsA(const TypeMatcher<InMemoryBoxProviderHasBeenCreatedError>()));
    });

    test('Throw exception when try to get InMemoryBoxProvider after dispose it',
        () {
      InMemoryBoxProvider.dispose();
      expect(() => InMemoryBoxProvider.getInstance(boxName),
          throwsA(const TypeMatcher<NoInMemoryBoxProviderError>()));
    });
  });
}
