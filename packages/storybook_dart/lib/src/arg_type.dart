class ArgType<T> {
  const ArgType(
    this.name, {
    this.description,
    this.defaultValue,
  });

  final String name;
  final String? description;
  final T? defaultValue;
}
