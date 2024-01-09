import 'package:flutter_test/flutter_test.dart';
import 'package:mintminter_mint/utils/list.dart';

void main() {
  group('Utils Tests', () {
    group('Test generateList', () {
      test('Test generateList from 1 to 3', () {
        final list = generateList(from: 1, to: 3);
        expect(list, [
          1,
          2,
          3,
        ]);
      });

      test('Test generateList from 4 to 7', () {
        final list = generateList(from: 4, to: 7);
        expect(list, [
          4,
          5,
          6,
          7,
        ]);
      });

      test('Test generateList from 21 to 25', () {
        final list = generateList(from: 21, to: 25);
        expect(list, [
          21,
          22,
          23,
          24,
          25,
        ]);
      });
    });
  });
}
