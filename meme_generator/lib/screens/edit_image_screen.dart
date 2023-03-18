import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screenshot/screenshot.dart';

import '../widgets/edit_image_viewmodel.dart';
import '../widgets/image_text.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key, required this.selectedImage});
  final String selectedImage;

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.black,
                        style: BorderStyle.solid), //BorderSide
                    bottom: BorderSide(
                        width: 1,
                        color: Colors.black,
                        style: BorderStyle.solid), //BorderSide
                    left: BorderSide(
                        width: 1,
                        color: Colors.black,
                        style: BorderStyle.solid), //Borderside
                    right: BorderSide(
                        width: 1,
                        color: Colors.black,
                        style: BorderStyle.solid), //BorderSide
                  ), //Border
                ),
            padding: EdgeInsets.all(10),
            child: Screenshot(
              controller: screenshotController,
              child: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .45,
                  child: Stack(
                    children: [
                      _selectedImage,
                      for (int i = 0; i < texts.length; i++)
                        Positioned(
                          left: texts[i].left,
                          top: texts[i].top,
                          child: GestureDetector(
                            onLongPress: () {
                              setState(() {
                                currentIndex = i;
                                removeText(context);
                              });
                            },
                            onTap: () => setCurrentIndex(context, i),
                            child: Draggable(
                              feedback: ImageText(textInfo: texts[i]),
                              child: ImageText(textInfo: texts[i]),
                              onDragEnd: (drag) {
                                final renderBox =
                                    context.findRenderObject() as RenderBox;
                                Offset off = renderBox.globalToLocal(drag.offset);
                                setState(() {
                                  texts[i].top = off.dy - 96;
                                  texts[i].left = off.dx -10;
                                });
                              },
                            ),
                          ),
                        ),
                      creatorText.text.isNotEmpty
                          ? Positioned(
                              left: 0,
                              bottom: 0,
                              child: Text(
                                creatorText.text,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ),
      
          
          Spacer(),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () => shareImage(),
                  backgroundColor: Colors.white,
                  tooltip: 'Share',
                  child: const Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => addNewDialog(context),
                  backgroundColor: Colors.white,
                  tooltip: 'Add New Text',
                  child: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _selectedImage => Center(
        child: Image.file(
          File(
            widget.selectedImage,
          ),
          fit: BoxFit.fill,
          // width: MediaQuery.of(context).size.width,
        ),
      );

  AppBar get _appBar => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                onPressed: () => saveToGallery(context),
                tooltip: 'Save Image',
              ),
              DropdownButton<String>(
                value: value,
                items: fonts.map(buildMenuItem).toList(),
                onChanged: (value) => changeFont(value),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () => increaseFontSize(),
                tooltip: 'Increase Font Size',
              ),
              IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                onPressed: () {
                  decreaseFontSize();
                },
                tooltip: 'Decrease Font Size',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.black,
                ),
                onPressed: () => alignLeft(),
                tooltip: 'Align Left',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_align_center,
                  color: Colors.black,
                ),
                onPressed: () => alignCenter(),
                tooltip: 'Align Center',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_align_right,
                  color: Colors.black,
                ),
                onPressed: () => alignRight(),
                tooltip: 'Align Right',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_bold,
                  color: Colors.black,
                ),
                onPressed: () => boldText(),
                tooltip: 'Bold',
              ),
              IconButton(
                icon: const Icon(
                  Icons.format_italic,
                  color: Colors.black,
                ),
                onPressed: () => italicText(),
                tooltip: 'Italic',
              ),
              IconButton(
                icon: const Icon(
                  Icons.space_bar,
                  color: Colors.black,
                ),
                onPressed: () => addNewLines(),
                tooltip: 'Add New Line',
              ),
              GestureDetector(
                onTap: () => pickColor(context),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  width: 25,
                  margin: EdgeInsets.only(left: 10),
                ),
              ),
            ],
          ),
        ),
      );
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: GoogleFonts.getFont(item),
        ),
      );
}


