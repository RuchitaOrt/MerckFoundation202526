import 'package:flutter/material.dart';

import 'package:merckfoundation_252026/Utility/customappbar.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/providers/program_provider.dart';
import 'package:merckfoundation_252026/screens/OurPrograms/FABS/ProgramExpansionFab.dart';
import 'package:merckfoundation_252026/screens/OurPrograms/FABS/ProgramFab.dart';
import 'package:provider/provider.dart';
class BaseProgramPage extends StatefulWidget {
  final String title;
  final ProgramType programType;
  final Widget Function(BuildContext) bodyBuilder;

  const BaseProgramPage({
    super.key,
    required this.title,
    required this.programType,
    required this.bodyBuilder,
  });

  @override
  State<BaseProgramPage> createState() => _BaseProgramPageState();
}

class _BaseProgramPageState extends State<BaseProgramPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProgramProvider>().loadProgramData(widget.programType);
      context.read<ProgramProvider>().loadProgramTabs(widget.programType);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: widget.title,
        onSearch: () {},
        onShare: () {},
        onBack: () {
         Navigator.pop(context);
        },
        shareLink: "",
      ),
      floatingActionButton:(widget.programType==ProgramType.stem || widget.programType==ProgramType.africa)?const ProgramExpansionFab():  ProgramFab(programType: widget.programType.name,),
      body: Consumer<ProgramProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return widget.bodyBuilder(context);
        },
      ),
    );
  }
}
