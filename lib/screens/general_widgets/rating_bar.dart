import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: EdgeInsets.symmetric(vertical: 1),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Frame', style: TextStyle(color: Colors.grey[500])),
                Text('Title'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(width: 50),
                      Row(
                        children: [
                          Text('4.0', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                          Text('/ 5.0', style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                ),
                Text('Text...'),
                Row(
                  children: [
                    Icon(Icons.person),
                    Text('Name')
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}