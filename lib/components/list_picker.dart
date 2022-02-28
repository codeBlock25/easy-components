part of 'components.dart';

void buildUnitPicker(BuildContext context,
    {required void Function(int) setter, required List<UnitModel> units}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 30.h,
          width: 100.w.clamp(200, 500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp.clamp(5, 15)),
            color: context.theme.scaffoldBackgroundColor,
          ),
          child: CupertinoPicker(
            itemExtent: 30.sp.clamp(30, 60),
            backgroundColor: Colors.white,
            onSelectedItemChanged: (int selected) {
              setter(selected);
            },
            looping: true,
            magnification: 1.5,
            useMagnifier: true,
            children: units
                .map((unit) => Center(
                      child: Text(
                        '${unit.name.capitalize!} Unit',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp.clamp(10, 22)),
                      ),
                    ))
                .toList(),
          ),
        );
      });
}

void buildPicker(BuildContext context,
    {required void Function(int) setter, required List<String> selectable}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 30.h,
          width: 100.w.clamp(200, 500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp.clamp(5, 15)),
            color: context.theme.scaffoldBackgroundColor,
          ),
          child: CupertinoPicker(
            itemExtent: 30.sp.clamp(30, 60),
            backgroundColor: Colors.white,
            onSelectedItemChanged: (int selected) {
              setter(selected);
            },
            magnification: 1.2,
            useMagnifier: true,
            children: selectable
                .map((item) => Center(
                      child: Text(
                        item.capitalize!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp.clamp(10, 22)),
                      ),
                    ))
                .toList(),
          ),
        );
      });
}
