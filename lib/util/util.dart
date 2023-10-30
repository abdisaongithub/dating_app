import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


GlobalKey globalKey = GlobalKey<ScaffoldState>();

class Util {
  static void showGeneralSnackBar({
    required BuildContext context,
    required String message,
    SnackBarState state = SnackBarState.success,
  }) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 1,
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color(0xfff1f1f1),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 80),
        // width: MediaQuery.of(context).size.width * 0.9,
        content: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  state == SnackBarState.success
                      ? 'assets/icons/icon-notification-success.svg'
                      : state == SnackBarState.info
                          ? 'assets/icons/icon-notification-alert.svg'
                          : 'assets/icons/icon-notification-error.svg',
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  message,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/close-icon.svg',
                      height: 9,
                      width: 9,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {

    Util.showGeneralSnackBar(
      context: context,
      message: message,
      state: SnackBarState.success,
    );

  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 3,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width * 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Color(0xfff1f1f1),
          ),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 11,
            fontFamily: "Montserrat",
          ),
        ),
      ),
    );
  }

  static String dateFormat(String? date) {
    if (date == null) {
      return '';
    }
    final f = DateFormat('dd.MM.yyyy kk:mm');
    final datetime = DateTime.parse(date).toLocal();
    return f.format(datetime);
  }

  static String chatDateFormat(String? date) {
    if (date == null) {
      return '';
    }
    final f = DateFormat('dd.MM.yyyy | kk:mm');
    final datetime = DateTime.parse(date).toLocal();
    return f.format(datetime);
  }

  static String timeFormat(String? date) {
    if (date == null) {
      return '';
    }
    final f = DateFormat.Hm();
    final datetime = DateTime.parse(date).toLocal();
    return f.format(datetime);
  }

  static String dateOnlyFormat(String? date) {
    if (date == null) {
      return '';
    }
    final f = DateFormat('dd.MM.yyyy');
    final datetime = DateTime.parse(date).toLocal();
    return f.format(datetime);
  }

  static String currencyFormat(num? rawCurrency) {
    if (rawCurrency == null) return '';
    final currencyFormatter = NumberFormat.currency(locale: 'EU', symbol: "€");
    final parsedCurrency = double.parse(rawCurrency.toStringAsFixed(2));
    return currencyFormatter.format(parsedCurrency).replaceAll(',', '.');
  }
}

enum SnackBarState { success, danger, info }
