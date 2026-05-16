
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/FilterProvider.dart';


import 'package:merckfoundation_252026/Provider/TestimonialProvider.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/model/TestimonialModel.dart';
import 'package:merckfoundation_252026/widgets/CommonApiStatusWidget.dart';
import 'package:merckfoundation_252026/widgets/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/EmptyStateWidget.dart';
import 'package:merckfoundation_252026/widgets/filterdrawer.dart';
import 'package:provider/provider.dart';



import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';

class TestimonialArticlesScreen
    extends StatefulWidget {
      final String shareLink;
  const TestimonialArticlesScreen({
    super.key, required this.shareLink,
  });

  @override
  State<TestimonialArticlesScreen>
      createState() =>
          _TestimonialArticlesScreenState();
}

class _TestimonialArticlesScreenState
    extends State<
      TestimonialArticlesScreen
    > {
@override
void initState() {
  super.initState();

  WidgetsBinding.instance
      .addPostFrameCallback((_) async {

    final filter =
        context.read<FilterProvider>();

    final provider =
        context.read<TestimonialArticleProvider>();

    /// 🔥 RESET OLD FILTERS
    filter.clearFilters();

    /// 🔥 LOAD CATEGORY FILTERS
    await filter.loadFilters(
      context,
      type: MediaType.testimonialArticle,
    );

    /// 🔥 INITIAL API
    await provider.fetchTestimonials(context,"");
  });
}

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
      final provider = context.watch<TestimonialArticleProvider>();

    return Scaffold(
       key: _scaffoldKey,
      endDrawer: AppDrawerfilter(type: MediaType.testimonialArticle),

      appBar: CommonAppBar(
        type: AppBarType.inner,
        title:CommonStrings.alumniTestimonies,
        onFilter:
          () => _scaffoldKey.currentState!.openEndDrawer(),

        onSearch: () {},
      
        shareLink: widget.shareLink,
      ),

      backgroundColor: Customcolor.background,
      body: _buildBody(provider),
      // body:
      //  Consumer<TestimonialArticleProvider>(
      //   builder: (context, provider, _) {
      //     if (provider.isLoading) {
      //       return const Center(
      //         child:
      //             CommonLoader(),
      //       );
      //     }

      //     if (provider
      //         .testimonials.isEmpty) {
      //       return const Center(
      //         child:EmptyStateWidget(),
      //       );
      //     }

      //     return TestimonialCarouselWidget(
      //       items: provider.testimonials,
      //     );
      //   },
      // ),
    );
  }
Widget _buildBody(TestimonialArticleProvider provider) {

  if (provider.status == ApiStatus.loading) {
    return const Center(child: CommonLoader());
  }

  if (provider.status == ApiStatus.noInternet) {
    return CommonApiStatusWidget(
      icon: Icons.wifi_off,
      title: CommonStrings.noInternetConnection,
      onRetry: () => provider.retry(context),
    );
  }

  if (provider.status == ApiStatus.timeout) {
    return CommonApiStatusWidget(
      icon: Icons.access_time,
      title: "Request Timeout",
      onRetry: () => provider.retry(context),
    );
  }

  if (provider.status == ApiStatus.error) {
    return CommonApiStatusWidget(
      icon: Icons.error_outline,
      title: provider.errorMessage,
      onRetry: () => provider.retry(context),
    );
  }

  if (provider.status == ApiStatus.success &&
      provider.testimonials.isEmpty) {
    return const EmptyStateWidget();
  }

  return TestimonialCarouselWidget(
    items: provider.testimonials,
  );
}
  
}

class TestimonialCarouselWidget
    extends StatefulWidget {
  final List<TestimonialModel> items;

  const TestimonialCarouselWidget({
    super.key,
    required this.items,
  });

  @override
  State<TestimonialCarouselWidget>
      createState() =>
          _TestimonialCarouselWidgetState();
}

class _TestimonialCarouselWidgetState
    extends State<
      TestimonialCarouselWidget
    > {
  final CarouselSliderController
  _controller =
      CarouselSliderController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.items.length,

          carouselController:
              _controller,

          options: CarouselOptions(
            viewportFraction: 1,

            height:
                MediaQuery.of(
                  context,
                ).size.height,

            enableInfiniteScroll:
                widget.items.length > 1,

            onPageChanged: (
              index,
              reason,
            ) {
              setState(() {
                currentIndex = index;
              });
            },
          ),

          itemBuilder:
              (
                context,
                index,
                realIndex,
              ) {
                final item =
                    widget.items[index];

                return _TestimonialPage(
                  item: item,
                );
              },
        ),

        /// ARROWS
        if (widget.items.length > 1)
          Positioned(
            top:
                MediaQuery.of(
                  context,
                ).size.height *
                0.22,

            left: 0,
            right: 0,

            child: Padding(
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [
                  _arrowButton(
                    icon:
                        Icons
                            .arrow_back_ios_new,

                    onTap:
                        currentIndex == 0
                        ? null
                        : () {
                            _controller
                                .previousPage();
                          },
                  ),

                  _arrowButton(
                    icon:
                        Icons
                            .arrow_forward_ios,

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

  Widget _arrowButton({
    required IconData icon,
    required VoidCallback? onTap,
  }) {
    return Container(
      height: 42,
      width: 42,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.08),

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: IconButton(
        icon: Icon(
          icon,
          size: 18,
          color:
              Customcolor.colorVoilet,
        ),

        onPressed: onTap,
      ),
    );
  }
}

class _TestimonialPage
    extends StatelessWidget {
  final TestimonialModel item;

  const _TestimonialPage({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final responsive =
        ResponsiveFlutter.of(context);

    return ListView(
      physics:
          const BouncingScrollPhysics(),

      children: [
        Padding(
          padding:
              const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              /// IMAGE
              if (item.image.isNotEmpty)
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                        24,
                      ),

                  child: AspectRatio(
                    aspectRatio: 4 / 4,

                    child:
                        FadeInImage.assetNetwork(
                          placeholder:
                              CommonImagePath
                                  .placeHolder,

                          image: item.image,

                          fit: BoxFit.cover,

                          placeholderFit:
                              BoxFit.cover,

                          fadeInDuration:
                              const Duration(
                                milliseconds:
                                    200,
                              ),

                          imageErrorBuilder:
                              (
                                context,
                                error,
                                stackTrace,
                              ) {
                                return Container(
                                  color:
                                      Colors
                                          .grey
                                          .shade200,

                                  child: const Icon(
                                    Icons
                                        .broken_image,

                                    size: 40,

                                    color:
                                        Colors
                                            .grey,
                                  ),
                                );
                              },
                        ),
                  ),
                ),

              const SizedBox(height: 18),

              /// TITLE
              SmartHtmlWidget(
                html: item.title,

                textColor:
                    Customcolor
                        .colorVoilet,

                fontSize:
                    responsive.fontSize(
                      3,
                    ),

                fontWeight:
                    FontWeight.bold,
              ),

              const SizedBox(height: 12),

              /// DEPARTMENT
              if (item
                  .departmentName
                  .isNotEmpty)
                SmartHtmlWidget(
                  html:
                      item.departmentName,
                ),

              const SizedBox(height: 12),

              /// SHORT DESCRIPTION
              if (item
                  .shortDescription
                  .isNotEmpty)
                SmartHtmlWidget(
                  html:
                      item.shortDescription,
                ),

              const SizedBox(height: 12),

              /// DETAILS
              if (item.details.isNotEmpty)
                SmartHtmlWidget(
                  html: item.details,
                ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}