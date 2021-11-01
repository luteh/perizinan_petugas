import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';

class MyFormField extends StatefulWidget {
  final String? label;
  final String hint;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final int? maxLines;
  final EdgeInsets? padding;
  final bool isObscure;
  final String? Function(String?)? validator;

  const MyFormField({
    Key? key,
    this.label,
    required this.hint,
    this.keyboardType,
    this.onChanged,
    this.maxLines,
    this.padding,
    this.isObscure = false,
    this.validator,
  }) : super(key: key);

  @override
  State<MyFormField> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            MyText(
              text: widget.label!,
              color: ColorPalettes.textGrey,
              margin: EdgeInsets.only(
                bottom: Sizes.height6,
              ),
            ),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            maxLines: widget.isObscure ? 1 : widget.maxLines,
            obscureText: _isObscure,
            decoration: InputDecoration(
              isDense: true,
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: ColorPalettes.textGrey2,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.radius8),
              ),
              suffixIcon: widget.isObscure
                  ? IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      })
                  : null,
            ),
            onChanged: widget.onChanged,
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
