abstract class CustomizableProperty<T, S> {
  const CustomizableProperty();

  T resolve(S states);
}
