import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTextField extends StatefulWidget {
  final Color? color;
  final String? name;
  final TextEditingController? controller;
  final String? attribute;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType inputType;
  final TextInputAction? inputAction;
  final InputDecoration? decoration;
  final String? initialValue;
  final FocusNode? focus;
  final FocusNode? nextFocus;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool hasObscureControl;
  final bool password;
  final bool autoFocus;
  final bool readOnly;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function? onComplete;
  final String? Function(dynamic)? validator;
  final FormFieldValidator<String>? validators;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final int? maxLenght;
  final bool showCounter;
  final Function(dynamic)? onChanged;
  final int? maxLines;

  // ignore: use_key_in_widget_constructors
  const FormTextField(
      {Key? key,
      this.color,
      this.suffixIcon,
      this.name,
      this.controller,
      this.password = false,
      this.decoration,
      this.attribute,
      this.hintText,
      this.inputType = TextInputType.visiblePassword,
      this.inputAction,
      this.initialValue,
      this.obscureText = false,
      this.hasObscureControl = false,
      this.autoFocus = false,
      this.readOnly = false,
      this.focusNode,
      this.nextFocusNode,
      this.onComplete,
      this.validator,
      this.validators,
      this.inputFormatters,
      this.textCapitalization = TextCapitalization.none,
      this.maxLenght,
      this.showCounter = true,
      this.errorText,
      this.onChanged,
      this.focus,
      this.nextFocus,
      this.prefixIcon,
      this.maxLines = 1,
      this.labelText = ""});

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool isPasswordVisible = false;

  @override
  void initState() {
    isPasswordVisible = widget.hasObscureControl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != ""
            ? Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  "${widget.labelText}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : SizedBox(),
        FormBuilderTextField(
          buildCounter: widget.showCounter
              ? null
              : (context,
                      {int? currentLength, bool? isFocused, int? maxLength}) =>
                  const SizedBox(),
          // attribute: widget.attribute,
          controller: widget.controller,
          autofocus: widget.autoFocus,
          focusNode: widget.focusNode,
          maxLines: widget.maxLines,
          keyboardType: widget.inputType,
          textInputAction: widget.inputAction,
          initialValue: widget.initialValue,
          obscureText:
              !widget.obscureText ? isPasswordVisible : !isPasswordVisible,
          readOnly: widget.readOnly,
          autocorrect: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // validator: widget.validators ?? [],
          validator: widget.validators ?? widget.validator,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxLenght,
          onChanged: widget.onChanged,
          onEditingComplete: () {
            if (widget.nextFocusNode != null) {
              widget.nextFocusNode!.requestFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          },
          onSubmitted: (value) {
            if (widget.onComplete is Function) {
              widget.onComplete!();
            }
          },
          style: const TextStyle(color: Colors.black, fontSize: 14),

          decoration: widget.decoration ??
              InputDecoration(
                suffixIcon: widget.obscureText == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: isPasswordVisible != true
                            ? Icon(
                                Icons.visibility,
                                color: darkGrey,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: darkGrey,
                              ),
                      )
                    : widget.suffixIcon,
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                filled: true,
                hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                fillColor: widget.color,
              ),

          name: widget.name!,
        ),
      ],
    );
  }
}
