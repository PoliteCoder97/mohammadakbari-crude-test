import 'package:flutter/material.dart';
class MyTextFormField extends StatelessWidget {
  final TextEditingController _controller;
  final String lable;
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final IconData iconData;

  MyTextFormField(this._controller, this.lable,this.iconData, this.validator,
      {this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        controller: _controller,
        validator: this.validator,
        keyboardType: this.textInputType,
        decoration: InputDecoration(
          icon: Icon(iconData),
          labelText: lable,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple,
              )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple,
              )),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}