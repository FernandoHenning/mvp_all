import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatefulWidget {
  final String? initialText;
  final String hintText;
  bool? password;
  final bool? number;
  final Function change;
  TextFieldCustom({
    Key? key,
    this.initialText,
    required this.hintText,
    this.password,
    this.number = false,
    required this.change,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    TextEditingController? _controller;
    if (widget.initialText != null) {
      _controller = TextEditingController(text: widget.initialText);
    }
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextFormField(
        // validator: ,
        controller: _controller,
        keyboardType: widget.number! ? TextInputType.number : null,
        inputFormatters:
            widget.number! ? [FilteringTextInputFormatter.digitsOnly] : [],
        obscureText:
            widget.password != null && widget.password == true ? true : false,
        enableSuggestions:
            widget.password != null && widget.password == true ? false : true,
        autocorrect:
            widget.password != null && widget.password == true ? false : true,
        decoration: InputDecoration(
          suffixIcon: widget.password != null
              ? IconButton(
                  onPressed: () {
                    widget.password = !widget.password!;
                    setState(() {});
                  },
                  icon: widget.password == true
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility))
              : null,
          // labelText: hintText,
          // contentPadding: EdgeInsets.all(10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54),
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),

          hintText: widget.hintText, // pass the hint text parameter here
          hintStyle: const TextStyle(color: Colors.black54),
        ),
        onChanged: (value) {
          // change(value);
        },
      ),
    );
  }
}
