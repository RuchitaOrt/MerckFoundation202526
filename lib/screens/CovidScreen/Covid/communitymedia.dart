import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utility/ResponsiveFlutter.dart';
import 'package:merckfoundation_252026/widgets/CommonWidget/customappbar.dart';
import 'package:merckfoundation_252026/Utility/showdailog.dart';
import 'package:merckfoundation_252026/CommonUtils/common_images.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';
import 'package:merckfoundation_252026/enum/commonEnum.dart';
import 'package:merckfoundation_252026/widgets/FooterFlowerImage.dart';
import 'package:merckfoundation_252026/widgets/SmartHtmlWidget.dart';
import 'package:merckfoundation_252026/widgets/Bottomcardlink.dart';
import 'package:merckfoundation_252026/widgets/formLabel.dart';

class CommunityMedia extends StatefulWidget {
  const CommunityMedia({super.key});

  @override
  State<CommunityMedia> createState() => _CommunityMediaState();
}

class _CommunityMediaState extends State<CommunityMedia> {
  final String videoLink = "https://www.youtube.com/embed/SvErYCf4Bz0";

  String get videoId => videoLink.substring(videoLink.length - 11);

  void _openYoutube() {
    ShowDialogs.youtubevideolink(
      "https://www.youtube.com/watch?v=$videoId?rel=0&autoplay=1",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: CommonAppBar(
        type: AppBarType.inner,
        title: CommonStrings.communityTitle,
        onSearch: () {},
       
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                8.0.heightBox,
                 _TitleText(),
            
                     8.0.heightBox,
            
            _ImageBlock(CommonImagePath.stayHomeGif),
            
            8.0.heightBox,
            
            _VideoThumbnail(videoId: videoId, onTap: _openYoutube),
             8.0.heightBox,
            
            _SectionHeading(title: CommonStrings.winnersText),
            
            8.0.heightBox,
            
            SmartHtmlWidget(
              html: """<div class="video-single" style="text-align: center;">
          
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><br />
          <span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="line-height:150%"><span style="line-height:150%">Winners from <b>Southern African</b> <b>Countries</b> in partnership with <b>The First Lady of</b> <b>Malawi, </b></span><b><span style="line-height:150%">H.E. MONICA CHAKWERA;</span></b><b><span style="line-height:150%"> The First Lady of Namibia, </span></b><b><span style="line-height:150%">H.E. MONICA GEINGOS; </span></b><b><span style="line-height:150%">The First Lady of Zambia, </span></b><b><span style="line-height:150%">H.E. ESTHER LUNGU and</span></b><b><span style="line-height:150%"> The First Lady of Zimbabwe, H.E. AUXILLIA MNANGAGWA:</span></b></span><span style="background:#0070c0"><span style="line-height:normal"><a name="_Hlk53581115"></a></span></span></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><u style="font-size:11pt; font-family:Verdana, Geneva, sans-serif"><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Tendai Rupapa</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:black">- </span></span><span style="font-size:10.0pt"><span style="color:#7030a0">The Herald,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">ZIMBABWE</span></span></b><b> </b></span></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></span></li>
            <li style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Keletso Thobega</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:black">-<b> </b></span></span><span style="font-size:10.0pt"><span style="color:#7030a0">Botswana Guardian &amp; The Midweek Sun</span></span><b><span style="font-size:10.0pt"><span style="color:black">, </span></span></b><b><span style="font-size:10.0pt"><span style="color:#7030a0">BOTSWANA</span></span></b><b> </b></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">June Shimuoshili</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:black">-<b> </b></span></span><span style="font-size:10.0pt"><span style="color:#7030a0">Unwrap.online,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">NAMIBIA</span></span></b><b>&nbsp;</b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Faith Mzungu-Vilakati</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff0066">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">Daily News, </span></span><b><span style="font-size:10.0pt"><span style="color:#ff33cc">ESWATINI</span></span></b><b> </b></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#ff33cc">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Andrew Mambondiyani</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff0066">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">The African Argument,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">ZIMBABWE&nbsp;</span></span></b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Mercy Malikwa </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">-</span></span></span><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">MW Nation,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">MALAWI</span></span></span></b></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Adolf Kaure</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">Namibia Media Holdings, <b>NAMIBIA</b></span><b> </b></span></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Henry Sinyangwe </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">Zambia Daily Mail,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">ZAMBIA</span></span></b><b>&nbsp;</b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Violet Mengo</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff0066">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">Zambia Daily Mail,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">ZAMBIA</span></span></b><b> </b></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#ff33cc">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Bridget Mananavire</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff0066">-</span></span> <span style="font-size:10.0pt"><span style="color:#ff3399">Independent Senior Reporter,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">ZIMBABWE&nbsp;</span></span></b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Cliff Chiduku</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">-</span></span></span><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">News Day,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">ZIMBABWE</span></span></span></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3300">&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">MULTIMEDIA CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Abdullah Vawda</span></span></i><span style="font-size:10.0pt"><span style="color:black"> - </span></span></b><span style="font-size:10.0pt"><span style="color:#7030a0">LENZ TV,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">SOUTH AFRICA</span></span></b><b> </b></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Selima Henock</span></span></i><span style="font-size:10.0pt"><span style="color:black"> - </span></span></b><span style="font-size:10.0pt"><span style="color:#7030a0">Namibian Broadcasting Corporation,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">NAMIBIA</span></span></b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Denver Kisting </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff0066">- </span></span><span style="font-size:10.0pt"><span style="color:#ff3399">Namibian Broadcasting Corporation,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">NAMIBIA</span></span></b><b> </b></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#ff33cc">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Aston Gondwe </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff0066">- </span></span></span><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">Malawi Broadcasting Corporation,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">MALAWI&nbsp;</span></span></span></b></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">RADIO CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Rachel Nghimulitete</span></span></i><span style="font-size:10.0pt"><span style="color:black"> - </span></span></b><span style="font-size:10.0pt"><span style="color:#7030a0">Namibian Broadcasting Cooperation,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">NAMIBIA</span></span></b><b>&nbsp;</b></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Team </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff0066">- </span></span><span style="font-size:10.0pt"><span style="color:#ff3399">The Children&#39;s Radio,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">SOUTH AFRICA</span></span></b><b> </b></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#ff33cc">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Aunyango Nkhoma </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff0066">- </span></span></span><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">Zodiak Broadcasting Station,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">MALAWI</span></span></span></b><b>&nbsp;</b></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Prudence Siabana </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">-</span></span></span><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Radio Phoenix,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">ZAMBIA</span></span></span></b></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="color:#990099;"><span style="font-size:14.0pt;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="line-height:150%"><span style="line-height:150%">Winners from <b>West African Countries</b> in partnership with <b>The First Lady of</b> <b>The Gambia,</b></span><b><span style="line-height:150%"> H. E. FATOUMATTA BAHBARROW and </span></b><b><span style="line-height:150%">The First Lady of Liberia, H.E. CLAR MARIE WEAH:</span></b></span></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul>
            <li style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Alieu Ceesay</span></span></i><span style="font-size:10.0pt"><span style="color:black"> - </span></span></b><span style="font-size:10.0pt"><span style="color:#7030a0">Q TV,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">GAMBIA</span></span></b><b>&nbsp;</b></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><u style="font-size:11pt; font-family:Verdana, Geneva, sans-serif"><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Hawa Dolly</span></span></span></i><b><i> </i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:black">- </span></span></span></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">Liberia News Agency,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">LIBERIA</span></span></span></b><b>&nbsp;</b></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">Ishmael Sallieu Koroma</span></span></span></i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:black"> - </span></span></span></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">Concord Times Newspaper &amp; Pan African Visions Online.com</span></span></span><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">SIERRA LEONE</span></span></span></b></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif;">Here are the winners from <strong>East African Countries:</strong></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">Hillary Orinde -</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">Standard Media Group,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">KENYA</span></span></span></b></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Arnold Kwizera -</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">CNBC Africa,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">RWANDA</span></span></span></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3300">&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Geoffrey Kamadi -</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Scientific African,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">KENYA</span></span></span></b><b>&nbsp;</b></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">Esther Oluka - </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">Daily Monitor,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">UGANDA</span></span></span></b><b>&nbsp;</b></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Veronica Romwald Mrema -</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">Jamvi La Habari,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">TANZANIA </span></span></b></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#ff3399">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Lydia Atieno Barasa -</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">The New Times,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">RWANDA</span></span></b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Evelyn Makena Gatobu -</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">People Daily,<b> KENYA</b></span></span></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">MULTIMEDIA CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Mashirima Kapombe - </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">Citizen TV,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">KENYA&nbsp;</span></span></b></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Dorcas Wangira - </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">Citizen TV,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">KENYA</span></span></b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Daniel Sebakijje -</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">NBS TV,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">UGANDA</span></span></span></b><b>&nbsp;</b></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">RADIO CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">Mwanaisha Makumbuli - </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">Highlands FM Radio,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#7030a0">TANZANIA</span></span></span></b><b>&nbsp;</b></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Kigongo Issa -</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">Radio Bilal,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">UGANDA&nbsp;</span></span></span></b></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="line-height:150%"><span style="line-height:150%">Winners from <b>African</b> <b>French-speaking </b><b>Countries</b> in partnership with <b>The First Lady of</b> <b>Central African Republic (CAR), </b></span><b><span style="line-height:150%">H.E. BRIGITTE TOUADERA;</span></b><b><span style="line-height:150%"> The First Lady of Burundi, </span></b><b><span style="line-height:150%">H.E. ANGELINE NDAYISHIMIYE; </span></b><b><span style="line-height:150%">The First Lady of Niger, H.E. A&Iuml;SSATA ISSOUFOU MAHAMADOU:</span></b></span></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Ars&egrave;ne-Jonathan Mosseavo</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Blog Lanoca,<b> C.A.R.,</b></span><b> </b></span></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Abdel Aziz Hali </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">- La Presse de,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">TUNISIA</span></span></b><b>&nbsp;</b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Alphonse Julio</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">- Global News,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">BENIN</span></span></b><span style="font-size:10.0pt"><span style="color:#ff3300"> </span></span></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#ff3399">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Boris Esono Nwenfor - </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff3399">Pan African Vision, </span></span><b><span style="font-size:10.0pt"><span style="color:#ff33cc">CAMEROON</span></span></b><span style="font-size:10.0pt"><span style="color:#ff3300">&nbsp;</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#70ad47">Elise Nandrasanela</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#70ad47">- L&#39;Express de Madagascar,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#70ad47">MADAGASCAR</span></span></b></span></span>&nbsp;<span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#70ad47">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#70ad47">Bahwa Ferdinand</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#70ad47">- Le Journal.Africa,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#70ad47">BURUNDI</span></span></b><span style="font-size:10.0pt"><span style="color:#ff3300">&nbsp;</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Issa Moussa</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Niger Times,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">NIGER</span></span></b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Koami Agbetiafa</span></span></i><span style="font-size:10.0pt"><span style="color:#ff33cc"> - </span></span></b><span style="font-size:10.0pt"><span style="color:#ff3399">Niger Le R&eacute;publicain,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">NIGER</span></span></b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">RADIO CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Salissou kaka</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Saraounia FM,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">NIGER </span></span></b></span></span>&nbsp;<span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Boussanga Bissa</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Radio Voix Du Paysan,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">BURKINA FASO</span></span></b><b>&nbsp;</b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Mokwe Welisane Epse Nkeng Ngoneh</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">- Cameroon Radio Television,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">CAMEROON&nbsp;</span></span></b></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif;"><span style="font-size:14.0pt;"><span style="color:#990099;">Winners from <b>African</b> <b>Portuguese-speaking </b><b>Countries</b> in partnership with <b>The First Lady of</b> <b>Angola, </b><b style="font-size:11pt; font-family:Verdana, Geneva, sans-serif">H.E. ANA DIAS LOUREN&Ccedil;O and The First Lady of Mozambique, H.E. ISAURA FERR&Atilde;O NYUSI:</b></span></span></span></p>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Cornelio Rosa</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Televis&atilde;o de Mo&ccedil;ambique,<b> MOZAMBIQUE</b></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">C&eacute;sar Silveira</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Valor Econ&ocirc;mico,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">ANGOLA</span></span></b><span style="font-size:10.0pt"><span style="color:#ff3300">&nbsp;</span></span></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Evelina Muchanga Mavie</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Sociedade do Not&iacute;cias, <b>MOZAMBIQUE</b></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">L&iacute;dia Manuel Cossa</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">- Jornal Dossiers &amp; Factos,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">MOZAMBIQUE</span></span></span></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3300">&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Frederico Lucas Jamisse Mossigueja - </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Jornal domingo-Sociedade do Not&iacute;cias,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">MOZAMBIQUE</span></span></span></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3300">&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">MULTIMEDIA CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Abdul Remane Alifate Ibraimo</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- TV Surdo,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">MOZAMBIQUE</span></span></b><span style="font-size:10.0pt"><span style="color:#ff3300">&nbsp;</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Pascoal Malate - </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">Televis&atilde;o de Mo&ccedil;ambique,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">MOZAMBIQUE</span></span></span></b></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><a name="_Hlk53499698"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">RADIO CATEGORY WINNERS:</span></span></u></a></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Jeremias Mondlane</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Radio Mozambique,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">MOZAMBIQUE</span></span></b><span style="font-size:10.0pt"><span style="color:#ff3300">&nbsp;</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Sumali Gilberto Sumagil Picaires - </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">Radio Mozambique,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">MOZAMBIQUE</span></span></span></b></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Nelson Mainato -</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Radio Mozambique,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">MOZAMBIQUE</span></span></span></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3300">&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif">Winners from <b>AFRICAN ARABIC SPEAKING COUNTRIES</b></span></span></span></p>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Sama Saeed </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">- Al-Watan,<b> EGYPT</b></span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif">Winners from <b>Ghana </b>in partnership with <b>The First Lady of Ghana, H.E. REBECCA AKUFO-ADDO:</b></span></span></span></p>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Albert Futukpor</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Ghana News Agency</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Lydia Kukua Asamoah - </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">Ghana News Agency&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Ama Tekyiwaa Ampadu Agyeman</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- New Times Corporation </span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">MULTIMEDIA CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Grace Hammoah Asare</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Media General, TV3&nbsp;</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:107%"><b><i><span style="font-size:10.0pt"><span style="line-height:107%"><span style="color:#ff33cc">Nana Yaw Gyimah Mensah</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:107%"><span style="color:#ff3399">- Multimedia Group Limited</span><span style="color:#ff3300">&nbsp;</span></span></span></span></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#ff3399">And</span></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Wendy Laryea - </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff3399">TV 3 Network</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif">Winners from <b>Nigeria </b>in partnership with <b>The First Lady of Nigeria, H.E. Dr. AISHA MUHAMMADU BUHARI:</b></span></span></span></p>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Ishioma Emi Mary </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">- Ventures Africa </span></span></span></span>&nbsp;<span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Ebere Agozie</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- GFH News</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Odimegwu Onwumere</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">- The Nigerian Voice&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Ojoma Akor</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Daily Trust&nbsp;</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">MULTIMEDIA CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Aneta Felix</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- TV360 Nigeria</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">RADIO CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Ekene Odigwe</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Federal Radio Corporation of Nigeria, Coalcity FM&nbsp;</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif">Winners from <b>DRC </b>in partnership with <b>The First Lady of Democratic Republic of the Congo, H.E. DENISE NYAKERU TSHISEKEDI:</b></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Cassien Tribunal Aungane </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">- Radio Centrale &amp; &quot;Diplomacy &amp; Development&quot; </span></span></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#7030a0">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Mukanya Kafuata Andre</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">&ndash; Mbote Africa</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">St&eacute;phie Manza Mukinzi </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">&ndash; Alert Coronavirus&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Mathy Musau Dinyika</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- Forum Des As&nbsp;</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">MULTIMEDIA CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Muemba Wa Muemba Donat</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">&ndash; Jua Magazine&nbsp;</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Jessy Nzengu</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">- Palmier Radio-T&eacute;l&eacute;vision Communautaire&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Kazadi Lukusa Nicolas - </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Radiot&eacute;l&eacute;vision Happy Day&nbsp;</span></span></span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">RADIO CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Aly Bukasa Kabambi </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">&ndash; Radio Communautaire Butook&nbsp;</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Jody Daniel Nkashama</span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">- Radio Okapi </span><span style="color:#ff3300">(300 USD)</span></span></span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif">Winners from <b>MALI&nbsp;</b></span></span></span></p>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Fousseni Togola </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">- Phileingora </span><span style="color:#ff3300">(500 USD)</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff33cc">Cheick Moctar Traor&eacute; &amp; Team </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3399">&ndash; L&#39;essor &nbsp;</span><span style="color:#ff3300">(300 USD) </span></span></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Br&eacute;hima Traor&eacute;</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">- L&#39;Esp&eacute;rance </span><span style="color:#ff3300">(500 USD)</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">MULTIMEDIA CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Moussa Abdoulaye Papa Haidara</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">&ndash; ORTM &Agrave; Bamako </span><span style="color:#ff3300">(500 USD)</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">RADIO CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Moussa Kone </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">&ndash; Radio Cha&icirc;ne 2 de ORTM (</span><span style="color:#ff3300">500 USD)</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif">Winners from <b>LATIN AMERICAN COUNTRIES</b></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul>
            <li style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Jos&eacute; Lebe&ntilde;a Acevo &amp; Ignacio G&oacute;mez Villase&ntilde;or</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:black">- </span></span><span style="font-size:10.0pt"><span style="color:#7030a0">Publimetro,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">MEXICO</span></span></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3300">(1000 USD)</span></span><i> </i></span></span></span></li>
            <li style="margin: 0in 0in 8pt; text-align: left;"><b style="font-size:11pt; font-family:Verdana, Geneva, sans-serif; text-align:justify"><i><span style="font-size:10.0pt"><span style="color:#7030a0">Luiza Pollo Mazurek </span></span></i></b><span style="font-size:10pt; text-align:justify"><span style="font-family:Verdana, Geneva, sans-serif"><span style="color:black">-<b> </b></span></span></span><span style="font-size:10pt; text-align:justify"><span style="font-family:Verdana, Geneva, sans-serif"><span style="color:#7030a0">Tab.uol media,</span></span></span><b style="font-size:11pt; font-family:Verdana, Geneva, sans-serif; text-align:justify"> </b><b style="font-size:11pt; font-family:Verdana, Geneva, sans-serif; text-align:justify"><span style="font-size:10.0pt"><span style="color:#7030a0">BRAZIL</span></span></b><b style="font-size:11pt; font-family:Verdana, Geneva, sans-serif; text-align:justify"> </b><span style="font-size:10pt; text-align:justify"><span style="font-family:Verdana, Geneva, sans-serif"><span style="color:#ff3300">(1000 USD)</span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Nicol&aacute;s Bustamante Hern&aacute;ndez &amp; Santiago Vargas </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff0066">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">El Tiempo, </span></span><b><span style="font-size:10.0pt"><span style="color:#ff33cc">COLOMBIA</span></span></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3300">(750 USD)</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Mariana Fern&aacute;ndez Camacho </span></span></span></i></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">-</span></span></span><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Infobae Online,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">ARGENTINA</span></span></span></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3300">(500 USD)</span></span></span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">PRINT CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Andr&eacute; Biernath</span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#7030a0">Veja Sa&uacute;de, <b>BRAZIL</b></span><b> </b><span style="color:#ff3300">(1000 USD)</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><b style="font-size:11pt"><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Ana Catalina Baldrich </span></span></i></b><span style="font-size:10pt"><span style="color:#ff0066">-</span></span><b style="font-size:11pt"> </b><span style="font-size:10pt"><span style="color:#ff3399">Credential Magazine, </span></span><b style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#ff33cc">COLOMBIA</span></span></b><b style="font-size:11pt"> </b><span style="font-size:10pt"><span style="color:#ff3300">(750 USD)</span></span><span style="font-size:14.6667px"><b>&nbsp;</b></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="font-size:10.0pt"><span style="color:#ff33cc">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Claudia Cristina Nicolini </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff0066">-</span></span> <span style="font-size:10.0pt"><span style="color:#ff3399">La Gaceta,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">ARGENTINA </span></span></b><span style="font-size:10.0pt"><span style="color:#ff3300">(750 USD)</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Carla Mart&iacute;nez Guill&eacute;n</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">-</span></span></span><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">El Universal,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">MEXICO</span></span></span></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3300"> (500 USD)</span></span></span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">MULTIMEDIA CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Adriana Becerra </span></span></i><span style="font-size:10.0pt"><span style="color:black">- </span></span></b><span style="font-size:10.0pt"><span style="color:#7030a0">En Transici&oacute;n TV,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">MEXICO</span></span></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3300">(1000 USD)</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Laura Daicz</span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff0066">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">LePlante LaSabia, </span></span><b><span style="font-size:10.0pt"><span style="color:#ff33cc">COLOMBIA</span></span></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3300">(750 USD)</span></span></span></span><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b>&nbsp;</b><span style="font-size:10.0pt"><span style="color:#ff33cc">And</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Roxana Lopresti </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff0066">&ndash;</span></span> <span style="font-size:10.0pt"><span style="color:#ff3399">Canal 9,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">ARGENTINA </span></span></b><span style="font-size:10.0pt"><span style="color:#ff3300">(750 USD)</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:12.0pt"><span style="color:#70ad47">THIRD Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:150%"><b><i><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">Jusciane Matos de Lima</span></span></span></i></b><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">-</span></span></span><b> </b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">TV Justica,</span></span></span><b> </b><b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#70ad47">BRAZIL</span></span></span></b><span style="font-size:10.0pt"><span style="line-height:150%"><span style="color:#ff3300"> (500 USD)</span></span></span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">RADIO CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:15.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Corina Gonzalez Tejedor </span></span></i></b><span style="font-size:10.0pt"><span style="color:#7030a0">&ndash; Radio Cantilo, </span></span><b><span style="font-size:10.0pt"><span style="color:#7030a0">ARGENTINA</span></span></b><span style="font-size:10.0pt"><span style="color:#7030a0"> (</span><span style="color:#ff3300">1000 USD)</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></span></span></span></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Daniel Revol </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff0066">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">Radio La Red, </span></span><b><span style="font-size:10.0pt"><span style="color:#ff33cc">ARGENTINA</span></span></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3300">(750 USD)</span></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-size:14.0pt;"><span style="color:#990099;"><span style="font-family:Verdana,Geneva,sans-serif">Winners from <b>ASIA</b></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;">&nbsp;</p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#0d0d0d">ONLINE CATEGORY WINNERS:</span></span></u></span></span></span></p>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><u><span style="font-size:16.0pt"><span style="color:#7030a0">FIRST Position: </span></span></u></span></span></span></p>
          
          <ul>
            <li style="margin: 0in 0in 8pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><span style="line-height:normal"><b><i><span style="font-size:10.0pt"><span style="color:#7030a0">Revathi Murugappan </span></span></i></b><span style="font-size:10.0pt"><span style="color:black">- </span></span><span style="font-size:10.0pt"><span style="color:#7030a0">The Star,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#7030a0">MALAYSIA</span></span></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3300">(500 USD)</span></span><i> </i></span></span></span></li>
          </ul>
          
          <p style="margin: 0in 0in 8pt; text-align: left;"><u style="font-size:11pt; font-family:Verdana, Geneva, sans-serif"><span style="font-size:14.0pt"><span style="color:#ff3399">SECOND Position:</span></span></u></p>
          
          <ul style="list-style-type:square">
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Milan Rijal </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff0066">-</span></span><b> </b><span style="font-size:10.0pt"><span style="color:#ff3399">Online Khabar, </span></span><b><span style="font-size:10.0pt"><span style="color:#ff33cc">NEPAL</span></span></b><b> </b><span style="font-size:10.0pt"><span style="color:#ff3300">(300 USD)</span></span></span></span></li>
            <li class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;"><span style="font-family:Verdana,Geneva,sans-serif"><span style="font-size:11pt"><b><i><span style="font-size:10.0pt"><span style="color:#ff33cc">Nino Chibchiuri </span></span></i></b><span style="font-size:10.0pt"><span style="color:#ff0066">&ndash;</span></span> <span style="font-size:10.0pt"><span style="color:#ff3399">IWPR,</span></span><b> </b><b><span style="font-size:10.0pt"><span style="color:#ff33cc">GEORGIA </span></span></b><span style="font-size:10.0pt"><span style="color:#ff3300">(300 USD)</span></span></span></span></li>
          </ul>
          
          <p class="MsoPlainText" style="margin: 0in 0in 0.0001pt; text-align: left;">&nbsp;</p>
          </div>
          
          <p style="text-align: center;"><span style="color:#8e44ad;"><span style="font-size:14.0pt;"><span style="font-family:Verdana,Geneva,sans-serif;"><b>Call for Application&nbsp;&ldquo;Stay at Home&rdquo; Media Recognition Awards 2020&nbsp;</b><b>for Africa, Latin America and Asia.&nbsp;</b></span></span></span></p>
          
          
          
          </div>""",
            ),
            _ImageBlock(CommonImagePath.imgOne),
             SmartHtmlWidget(
              html:
                  """<p><span style="font-size:12.0pt;"><span style="font-family:Verdana,Geneva,sans-serif;"><span style="color:#8e44ad;"><strong>Theme:&nbsp;</strong></span></span></span><br />
          <span style="font-size:11.0pt;"><span style="font-family:Verdana,Geneva,sans-serif;"><span style="color:#000000;">Raising awareness about Coronavirus and sensitize communities how to stay safe and keep Healthy physical and Mentally during coronavirus lockdown or restricted movement.</span></span></span></p>
          
          <p><span style="font-size:12.0pt;"><span style="color:#8e44ad;"><strong><span style="font-family:Verdana,Geneva,sans-serif;">Categories:</span></strong></span></span></p>
          
          <p><span style="color:#000000;"><span style="font-size:11.0pt;"><span style="font-family:Verdana,Geneva,sans-serif;">Multimedia<br />
          Print Media<br />
          Online Media<br />
          Radio</span></span></span></p>""",
            ),
            _ImageBlock(CommonImagePath.imgTwo),
            _ImageBlock(CommonImagePath.imgThree),
            _ImageBlock(CommonImagePath.imgFour),
            _ImageBlock(CommonImagePath.imgFive),
             8.0.heightBox,
             SmartHtmlWidget(
              html:
                  """ <p><span style="font-size:11.0pt;"><span style="font-family:Verdana,Geneva,sans-serif;"><span style="color:#8e44ad;"><b>&ldquo;STAY at HOME&rdquo; Media Recognition Committee:</b></span><br />
<br />
<span style="color:#000000;">The committee is formed to select the winners in an unbiased manner, based on evaluating the quality of information included to sensitize the communities about about Coronavirus and sensitize communities how to stay safe and keep Healthy physical and Mentally during coronavirus lockdown or restricted movement in a way that regular community member can comprehend.</span></span></span></p>""",
            ),
            SmartHtmlWidget(html: """<h5>Selection Committee:</h5>

			<h5>Chaired by:</h5>
			<p>Dr. Rasha Kelej</p>
			<p>CEO of Merck Foundation and President of Merck More than a Mother</p>
					<h5>Members:</h5>
			<p>Leonard Saika</p>
			<p>Merck Foundation Program Senior Director</p>
				<p>Mehak Handa</p>
			<p>Merck Foundation Communication Manager</p>
			<p>Kanaga Janani Chandrasekaran</p>
			<p>Merck Foundation Community Awareness Coordinator</p>
			<p>Linda Aryeetey</p>
			<p>Merck Foundation Communication and Community Awareness Manager</p>""",),
            8.0.heightBox,
              ],
            ),
          ),

         
          const FooterFlowerImage(),
          8.0.heightBox,
          Bottomcardlink(),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormLabel(
      text: CommonStrings.stayHomeDesc,
      labelColor: const Color(0xff6600cc),
      fontSize: 14,
      fontweight: FontWeight.w600,
      textAlignment: TextAlign.center,
    );
  }
}

class _ImageBlock extends StatelessWidget {
  final String image;

  const _ImageBlock(this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Image.asset(image, height: 290, fit: BoxFit.contain),
      ),
    );
  }
}

class _VideoThumbnail extends StatelessWidget {
  final String videoId;
  final VoidCallback onTap;

  const _VideoThumbnail({required this.videoId, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/newImages/placeholder_3.jpg',
                image: "https://img.youtube.com/vi/$videoId/mqdefault.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(CommonImagePath.pauseIcon),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            CommonStrings.watchVideoText,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Customcolor.textBlueColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'times new roman',
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;
  final TextAlign textAlign;

  const _SectionHeading({
    Key? key,
    required this.title,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        textAlign: textAlign,
        style: const TextStyle(
          color: Customcolor.colorVoilet,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'times new roman',
        ),
      ),
    );
  }
}
