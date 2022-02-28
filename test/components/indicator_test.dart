import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:widget_helper/components/components.dart';

void main() async {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets(
    'Custom Toast',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Sizer(
          builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) {
            return GetMaterialApp(
              home: Scaffold(
                body: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Center(
                    child: Builder(builder: (context) {
                      return TextButton(
                        key: const ValueKey<String>('btn'),
                        onPressed: () {
                          toastSnackBar(context,
                              toastMessage: 'ToastSnackBar',
                              type: ToastSnackBarType.danger,
                              duration: const Duration(seconds: 20),
                              key: 'snack');
                        },
                        child: Text(
                          'Toasts',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            );
          },
        ),
      );

      final btn = find.byKey(const ValueKey<String>('btn'));
      await tester.tap(btn);

      expect(btn, findsOneWidget);
    },
  );
}
