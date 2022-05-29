import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
  }

  List<String> list = [
    "1",
    "What is youe are chose",
    "What is youe are chose",
    "What is youe are chose 1",
    "What is youe are chose",
    "What is youe are chose",
    "1",
    "What is youe are chose",
    "What is youe are chose 1",
    "What is youe are chose",
    "What is youe are chose 1",
    "What is youe are chose",
    "1",
    "What is youe are chose",
  ];

  final massageController = TextEditingController();
  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller.animateTo(_controller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.black87,
              height: 80,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Customer Support".text.bold.size(20).white.make(),
                        const SizedBox(
                          height: 3,
                        ),
                        "Typically replies within few hours"
                            .text
                            .size(18)
                            .blueGray500
                            .make(),
                      ],
                    ),
                    "".text.make()
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  controller: _controller,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return list[index] == "1"
                        ? Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 80),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  margin: index == 0
                                      ? const EdgeInsets.only(top: 20)
                                      : index == list.length-1
                                          ? const EdgeInsets.only(bottom: 20)
                                          : null,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.zero,
                                      topRight: Radius.circular(13),
                                      bottomLeft: Radius.circular(13),
                                      bottomRight: Radius.circular(13),
                                    ),
                                    color: Color(0xFFd1b7dc),
                                  ),
                                  child: list[index].text.make().p(16),
                                ),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 80, right: 10),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  margin: index == 0
                                      ? const EdgeInsets.only(top: 20)
                                      : index == list.length -1
                                          ? const EdgeInsets.only(bottom: 20)
                                          : null,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(13),
                                      topRight: Radius.zero,
                                      bottomLeft: Radius.circular(13),
                                      bottomRight: Radius.circular(13),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: list[index].text.make().p(16),
                                ),
                              ),
                            ),
                          );
                  }),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border.fromBorderSide(BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ))),
              child: Row(
                children: [
                  Flexible(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 100,
                      ),
                      child: VxTextField(
                        controller: massageController,
                        height: 60,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        clear: false,
                        maxLine : null,
                        keyboardType: TextInputType.multiline,
                        contentPaddingLeft: 16,
                        hint: "Type a message",
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {
                        if (massageController.text.isNotEmpty) {
                          setState(() {
                            list.add(massageController.text);
                            massageController.clear();
                            _scrollDown();
                          });
                        }
                      },
                      child: const Icon(
                        Icons.send_rounded,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
