import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class CustomTextfelid extends StatefulWidget {
  const CustomTextfelid({
    super.key,
    required this.label,
    required this.prefixicon,
    this.textEditingController = null,
    this.keywordtype = TextInputType.text,
    this.ispassword = false,
    this.change,
    this.validator,
    this.initialvlaue = '',
  });
  final String label;
  final IconData prefixicon;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final TextInputType? keywordtype;
  final bool ispassword;
  final String? Function(String?)? change;
  final String? initialvlaue;

  @override
  State<CustomTextfelid> createState() => _CustomTextfelidState();
}

class _CustomTextfelidState extends State<CustomTextfelid> {
  final observertext = true;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      initialValue:
          widget.textEditingController == null ? widget.initialvlaue : null,
      controller: widget.textEditingController,
      obscureText: widget.ispassword && observertext,
      keyboardType: widget.keywordtype,
      validator: widget.validator,
      onChanged: widget.change,
      style: AppTextStyle.withColor(
        AppTextStyle.bodyMedium,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
      decoration: InputDecoration(
        label: Text(widget.label),
        labelStyle: AppTextStyle.withColor(
          AppTextStyle.bodyMedium,
          isDark ? Colors.grey[400]! : Colors.grey[800]!,
        ),
        prefixIcon: Icon(
          widget.prefixicon,
          color: isDark ? Colors.grey[400]! : Colors.grey[800]!,
        ),
        suffixIcon:
            widget.ispassword
                ? IconButton(
                  icon: Icon(
                    observertext ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    observertext != observertext;
                    setState(() {});
                  },
                )
                : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[400]! : Colors.grey[800]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[400]! : Colors.grey[800]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
