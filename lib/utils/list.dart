List<int> generateList({
  required int from,
  required int to,
}) =>
    [for (var i = 0; i <= to - from; i += 1) from + i];
