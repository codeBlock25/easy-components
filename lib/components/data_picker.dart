part of 'components.dart';

void buildCupertinoDatePicker(BuildContext context,
    {required void Function(DateTime) setter,
    required DateTime matchingDate,
    int? minimumYear,
    int? maximumYear}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (picked) {
              setter(picked);
            },
            initialDateTime: matchingDate,
            minimumYear: minimumYear ?? 1900,
            maximumYear: maximumYear,
          ),
        );
      });
}
