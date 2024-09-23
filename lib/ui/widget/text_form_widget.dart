import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resource/theme/app_color.dart';
import '../../resource/theme/app_style.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    this.title,
    this.isPassword = false,
    this.textHint,
    this.errorText,
    this.textChange,
    this.controller,
    this.textInputType,
    this.inputFormatters,
    this.textInputAction,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.prefixIcon,
  });

  final String? title;
  final String? textHint;
  final String? errorText;
  final ValueChanged<String>? textChange;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title?.isNotEmpty == true) ...[
          Text(
            title ?? "",
            style: AppStyles.styleRegular.copyWith(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 12)
        ],
        TextFormField(
          style: AppStyles.styleRegular.copyWith(
            fontSize: 12,
            color: Colors.black,
          ),
          autovalidateMode: autoValidateMode,
          keyboardType: textInputType,
          inputFormatters: inputFormatters,
          controller: controller,
          textInputAction: textInputAction,
          onChanged: textChange,
          obscureText: isPassword,
          validator: validator,
          maxLines: 1,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            isDense: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kA8A8A9, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            // focusedBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(color: AppColors.kA8A8A9, width: 1),
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kA8A8A9, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kA8A8A9, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fillColor: AppColors.kF3F3F3,
            filled: true,
            hintText: textHint,
            hintStyle: AppStyles.styleRegular.copyWith(
              fontSize: 12,
              color: AppColors.k676767,
            ),
            errorStyle: AppStyles.styleRegular.copyWith(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
