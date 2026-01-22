import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/providers/program_provider.dart';
import 'package:merckfoundation_252026/widgets/CustomAdvFab.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';
import 'package:provider/provider.dart';

class ProgramFab extends StatelessWidget {
  final String programType;
  const ProgramFab({super.key, required this.programType});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Consumer<ProgramProvider>(
        builder: (_, provider, __) {
          return CustomAdvFab(
            icon: Icons.menu,
            iconColor: Customcolor.text_darkblue,
            backgroundColor: Customcolor.programyellow,
            expandedContent: ListView.separated(
              itemCount:programType=="mtm"? provider.programsSubList.length:
                ( programType=="firstLadies"|| programType=="educatingLinda")?provider.programs.length:
              
              provider.programCancerSubList.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final item = programType== "mtm"? provider.programsSubList[index]:
                ( programType=="firstLadies"|| programType=="educatingLinda")?provider.programs[index]:
              
                 provider.programCancerSubList[index];
                return InkWell(
                  onTap: item.onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormLabel(
                      text: item.title,
                      fontweight: FontWeight.w600,
                      fontSize: responsive.fontSize(2),
                      labelColor: Customcolor.text_darkblue,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
