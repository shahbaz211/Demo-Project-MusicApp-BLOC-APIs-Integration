import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sara_demo/Data/Models/SearchResultScreenModel.dart';

import '../../Logic/Bloc/music_bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();
  String radioBtn = "album";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Search  Music',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color(0xFF751010),
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: 'Type here',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Radio(
                        value: "album",
                        groupValue: radioBtn,
                        onChanged: (val) {
                          setState(() {
                            radioBtn = val.toString();
                          });
                        }),
                    const Text("album")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: "artist",
                        groupValue: radioBtn,
                        onChanged: (val) {
                          setState(() {
                            radioBtn = val.toString();
                          });
                        }),
                    const Text("artist")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: "track",
                        groupValue: radioBtn,
                        onChanged: (val) {
                          setState(() {
                            radioBtn = val.toString();
                          });
                        }),
                    const Text("track")
                  ],
                ),
              ],
            ),
            BlocConsumer<SearchBloc, SearchState>(
              listener: (context, state) {
                if (state is SearchCompletedState) {
                  Navigator.pushNamed(context, "SearchResultScreen",
                      arguments: SearchResultScreenModel(
                          jsonResponse: state.jsonResponse,
                          searchMethod: radioBtn));
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return FlatButton(
                    onPressed: () async {
                      BlocProvider.of<SearchBloc>(context).add(SearchStartEvent(
                          searchText: textController.text, method: radioBtn));
                    },
                    color: Colors.blue,
                    child: const Text(
                      "Search",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
