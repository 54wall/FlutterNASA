import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nasa/data/bean/apod_image.dart';
import 'package:flutter_nasa/res/app_colors.dart';

class ApodDetailPage extends StatefulWidget {
  final ApodImage apodImage;

  const ApodDetailPage({Key? key, required this.apodImage}) : super(key: key);

  @override
  State<ApodDetailPage> createState() => _ApodDetailPageState();
}

class _ApodDetailPageState extends State<ApodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.primaryColor,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Hero(
                    tag: widget.apodImage.title,
                    child: CachedNetworkImage(
                        imageUrl: widget.apodImage.url, fit: BoxFit.cover)),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SelectableText(
                      widget.apodImage.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.apodImage.date,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    SelectableText(
                      widget.apodImage.explanation,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
