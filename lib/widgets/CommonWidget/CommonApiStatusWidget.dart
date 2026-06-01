import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/CommonUtils/common_strings.dart';
import 'package:merckfoundation_252026/CommonUtils/customcolor.dart';

class CommonApiStatusWidget
    extends StatelessWidget {

  final String icon;

  final String title;

  final VoidCallback onRetry;

  const CommonApiStatusWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Image.asset(
          icon,
          
        ),
         
          // const SizedBox(height: 20),
        Text(
            "Oops...",
 textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
      
          const SizedBox(height: 20),
        InkWell(
                  borderRadius: BorderRadius.circular(30),
      
                  onTap: onRetry,
      
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
      
                    decoration: BoxDecoration(
                      color: Colors.white,
                        border: Border.all(
          color: Customcolor.textBlueColor,
          width: 1.2,
        ),
                      borderRadius: BorderRadius.circular(30),
                    ),
      
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          CommonStrings.reTry,
                          style: TextStyle(
                            color: Customcolor.textBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
      
                        const SizedBox(width: 8),
      
                        Icon(
                          Icons.arrow_forward_rounded,
                          color:Customcolor.textBlueColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
        
        ],
      ),
    );
  }
}