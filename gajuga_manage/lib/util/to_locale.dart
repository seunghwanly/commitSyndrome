import 'package:intl/intl.dart';

String toLocaleString(int number) {
    return new NumberFormat('###,###,###,###')
        .format(number)
        .replaceAll(' ', '');
  }