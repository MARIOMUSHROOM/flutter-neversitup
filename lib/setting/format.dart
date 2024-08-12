import 'dart:developer';

import 'package:intl/intl.dart';

class Format {
  String _KMBgenerator(num value) {
    if (value > 999999 && value < 999999999) {
      return "${(value / 1000000).toStringAsFixed(1)}M";
    } else if (value > 999999999) {
      return "${(value / 1000000000).toStringAsFixed(1)}B";
    } else {
      return money(value);
    }
  }

  String money2(num value) {
    return _KMBgenerator(value);
  }

  String money3(num value) {
    if (value > 999 && value < 999999) {
      return "${(value / 1000).toStringAsFixed(0)}K";
    } else if (value > 999999 && value < 999999999) {
      return "${(value / 1000000).toStringAsFixed(0)}M";
    } else if (value > 999999999) {
      return "${(value / 1000000000).toStringAsFixed(0)}B";
    } else {
      return money(value);
    }
  }

  String money(num value) {
    var money = NumberFormat.currency(
        customPattern: "#,##0.00", locale: "th_TH", symbol: "");
    return money.format(value);
  }

  String moneyFromString(String value) {
    num convert = 0;
    try {
      convert = num.parse(value);
    } catch (e) {
      log("convert feiled");
    }
    var money = NumberFormat.currency(
        customPattern: "#,##0.00", locale: "th_TH", symbol: "");
    return money.format(convert);
  }

  String qutity(num value) {
    var qutity =
        NumberFormat.currency(locale: "th_TH", decimalDigits: 0, symbol: "");
    return qutity.format(value);
  }
}
