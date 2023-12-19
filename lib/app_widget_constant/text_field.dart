import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditText extends StatefulWidget {
  TextInputType? textInputType;
  String? hint;
  int? maxLines;
  int? minLines;
  String? name;
  int? maxLength;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  void Function()? onEditingComplete;
  void Function(String)? onChanged;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obsecureText;
  bool readOnly;
  bool enabled;

  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  bool autoFoucs;

  EditText(
      {this.textInputType,
        this.obsecureText = false,
        this.readOnly = false,
        this.maxLines,
        this.minLines,
        this.suffixIcon,
        this.prefixIcon,
        this.hint,
        this.name,
        this.textInputAction,
        this.onChanged,
        this.validator,
        this.controller,
        this.inputFormatters,
        this.enabled = true,
        this.maxLength,
        this.onEditingComplete,
        this.autoFoucs = false,
        Key? key})
      : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        onEditingComplete: widget.onEditingComplete,
        textInputAction: widget.textInputAction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.textInputType,
        obscureText: widget.obsecureText,
        readOnly: widget.readOnly,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        maxLength: widget.maxLength,
        autofocus: widget.autoFoucs,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        toolbarOptions: ToolbarOptions(
          copy: true,
          cut: true,
          paste: true,
          selectAll: true,
        ),
        style: TextStyle(
          fontSize: 14, //fontFamily: KSMFontFamily.robotoRgular
        ),
        decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            errorStyle: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.red),
            helperStyle: Theme.of(context).textTheme.subtitle1,
            hintStyle: Theme.of(context).textTheme.caption,
            hintText: widget.hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
            label: widget.name != null ? Text(widget.name ?? "" ,  style: TextStyle(color: Colors.black54),) : null,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }
}