import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:merckfoundation_252026/Utils/common_strings.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

import 'package:merckfoundation_252026/Utils/common_images.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/providers/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// run after first frame → safe for context
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _Background(),
            _CenterLogo(),
            _VersionFooter(),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CommonImagePath.splashLogo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _CenterLogo extends StatelessWidget {
  const _CenterLogo();

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: responsive.height(3)),
        child: Image.asset(
          CommonImagePath.splashdrawer,
          width:
              responsive.isTablet ? responsive.width(45) : responsive.width(70),
          height: responsive.isTablet
              ? responsive.height(30)
              : responsive.height(40),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _VersionFooter extends StatelessWidget {
  const _VersionFooter();

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Positioned(
      left: responsive.width(4),
      right: responsive.width(4),
      bottom: responsive.height(2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// VERSION TEXT (ONLY THIS REBUILDS)
          Expanded(
            child: Selector<SplashProvider, String>(
              selector: (_, p) => Platform.isAndroid
                  ? p.serverVersion ?? ""
                  : p.iosVersion ?? "",
              builder: (_, version, __) {
                if (version.isEmpty) return const SizedBox.shrink();

                return FormLabel(
                  text: "${CommonStrings.versionText} $version",
                  labelColor: Colors.black87,
                  fontSize: responsive.fontSize(2),
                );
              },
            ),
          ),

          /// FLOWER IMAGE
          Image.asset(
            CommonImagePath.splashflower,
            width: responsive.width(35),
            height: responsive.width(45),
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
