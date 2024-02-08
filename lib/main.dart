import 'package:flutter/material.dart';
import 'domain/workout.dart';

void main() => runApp(GymApp());

class GymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Gym App'),
          leading: Icon(
            Icons.fitness_center,
          ),
        ),
        body: WorkoutsList(),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: Color.fromRGBO(50, 65, 167, 1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Выработайте привычку заниматься спортом',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  WorkoutsList({super.key});

  final workouts = <Workout>[
    Workout(
        title: 'title_0',
        author: 'author_0',
        description: 'description_0',
        level: 'intermediate'),
    Workout(
        title: 'title_1',
        author: 'author_1',
        description: 'description1',
        level: 'advanced'),
    Workout(
        title: 'title_2',
        author: 'author_2',
        description: 'description_2',
        level: 'intermediate'),
    Workout(
        title: 'title_3',
        author: 'author_3',
        description: 'description_3',
        level: 'beginner'),
    Workout(
        title: 'title_4',
        author: 'author_4',
        description: 'description_4',
        level: 'advanced')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(140, 118, 114, 114)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Icon(Icons.fitness_center, color: Colors.white),
                    decoration: BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(width: 1.0, color: Colors.white24))),
                  ),
                  title: Text(
                    workouts[index].title,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.subtitle1?.color ??
                            Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  subtitle: subtitle(context, workouts[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;
  switch (workout.level) {
    case 'beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
    default:
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
          flex: 1,
          child: LinearProgressIndicator(
            backgroundColor:
                Theme.of(context).textTheme.subtitle1?.color ?? Colors.white,
            value: indicatorLevel,
            valueColor: AlwaysStoppedAnimation(color),
          )),
      SizedBox(width: 10),
      Expanded(
        flex: 3,
        child: Text(workout.level,
            style: TextStyle(
                color: Theme.of(context).textTheme.subtitle1?.color ??
                    Colors.white)),
      )
    ],
  );
}
