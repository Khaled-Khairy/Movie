import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movie3/core/functions/extension.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: 55.h(context),
          child: TextField(
            controller: controller,
            onSubmitted: (value){
              Navigator.pushNamed(context, "Search",arguments: controller.text);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 16.h(context), horizontal: 8.w(context)),
              hintText: "Search..",
              hintStyle:
              const TextStyle(color: Color(0xff8D939C), fontSize: 18),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff252525)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff3f3f3f)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Search",arguments: controller.text);
                  },
                  icon: const Icon(
                    Bootstrap.search,
                    color: Color(0xfff1f1f1),
                  )),
            ),
            style: const TextStyle(color: Color(0xfff1f1f1), fontSize: 18),
            cursorColor: const Color(0xff3f3f3f),
          ),
        ));
  }
}
