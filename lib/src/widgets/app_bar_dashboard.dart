import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.searchHint});
  final String searchHint;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: "TChat", size: 20, weight: FontWeight.w600,),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 45,
                  child: SearchBar(
                    hintText: searchHint,
                    hintStyle: WidgetStateProperty.all<TextStyle>(
                      GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                        color: const Color.fromARGB(255, 174, 174, 174),
                      ),
                    ),
                     shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 230, 230, 230),
                          width: 1,
                        ),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 247, 248, 249)),
                    elevation: const WidgetStatePropertyAll(0),
                    leading: SvgPicture.asset("assets/svgs/magnifier.svg"),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 2),
                    ),
                  ),
                ),
      ],
    );

  }
}