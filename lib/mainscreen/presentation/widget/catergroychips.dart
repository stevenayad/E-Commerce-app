import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Catergroychips extends StatefulWidget {
  const Catergroychips({super.key});

  @override
  State<Catergroychips> createState() => _CatergroychipsState();
}

class _CatergroychipsState extends State<Catergroychips> {
  int selectedindex = 0;
  final Catergories = ['All', 'Men', 'Women', 'gril'];
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(12),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(Catergories.length, (index) {
            return AnimatedContainer(
              duration: Duration(microseconds: 300),
              curve: Curves.easeInOut,
              child: ChoiceChip(
                label: Text(
                  Catergories[index],
                  style: AppTextStyle.withColor(
                    selectedindex == index
                        ? AppTextStyle.withWeight(
                          AppTextStyle.bodySmall,
                          FontWeight.w600,
                        )
                        : AppTextStyle.bodySmall,
                    selectedindex == index
                        ? Colors.white
                        : isDark
                        ? Colors.grey[300]!
                        : Colors.grey[600]!,
                  ),
                ),
                selected: selectedindex == index,
                onSelected: (selected) {
                  selectedindex = selected ? index : selectedindex;
                  setState(() {});
                },
                selectedColor: Theme.of(context).primaryColor,
                elevation: selectedindex == index ? 2 : 0,
                pressElevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                labelPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(
                  color:
                      selectedindex == index
                          ? Colors.transparent
                          : isDark
                          ? Colors.grey[300]!
                          : Colors.grey[600]!,
                  width: 1,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
