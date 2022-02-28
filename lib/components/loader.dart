part of 'components.dart';

buildLoader(BuildContext context, {Brightness? brightness = Brightness.light}) {
  Get.defaultDialog(
    title: 'Loading...',
    backgroundColor:
        brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
    barrierDismissible: true,
    titleStyle: TextStyle(
      fontSize: 16.sp.clamp(10, 30),
      color: brightness != Brightness.dark ? Colors.grey[900] : Colors.white,
    ),
    content: Center(
      child: SizedBox(
        width: 100.sp.clamp(80, 1000),
        child: LinearProgressIndicator(
          backgroundColor: context.theme.primaryColor,
        ),
      ),
    ),
  );
}
