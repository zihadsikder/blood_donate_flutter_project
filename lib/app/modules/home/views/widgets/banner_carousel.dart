import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, this.height, required this.imageUrls});

  final double? height;
  final List<String> imageUrls;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 210.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
            // enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          ),
          items: widget.imageUrls.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    // TODO: make it horizontal alignment
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 1.0),
                      decoration: BoxDecoration(
                          //color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.fill,
                          )),
                      alignment: Alignment.center,
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 6,
        ),
        ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //for (int i = 0; i < widget.bannerList.length; i++)
                  for (int i = 0; i < widget.imageUrls.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: i == index ? Colors.red : Colors.transparent,
                          border: Border.all(
                            color:
                                i == index ? Colors.red : Colors.grey.shade400,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                ],
              );
            })
      ],
    );
  }
}
