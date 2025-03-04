import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/animations/fade_pageroute.dart';
import 'package:tchat_frontend/src/api/temp_num.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/screens/start.dart';
import 'package:tchat_frontend/src/widgets/custom_elevated_button.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';

class TempContactScreen extends StatefulWidget {
  const TempContactScreen({super.key});

  @override
  State<TempContactScreen> createState() {
    return _TempContactScreenState();
  }
}

class _TempContactScreenState extends State<TempContactScreen> {
  int? _selectedCardIndex;
  List tempNums = [];
  bool isLoading = true;
  bool submitNum = false;

  Future<void> tempMobileCalls() async {
    setState(() {
      isLoading = true;
    });

    List response = await generateTempNum(context);

    setState(() {
      tempNums = response;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    tempMobileCalls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const CustomText(text: "Choose your temporary Number"),
      ),
      body: submitNum ? Center(child: CircularProgressIndicator()) : Padding(
        padding: const EdgeInsets.all(10.0),
        child: isLoading
            ? _buildShimmerGrid()
            : tempNums.isEmpty
                ? const Center(
                    child: CustomText(
                      text: "No number generated",
                      size: 18,
                      alignment: Alignment.center,
                    ),
                  )
                : _buildGridView(),
      ),
    );
  }
  Widget _buildShimmerGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(
        5,
        (index) => Shimmer(
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildGridView() {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(5, (index) {
              return Card(
                color: _selectedCardIndex == index
                    ? black
                    : const Color.fromARGB(255, 96, 96, 96),
                elevation: 4.0,
                shadowColor: grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text:
                          "+${tempNums[index]['countryCode']}- ${tempNums[index]['temporaryNumber']}",
                      color: white,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 10),
                    Radio<int>(
                      value: index,
                      groupValue: _selectedCardIndex,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedCardIndex = value;
                        });
                      },
                      activeColor: Colors.white,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
              style: customElevatedButton(),
              onPressed: () async{
                if(_selectedCardIndex == null) {
                  context.mounted? snackmessage(context, "Please select a number") : null;
                  return;
                } 
                setState(() {
                  submitNum = true;
                });
                bool response = await submitTempNum(context, tempNums[_selectedCardIndex!]['id']);
                if(response) {
                  setState(() {
                    submitNum = false;
                  });
                  Navigator.of(context).pushAndRemoveUntil(
                    fadeRoute(StartScreen(nextScreen: "Home"))
                    , (route) => false);
                }
                
              },
              child: const CustomText(
                alignment: Alignment.center,
                size: 16,
                text: "Select Number",
                color: white,
              )),
        ),
      ],
    );
  }
}
