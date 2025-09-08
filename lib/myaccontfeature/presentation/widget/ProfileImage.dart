import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/showimagepicker.dart';

class Profileimage extends StatelessWidget {
  const Profileimage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/avatar.jpg'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
            border: Border.all(width: 2, color: Theme.of(context).primaryColor),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),

              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color:
                        isDark
                            ? Colors.black.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(Icons.camera_alt, size: 20, color: Colors.white),
            ),
            onTap: () {
              showimagepicker(context);
            },
          ),
        ),
      ],
    );
  }
}
