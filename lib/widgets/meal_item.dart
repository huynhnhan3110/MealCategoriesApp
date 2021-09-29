import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String urlImage;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {this.title,
      this.urlImage,
      this.duration,
      this.complexity,
      this.affordability});
  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown Complexity';
    }
  }
String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown Affordability';
    }
  }
  void onSelected() {
    print("selected");
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                child: Image.network(
                  urlImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.av_timer),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${getComplexity}'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${getAffordability}'),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
