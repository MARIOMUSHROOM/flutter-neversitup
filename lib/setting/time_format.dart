import 'package:intl/intl.dart';

class TimeFormat {
  final List<Map<int, String>> _dateNumToThai = [
    {1: 'ม.ค.'},
    {2: 'ก.พ.'},
    {3: 'มี.ค.'},
    {4: 'เม.ษ.'},
    {5: 'พ.ค.'},
    {6: 'มิ.ค.'},
    {7: 'ก.ค.'},
    {8: 'ส.ค.'},
    {9: 'ก.ย.'},
    {10: 'ต.ค.'},
    {11: 'พ.ย.'},
    {12: 'ธ.ค.'},
  ];

  final List<Map<int, String>> _dateNumToEng = [
    {1: 'Jan'},
    {2: 'Feb'},
    {3: 'Mar'},
    {4: 'Apr'},
    {5: 'May'},
    {6: 'Jun'},
    {7: 'Jul'},
    {8: 'Aug'},
    {9: 'Sep'},
    {10: 'Oct'},
    {11: 'Nov'},
    {12: 'Dec'},
  ];

  String dateThai(
    DateTime? date, {
    String aFormat = "yyyy-MM-dd",
  }) {
    String result = '';
    if (date != null) {
      DateTime inputDate = date;
      String? month = _dateNumToThai
          .where((element) {
            return element.keys.first == date.month;
          })
          .first
          .values
          .first;
      result = "${inputDate.day} $month ${inputDate.year + 543}";
    }
    return result;
  }

  String dateEng(
    DateTime? date, {
    String aFormat = "yyyy-MM-dd",
  }) {
    String result = '';
    if (date != null) {
      DateTime inputDate = date;
      String? month = _dateNumToThai
          .where((element) {
            return element.keys.first == date.month;
          })
          .first
          .values
          .first;
      result = "${inputDate.day} $month ${inputDate.year + 543}";
    }
    return result;
  }

  String dateThaiShot(
    DateTime? date, {
    String aFormat = "yyyy-MM-dd",
  }) {
    String result = '';
    if (date != null) {
      DateTime inputDate = date;
      String? month = _dateNumToEng
          .where((element) {
            return element.keys.first == date.month;
          })
          .first
          .values
          .first;
      result = "${inputDate.day} $month";
    }
    return result;
  }

  String timeThai(DateTime? date) {
    String result = '';
    if (date != null) {
      DateTime inputDate = date;
      result =
          "${inputDate.hour.toString().padLeft(2, '0')}:${inputDate.minute.toString().padLeft(2, '0')}:${inputDate.second.toString().padLeft(2, '0')} น.";
    }
    return result;
  }

  String timeThaiString(String? date) {
    try {
      if (date == null || date == "") {
        return "";
      }
      var timeList = date.split(':');
      final dt =
          DateTime(1970, 1, 1, int.parse(timeList[0]), int.parse(timeList[1]));
      String result = '';
      result =
          "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}";
      return result;
    } catch (e) {
      return "...";
    }
  }

  String getCustomDateFormat(
    String aInputDate, {
    String aFormat = "yyyy-MM-dd",
  }) {
    DateTime inputDate = DateTime.parse(aInputDate).toUtc();
    DateTime dateLocal = inputDate.toLocal();
    String result = DateFormat(aFormat).format(dateLocal);
    return result;
  }
}
