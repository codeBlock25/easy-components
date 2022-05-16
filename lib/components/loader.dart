part of widget_component;

buildLoader(BuildContext context, {Brightness? brightness = Brightness.light}) {
  Get.defaultDialog(
    title: 'Loading...',
    backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[900]
        : Colors.white,
    barrierDismissible: false,
    titleStyle: TextStyle(
      fontSize: 16.sp.clamp(10, 30),
      color: Theme.of(context).brightness != Brightness.dark
          ? Colors.grey[900]
          : Colors.white,
    ),
    content: Center(
      child: SizedBox(
        width: 100.sp.clamp(80, 1000),
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).brightness != Brightness.dark
              ? Colors.grey[100]
              : Colors.black54,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}
