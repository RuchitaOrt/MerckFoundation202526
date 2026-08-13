import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/FilterProvider.dart';

import 'package:merckfoundation_252026/Provider/TestimonialProvider.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/ImageShimmer.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/AppDrawerfilter.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class TestimonialArticlesScreen extends StatefulWidget {
  final String shareLink;
  final String title;
  final List<TestimonialModel>? initialList;
  final bool useLocalPagination;
  const TestimonialArticlesScreen({
    super.key,
    required this.shareLink,
    required this.title,
    this.initialList,
    this.useLocalPagination = false,
  });

  @override
  State<TestimonialArticlesScreen> createState() =>
      _TestimonialArticlesScreenState();
}

class _TestimonialArticlesScreenState extends State<TestimonialArticlesScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final filter = context.read<FilterProvider>();

      final provider = context.read<TestimonialArticleProvider>();

      /// 🔥 RESET OLD FILTERS
      filter.clearFilters();

      /// 🔥 LOAD CATEGORY FILTERS
      await filter.loadFilters(context, type: MediaType.testimonialArticle);

      /// 🔥 INITIAL API
      if (widget.useLocalPagination && widget.initialList != null) {
        provider.loadLocalTestimonials(widget.initialList!);
      } else {
        await provider.fetchTestimonials(context, "");
      }

      _scrollController.addListener(() {
        final provider = context.read<TestimonialArticleProvider>();

        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 200 &&
            provider.hasMore &&
            !provider.isLoading) {
          provider.loadMoreLocal();
        }
      });
      // await provider.fetchTestimonials(context,"");
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TestimonialArticleProvider>();
    final filter = context.read<FilterProvider>();
    return Scaffold(
      key: _scaffoldKey,
      // endDrawer: AppDrawerfilter(type: MediaType.testimonialArticle),

      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: filter.selectedCategory?.name == "All"
            ? widget.title
            : filter.selectedCategory?.name == ""
            ? "Merck Foundation Alumini Testimonials"
            : widget.title,
        // widget.title,
        // onFilter: () => _scaffoldKey.currentState!.openEndDrawer(),

        onSearch: () {},

        shareLink: widget.shareLink,
      ),

      backgroundColor: Customcolor.background,
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(TestimonialArticleProvider provider) {
    if (provider.status == ApiStatus.loading) {
      return const Center(child: CommonLoader());
    }
    if (provider.status != ApiStatus.success &&
        provider.status != ApiStatus.loading &&
        provider.status != ApiStatus.initial) {
      return ApiStatusHandler(
        status: provider.status,
        errorMessage: provider.errorMessage,
        onRetry: () {
          provider.retry(context);
        },
      );
    }

    if (provider.status == ApiStatus.success && provider.testimonials.isEmpty) {
      return const EmptyStateWidget();
    }

    return TestimonialCarouselWidget(
      items: provider.testimonials,
      scrollController: _scrollController,
    );
  }
}

class TestimonialCarouselWidget extends StatefulWidget {
  final List<TestimonialModel> items;
  final ScrollController scrollController;

  const TestimonialCarouselWidget({
    super.key,
    required this.items,
    required this.scrollController,
  });

  @override
  State<TestimonialCarouselWidget> createState() =>
      _TestimonialCarouselWidgetState();
}

class _TestimonialCarouselWidgetState extends State<TestimonialCarouselWidget> {
  final CarouselSliderController _controller = CarouselSliderController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.items.length,

          carouselController: _controller,

          options: CarouselOptions(
            viewportFraction: 1,

            height: MediaQuery.of(context).size.height,

            enableInfiniteScroll: widget.items.length > 1,

            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),

          itemBuilder: (context, index, realIndex) {
            final item = widget.items[index];

            return _TestimonialPage(
              item: item,
              scrollController: widget.scrollController,
            );
          },
        ),

        /// ARROWS
        if (widget.items.length > 1)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,

            left: 0,
            right: 0,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  _arrowButton(
                    icon: Icons.arrow_back_ios_new,

                    onTap: currentIndex == 0
                        ? null
                        : () {
                            _controller.previousPage();
                          },
                  ),

                  _arrowButton(
                    icon: Icons.arrow_forward_ios,

                    onTap: () {
                      _controller.nextPage();
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _arrowButton({required IconData icon, required VoidCallback? onTap}) {
    return Container(
      height: 42,
      width: 42,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: IconButton(
        icon: Icon(icon, size: 18, color: Customcolor.colorVoilet),

        onPressed: onTap,
      ),
    );
  }
}

class _TestimonialPage extends StatelessWidget {
  final TestimonialModel item;
  final ScrollController scrollController;

  const _TestimonialPage({required this.item, required this.scrollController});
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return ListView(
      controller: scrollController,
      shrinkWrap: true,
      //12june
      physics: const ScrollPhysics(),

      children: [
        Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// IMAGE
              if (item.image.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),

                  // child:
                  // AspectRatio(
                  //   aspectRatio: 4 / 4,
                  child: CachedNetworkImage(
                    memCacheHeight: 1000,
                    imageUrl: item.image,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const ImageShimmer(),

                    errorWidget: (_, __, ___) => Image.asset(
                      CommonImagePath.placeHolder,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // FadeInImage.assetNetwork(
                  //   placeholder: CommonImagePath.placeHolder,

                  //   image: item.image,

                  //   fit: BoxFit.contain,

                  //   placeholderFit: BoxFit.cover,

                  //   fadeInDuration: const Duration(milliseconds: 200),

                  //   imageErrorBuilder: (context, error, stackTrace) {
                  //     return
                  // Container(
                  //       color: Colors.grey.shade200,

                  //       child: const Icon(
                  //         Icons.broken_image,

                  //         size: 40,

                  //         color: Colors.grey,
                  //       ),
                  //     );
                  //   },
                  // ),
                  // ),
                ),

              const SizedBox(height: 18),

              /// TITLE
              SmartHtmlWidget(
                html: item.title,

                textColor: Customcolor.colorVoilet,

                fontSize: responsive.fontSize(3),

                fontWeight: FontWeight.bold,
              ),

              const SizedBox(height: 12),

              // DEPARTMENT
              if (item.departmentName.isNotEmpty)
                SmartHtmlWidget(html: item.departmentName),

              const SizedBox(height: 12),

              /// SHORT DESCRIPTION
              // if (item.shortDescription.isNotEmpty)
              //   SmartHtmlWidget(html: item.shortDescription),

              // const SizedBox(height: 12),

              /// DETAILS
              if (item.details.isNotEmpty) SmartHtmlWidget(html: item.details),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
