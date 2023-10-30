import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'apis.dart';

void showChangePasswordBottomSheet(
  BuildContext context,
) {
  _baseFunction(
    context: context,
    builder: (_) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){Navigator.pop(context);},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ChangePasswordBottomSheet(),
            ],
          ),
        ),
      );
    },
  );
}

void showDeleteAccountBottomSheet(
  BuildContext context,
) {
  _baseFunction(
    context: context,
    builder: (_) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){Navigator.pop(context);},
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // DeleteBottomSheet(),
            ],
          ),
        ),
      );
    },
  );
}

void showChangeEmailBottomSheet(
  BuildContext context,
  bool isChangeEmail,
) {
  _baseFunction(
    context: context,
    builder: (_) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){Navigator.pop(context);},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ChangeEmailBottomSheet(isChangeEmail: isChangeEmail),
            ],
          ),
        ),
      );
    },
  );
}

void showChangePhoneBottomSheet(
  BuildContext context,
  String phoneNumberIntl,
) {
  _baseFunction(
    context: context,
    builder: (_) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){Navigator.pop(context);},
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ChangePhoneBottomSheet(),
            ],
          ),
        ),
      );
    },
  );
}

void _baseFunction({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) {
  showMaterialModalBottomSheet(
    bounce: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: builder,
    isDismissible: true,
  );
}
