class HeadingType {
  static const HeadingType HEADING_0 = const HeadingType._(0);
  static const HeadingType HEADING_1 = const HeadingType._(1);
  static const HeadingType HEADING_2 = const HeadingType._(2);
  static const HeadingType HEADING_3 = const HeadingType._(3);
  static const HeadingType HEADING_4 = const HeadingType._(4);


  static List<HeadingType> get values =>
      [HEADING_1, HEADING_2, HEADING_3, HEADING_4];

  final int value;

  const HeadingType._(this.value);
}
