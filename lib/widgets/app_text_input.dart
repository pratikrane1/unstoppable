import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Config/theme.dart';

class AppTextInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final VoidCallback? onTapIcon;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Icon? icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  var errorText;
  final int? maxLines;
  final int? maxLength;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters; //added on 23/02/2021


  AppTextInput({
    Key? key,
    this.hintText,
    this.controller,
    this.focusNode,
    this.onTapIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.errorText,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.enabled
  }) : super(key: key);

  Widget _buildErrorLabel(BuildContext context) {
    if (errorText == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.only(top:2.0),
      child: Align(
        alignment: Alignment.topLeft,
        child:
      Text(
        errorText,
        style: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(color: Theme.of(context).errorColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        color: AppTheme.verifyPhone.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          inputFormatters!=null
              ?
          TextField(
            onTap: onTap,
            readOnly: false,
            enabled:enabled ,
            textAlignVertical: TextAlignVertical.center,
            onSubmitted: onSubmitted,
            inputFormatters:inputFormatters,
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            maxLines: maxLines,
            maxLength: maxLength,
            // decoration: InputDecoration(
            //   counterText: "",
            //   hintText: hintText,
            //   suffixIcon: icon != null
            //       ?
            //   IconButton(
            //     icon: icon,
            //     onPressed: onTapIcon,
            //   )
            //       : null,
            //   border: InputBorder.none,
            // ),
          )
              :
          TextField(
            onTap: onTap,
            enabled:enabled,
            textAlignVertical: TextAlignVertical.center,
            onSubmitted: onSubmitted,
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            maxLines: maxLines,
            maxLength: maxLength,
            // decoration: InputDecoration(
            //   counterText: "",
            //   hintText: hintText,
            //   suffixIcon: icon != null
            //       ? IconButton(
            //     icon: icon,
            //     onPressed: onTapIcon,
            //   )
            //       : null,
            //   border: InputBorder.none,
            // ),
          )
          // _buildErrorLabel(context)
        ],
      ),
    ),
        _buildErrorLabel(context)
      ],
    );

  }
}
