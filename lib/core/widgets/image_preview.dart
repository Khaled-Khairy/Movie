import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie3/core/functions/extension.dart';

import '../colors.dart';

class ImagePreview extends StatelessWidget {
  final String posterPath;
  final String title;
  final double voteAverage;
  final bool isAdult;
  final bool isHome;

  const ImagePreview(
      {super.key,
        required this.posterPath,
        required this.title,
        required this.voteAverage,
        required this.isAdult,
        required this.isHome});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: double.infinity,
          height: 540.h(context),
          child: CachedNetworkImage(
            key: ValueKey("http://image.tmdb.org/t/p/original$posterPath"),
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator(color: Colors.white,)),
            imageUrl: "http://image.tmdb.org/t/p/original$posterPath",
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fadeOutDuration: const Duration(seconds: 0),
          ),),
        Container(
          height: 540.h(context),
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                kBackGroundColor,
                Colors.transparent,
              ],
            ),
          ),
        ),
        isHome
            ? Container(
          color: Colors.transparent,
        )
            : Positioned(
          top: 5,
          left: 5,
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                  backgroundColor: Color(0xff0f0f0f),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xfff1f1f1),
                  ))),
        ),
        isAdult
            ? Positioned(
            top: 5,
            right: 5,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                "images/plus18.png",
                fit: BoxFit.cover,
              ),
            ))
            : Container(
          color: Colors.transparent,
        ),
        Positioned(
          left: 8,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 412.w(context),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xfff1f1f1),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: 85.w(context),
                height: 35.h(context),
                decoration: BoxDecoration(
                    color: const Color(0xffDEC808),
                    borderRadius: BorderRadius.circular(7)),
                child: Center(
                    child: Text(
                      "IMDB ${voteAverage.toStringAsFixed(1)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
