import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/widgets/button.dart';


bool isPastTenDays(DateTime date1, DateTime date2) {
  return date1.difference(date2).inDays > 10;
}

/// Returns a [DateTime] object rounded to the closest 5 mins interval
///
/// e.g. 10.43 will be rounded off to 10.45
DateTime dateToClosestNext5Mins(DateTime reference) => DateTime(
      reference.year,
      reference.month,
      reference.day,
      reference.hour,
      (reference.minute / 5).ceil() * 5,
    );

class DateTools {
  showDateSelector(BuildContext context, DateTime? selectedDate, TextEditingController textEditingController) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.red,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      textEditingController
        ..text = DateFormat.yMd().format(selectedDate)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: textEditingController.text.length,
            affinity: TextAffinity.downstream,
          ),
        );
      List<String> date = textEditingController.value.text.contains('/')
          ? textEditingController.value.text.split('/')
          : textEditingController.value.text.split('-');
      String reversedDate =
          '${date[1].length == 1 ? '0${date[1]}' : date[1]}/${date[0].length == 1 ? '0${date[0]}' : date[0]}/${date[2]}';
      textEditingController.text = reversedDate;

      debugPrint("printed datae${textEditingController.value.text}");
    }
  }

  showCupertinoDateSelector(
    BuildContext context,
    // DateTime? selectedDate,
    // TextEditingController textEditingController,
    Widget child,
  ) async {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground.resolveFrom(context).color,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ),
            Material(
              child: Button(
                radius: 50,
                text: "OK",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
