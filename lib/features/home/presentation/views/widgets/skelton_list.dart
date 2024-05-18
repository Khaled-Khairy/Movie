import 'package:flutter/material.dart';
import 'package:movie3/core/functions/extension.dart';

import '../../../../../core/colors.dart';
import '../../../../../core/widgets/skelton.dart';

class SkeltonList extends StatelessWidget {
  const SkeltonList({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryTitle,
                style:  TextStyle(
                    color: kTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "See All",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 290.h(context),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return  Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(
                        width: 180,
                        height: 260,
                        bRadius: 10,
                        baseColor: kSkeltonColor,
                      ),
                       SizedBox(
                        height: 5.h(context),
                      ),
                      Skelton(
                        width: 160,
                        height: 10,
                        bRadius: 10,
                        baseColor: kSkeltonColor,
                      ),
                       SizedBox(
                        height: 5.h(context),
                      ),
                      Skelton(
                        width: 80,
                        height: 8,
                        bRadius: 10,
                        baseColor: kSkeltonColor,
                      ),
                    ],
                  ));
            },
            itemCount: 20,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
