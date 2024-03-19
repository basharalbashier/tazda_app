import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListPage extends StatefulWidget {
  const LoadingListPage({super.key});

  @override
  State<LoadingListPage> createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  Widget shimmerItem(int index) {
    if (index % 2 == 0) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          TitlePlaceholder(width: 400),
          SizedBox(height: 16.0),
          ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
        ],
      );
    }
    return const Column(
      children: [
        SizedBox(height: 16.0),
        ContentPlaceholder(
          lineType: ContentLineType.threeLines,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              for (int i = 0; i < 10; i++) i == 0 ? Container() : shimmerItem(i)
            ],
          ),
        ));
  }
}

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 12.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          // Container(
          //   width: width,
          //   height: 12.0,
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ContentPlaceholder({
    Key? key,
    required this.lineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width / 3,
            height: size.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: SizedBox(
              height: size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 30.0,
                    // color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                  ),
                  if (lineType == ContentLineType.threeLines)
                    Container(
                      width: double.infinity,
                      height: 10.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.only(bottom: 8.0),
                    ),
                  Container(
                    width: 100.0,
                    height: 10.0,
                    color: Colors.white,
                  ),
                  Container(
                    width: 100.0,
                    height: 10.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
