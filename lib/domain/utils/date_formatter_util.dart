/// Utility class for formatting dates, months, and days.
class DateFormatterUtil {
  /// Converts an integer month (1-12) to its short string representation ("Jan", "Feb", ...).
  static String intToShortMonth(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    if (month < 1 || month > 12) return "";
    return months[month - 1];
  }

  /// Converts an integer month (1-12) to its long string representation ("January", ...).
  static String intToLongMonth(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    if (month < 1 || month > 12) return "";
    return months[month - 1];
  }

  /// Converts a short string month ("Jan", "Feb", ...) to its long string representation ("January", ...).
  static String shortToLongMonth(String shortMonth) {
    const mapping = {
      "Jan": "January",
      "Feb": "February",
      "Mar": "March",
      "Apr": "April",
      "May": "May",
      "Jun": "June",
      "Jul": "July",
      "Aug": "August",
      "Sep": "September",
      "Oct": "October",
      "Nov": "November",
      "Dec": "December",
    };
    return mapping[shortMonth] ?? "";
  }

  /// Converts a long string month ("January", ...) to its short string representation ("Jan", ...).
  static String longToShortMonth(String longMonth) {
    const mapping = {
      "January": "Jan",
      "February": "Feb",
      "March": "Mar",
      "April": "Apr",
      "May": "May",
      "June": "Jun",
      "July": "Jul",
      "August": "Aug",
      "September": "Sep",
      "October": "Oct",
      "November": "Nov",
      "December": "Dec",
    };
    return mapping[longMonth] ?? "";
  }

  /// Converts a string month ("Jan", "February", ...) to its integer representation (1-12).
  static int monthStringToInt(String month) {
    const months = {
      "Jan": 1,
      "January": 1,
      "Feb": 2,
      "February": 2,
      "Mar": 3,
      "March": 3,
      "Apr": 4,
      "April": 4,
      "May": 5,
      "Jun": 6,
      "June": 6,
      "Jul": 7,
      "July": 7,
      "Aug": 8,
      "August": 8,
      "Sep": 9,
      "September": 9,
      "Oct": 10,
      "October": 10,
      "Nov": 11,
      "November": 11,
      "Dec": 12,
      "December": 12,
    };
    return months[month] ?? 1;
  }

  /// Converts an integer day (1-31) to a string.
  static String intDayToString(int day) => day.toString();

  /// Converts a string day ("1", "31") to an integer.
  static int stringDayToInt(String day) => int.tryParse(day) ?? 1;

  /// Formats a [DateTime] as "Jan 1" (short month + day).
  static String formatDateShort(DateTime date) {
    final shortMonth = intToShortMonth(date.month);
    return "$shortMonth ${date.day}";
  }

  /// Formats a [DateTime] as "January 1" (long month + day).
  static String formatDateLong(DateTime date) {
    final longMonth = intToLongMonth(date.month);
    return "$longMonth ${date.day}";
  }
}
