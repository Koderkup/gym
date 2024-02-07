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
            color: Color.fromRGBO(255, 222, 225, 228),
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
        level: 'level_0'),
    Workout(
        title: 'title_1',
        author: 'author_1',
        description: 'description1',
        level: 'level_1'),
    Workout(
        title: 'title_2',
        author: 'author_2',
        description: 'description_2',
        level: 'level_2'),
    Workout(
        title: 'title_3',
        author: 'author_3',
        description: 'description_3',
        level: 'level_3'),
    Workout(
        title: 'title_4',
        author: 'author_4',
        description: 'description_4',
        level: 'level_4')
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
                decoration: BoxDecoration(color: Color.fromARGB(140, 118, 114, 114)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Icon(Icons.fitness_center, color: Colors.white),
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0, color: Colors.white24) )
                    ),
                  ),
                  title: Text(workouts[index].title, style: TextStyle(color: Theme.of(context).textTheme.subtitle1?.color ?? Colors.black, fontWeight: FontWeight.bold),),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  ),
              ),
            );
          },
        ),
      ),
    );
  }
}
