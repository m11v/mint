enum HanType {
  unknown,
  simplified,
  traditional,
}

extension HanTypeX on HanType {
  String get text {
    switch (this) {
      case HanType.unknown:
        return '文';
      case HanType.simplified:
        return '简';
      case HanType.traditional:
        return '繁';
    }
  }

  bool get isSelected {
    switch (this) {
      case HanType.unknown:
        return false;
      default:
        return true;
    }
  }
}
