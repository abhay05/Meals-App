import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  final Function toggleFavourite;
  final Function ifFavourite;

  MealDetails(this.toggleFavourite, this.ifFavourite);

  static const route = '/meal-details';

  Widget buildSectionTitle(String title) {
    return Container(
      child: Text(title),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildList(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments as String;
    var meal = DUMMY_MEALS.firstWhere((item) => item.id == id);
    return Scaffold(
      appBar: AppBar(title: Text("${meal.title}")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildList(ListView.builder(
              // ListView is wrapped in Container otherwise it will
              //give error bcz ListView takes infinite height and column expands as much as the child wants.
              // so container helps ton limit the height and width of ListView
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.amberAccent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      meal.ingredients[index],
                    ),
                  ),
                );
              },
              itemCount: meal.ingredients.length,
            )),
            buildSectionTitle('Steps'),
            buildList(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider(),
                  ]);
                },
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: ifFavourite(id) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () {
          toggleFavourite(id);
        },
      ),

      // FloatingActionButton(
      //   child: Icon(
      //     Icons.delete,
      //   ),
      //   onPressed: () {
      //     Navigator.of(context).pop(id);
      //   },
      // ),
    );
  }
}
