import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/showdailoglogout.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class BuildMenuSection extends StatelessWidget {
  const BuildMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final menus = [
      {'icon': Icons.shopping_bag_outlined, 'title': "Shopping"},
      {'icon': Icons.location_on_outlined, 'title': "Location"},
      {'icon': Icons.help_outline_outlined, 'title': "Helper Center"},
      {'icon': Icons.logout_outlined, 'title': "Logout"},
    ];

    return Column(
      children:
          menus.map((item) {
            return Container(
              margin: EdgeInsets.only(bottom: 8),

              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                    color:
                        isDark
                            ? Colors.black.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.1),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(
                  item['icon'] as IconData,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  item['title'] as String,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyMedium,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
                onTap: () {
                  if (item['title'] == 'Logout') {
                    DialogUtils.showLogoutDialog(context);
                  }
                },
              ),
            );
          }).toList(),
    );
  }
}
