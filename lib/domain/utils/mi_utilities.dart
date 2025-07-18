class MiUtilities {
  static String getOrdinalSymbol(int place) {
    if (place == 0) {
      return "";
    } else if (place.toString().endsWith("1")) {
      return "st";
    } else if (place.toString().endsWith("2")) {
      return "nd";
    } else if (place.toString().endsWith("3")) {
      return "rd";
    } else {
      return "th";
    }
  }
}
