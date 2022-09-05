import 'package:flutter/material.dart';

class DetailsResultWidget extends StatelessWidget {
  const DetailsResultWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final  data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        Navigator.pushNamed(context, "DetailsScreen",
            arguments: data);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(
                          data["image"][2]["#text"]))),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(child: Text(data["name"]))
          ],
        ),
      ),
    );
  }
}
