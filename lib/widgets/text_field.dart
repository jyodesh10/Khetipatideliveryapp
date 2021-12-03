import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/size_config.dart';

import '../../theme.dart';

class MyInputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final bool? ismultiline;

  const MyInputField(
      {Key? key,
      required this.hint,
      this.controller,
      this.widget,
      this.ismultiline = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(

          //margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.only(left: 14),
          height: ismultiline! ? 160 : 45,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 0.1), width: 1.0),
            borderRadius: BorderRadius.circular(1),
          ),
          child: Row(children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.multiline,

                readOnly: widget == null ? false : true,
                autofocus: false,

                cursorColor:
                    Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                controller: controller,
                style: archivosubtitleStyle.copyWith(
                    fontSize: getFont(18), color: Colors.black),
                minLines: ismultiline! ? 2 : null,
                maxLines: ismultiline! ? 6 : null,
                // expands: true,
                decoration: InputDecoration(
                  isDense: true,

                  contentPadding: EdgeInsets.zero,
                  hintText: hint,
                  // label: Text('data'),
                  hintStyle:
                      archivosubtitleStyle.copyWith(fontSize: getFont(18)),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                ),
              ),
            ),
            widget == null ? Container() : Container(child: widget)
          ]))
    ]);
  }
}
