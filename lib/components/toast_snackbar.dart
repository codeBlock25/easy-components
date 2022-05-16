part of widget_component;

enum ToastSnackBarType { danger, warning, info, notify, success, norm }
Color _getTextColor(BuildContext context, ToastSnackBarType type) {
  switch (type) {
    case ToastSnackBarType.danger:
      return Colors.white;
    case ToastSnackBarType.success:
      return Colors.white;
    case ToastSnackBarType.info:
      return Colors.white;
    case ToastSnackBarType.warning:
      return Colors.brown[800]!;
    case ToastSnackBarType.notify:
      return Colors.white;
    case ToastSnackBarType.norm:
      return !context.isDarkMode ? Colors.grey[900]! : Colors.white;
    default:
      return context.isDarkMode ? Colors.white : Colors.black;
  }
}

Color _getBgColor(BuildContext context, ToastSnackBarType type) {
  switch (type) {
    case ToastSnackBarType.danger:
      return Colors.red;
    case ToastSnackBarType.success:
      return !context.isDarkMode ? Colors.green[400]! : Colors.green[600]!;
    case ToastSnackBarType.info:
      return !context.isDarkMode ? Colors.blue : Colors.blue[700]!;
    case ToastSnackBarType.warning:
      return context.isDarkMode ? Colors.yellow[700]! : Colors.yellow[800]!;
    case ToastSnackBarType.notify:
      return context.isDarkMode ? Colors.grey[600]! : Colors.grey[800]!;
    case ToastSnackBarType.norm:
      return context.isDarkMode ? Colors.grey[900]! : Colors.white;
    default:
      return context.isDarkMode ? Colors.grey[600]! : Colors.grey[800]!;
  }
}

void toastSnackBar(
  BuildContext context, {
  required String toastMessage,
  required ToastSnackBarType type,
  Duration? duration,
  SnackBarAction? action,
  String? key,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  final SnackBar snackBar = SnackBar(
    key: key != null ? ValueKey<String>(key) : null,
    action: action,
    content: Text(
      toastMessage,
      style: TextStyle(
          color: _getTextColor(context, type), fontSize: 12.sp.clamp(10, 20)),
    ),
    backgroundColor: _getBgColor(context, type),
    duration: duration ?? const Duration(seconds: 7),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
