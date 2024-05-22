import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';

class ImageViewWidget extends StatefulWidget {
  final List images;
  const ImageViewWidget({super.key, required this.images});

  @override
  State<ImageViewWidget> createState() => _ImageViewWidgetState();
}

class _ImageViewWidgetState extends State<ImageViewWidget> {
  PageController? _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController!.addListener(() {
      setState(() {
        _currentPageIndex = _pageController!.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                height: 210,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        CustomNetworkImageWidget(
                          imageUrl: widget.images[index],
                          width: MediaQuery.of(context).size.width,
                          height: 210,
                        ),
                        Positioned(
                          top: 12,
                          right: 18,
                          child: Text(
                            "${index + 1}/${widget.images.length}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    double dotSize = index == _currentPageIndex ? 16.0 : 10.0;
    double spacing = 8.0;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacing / 2),
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPageIndex
            ? Colors.white // Selected dot color
            : Colors.grey.withOpacity(0.5), // Unselected dot color
      ),
    );
  }
}
