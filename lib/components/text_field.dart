part of 'components.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.textController,
    required this.keyboardType,
    required this.validator,
    required this.label,
    this.autoComplete,
    this.maxLength,
    this.maxLine = 1,
    this.minLine,
    this.decoration,
    this.suffix,
    this.isHidden,
    this.onTap,
    this.onChange,
  }) : super(key: key);
  final TextEditingController textController;
  final String label;
  final bool? isHidden;
  final Widget? suffix;
  final int? maxLength;
  final int maxLine;
  final int? minLine;
  final List<String>? autoComplete;
  final TextInputType keyboardType;
  final InputDecoration? decoration;
  final void Function()? onTap;
  final void Function(String?)? onChange;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp)
              .copyWith(bottom: 5.sp, top: 8.sp),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp.clamp(14, 24),
            ),
          ),
        ),
        if (keyboardType == TextInputType.multiline)
          TextFormField(
              controller: textController,
              keyboardType: keyboardType,
              validator: validator,
              maxLength: maxLength,
              maxLines: maxLine,
              minLines: minLine,
              style: TextStyle(
                fontSize: 12.sp.clamp(12, 20),
              ),
              keyboardAppearance:
                  context.isDarkMode ? Brightness.dark : Brightness.light,
              autofillHints: autoComplete,
              obscuringCharacter: '*',
              obscureText: isHidden ?? false,
              decoration: decoration)
        else
          SizedBox(
            height: 50.sp.clamp(50, 80),
            child: TextFormField(
                controller: textController,
                keyboardType: keyboardType,
                validator: validator,
                maxLength: maxLength,
                maxLines: maxLine,
                minLines: minLine,
                onTap: onTap,
                onChanged: onChange,
                style: TextStyle(
                  fontSize: 12.sp.clamp(12, 20),
                ),
                keyboardAppearance:
                    context.isDarkMode ? Brightness.dark : Brightness.light,
                autofillHints: autoComplete,
                obscuringCharacter: '*',
                obscureText: isHidden ?? false,
                decoration: decoration),
          ),
      ],
    );
  }
}
