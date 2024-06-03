import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/news_model.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({super.key, required this.model,});
  final NewsModel model;


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        model.urlOfNew;
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius : BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            if(model.image != null)
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Image.network(model.image!,
              height: 200,
              width: 2300,
                fit: BoxFit.fill,
              ),
            ),

            const SizedBox(
              height: 5,
            ),
            Text(model.title!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            ),
            const SizedBox(
              height: 5,
            ),
            if(model.author !=null)
            Text(model.author!),
            const SizedBox(
              height: 5,
            ),
            Text(model.time!.substring(0,10)

            )
          ],
        ),
      ),
    );
  }
}
