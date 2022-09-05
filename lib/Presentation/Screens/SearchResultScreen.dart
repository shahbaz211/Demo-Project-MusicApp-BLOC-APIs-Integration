import 'package:flutter/material.dart';

import '../../Data/Models/SearchResultScreenModel.dart';
import '../Widgets/DetailsResultWidget.dart';

class SearchResultScreen extends StatefulWidget {
  SearchResultScreenModel searchResultScreenModel;

  SearchResultScreen({Key? key, required this.searchResultScreenModel})
      : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List data = [];

  @override
  void initState() {
    data = widget.searchResultScreenModel.jsonResponse["results"]
            ["${widget.searchResultScreenModel.searchMethod}matches"]
        [widget.searchResultScreenModel.searchMethod];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Search Result",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return DetailsResultWidget(data:  data[index]);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

