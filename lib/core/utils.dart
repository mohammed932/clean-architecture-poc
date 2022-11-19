class Utils {
  static T? tryCast<T>(obj) {
    try {
      if (obj is T) {
        return obj;
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
