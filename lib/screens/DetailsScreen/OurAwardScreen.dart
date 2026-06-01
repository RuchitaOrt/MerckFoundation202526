import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Provider/AwardProvider.dart';
import 'package:merckfoundation_252026/Utility/ApiStatusHandler.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utility/api_status.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/model/AwardResponse.dart';

import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/screens/MainUIBody.dart/CommonContentPage.dart';

import 'package:merckfoundation_252026/widgets/CommonWidget/CommonLoader.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';

import 'package:provider/provider.dart';

class OurAwardScreen extends StatefulWidget {
  final String title;
  const OurAwardScreen({super.key, required this.title});

  @override
  State<OurAwardScreen> createState() => _OurAwardScreenState();
}

class _OurAwardScreenState extends State<OurAwardScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<AwardProvider>().getAwards(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AwardProvider>();

    final awards = provider.awardList;

    return Scaffold(
      backgroundColor: Customcolor.background,

      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: widget.title,
        onSearch: () {},
      ),

      body: Builder(
        builder: (context) {
          /// LOADING
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
          
          /// SUCCESS UI
          return ListView(
            children: [
              /// AWARD LIST
              Padding(
                padding: const EdgeInsets.all(8.0),

                child: ListView.separated(
                  shrinkWrap: true,

                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: awards.length,

                  separatorBuilder: (_, __) => const SizedBox(height: 12),

                  itemBuilder: (context, index) {
                    final award = awards[index];
final Color color = Color(
  int.tryParse(award.colorCode ?? '') ?? 0xff0e69af,
);
                    return AwardCard(
                      award: award,

                      color: color ,
                    );
                  },
                ),
              ),

              8.0.heightBox,

              const FooterFlowerImage(),

              8.0.heightBox,

              Bottomcardlink(),
            ],
          );
        },
      ),
    );
  }
}

class AwardCard extends StatelessWidget {
  final AwardModel award;
  final Color color;

  const AwardCard({super.key, required this.award, required this.color});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// CONTENT
          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text(
                  award.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: responsive.fontSize(2.15),
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                /// BUTTON
                InkWell(
                  borderRadius: BorderRadius.circular(30),

                  onTap: () {
                    print(award.pageUrl);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CommonContentPage(
                          title: award.title,
                          menuID: award.menuId.toString(),
                          shareLink: award.pageUrl,
                        ),
                      ),
                    );
                  },

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          CommonStrings.readMore,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w700,
                            fontSize: responsive.fontSize(1.7),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Icon(
                          Icons.arrow_forward_rounded,
                          color: color,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
