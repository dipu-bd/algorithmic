void main() {
  final size = 32;
  final list = List<int>.generate(size, (i) => (i * 5 / size).floor());
  print(list);
}
