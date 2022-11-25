import 'package:flutter/material.dart';
import 'package:school_planner/pages/grades_page.dart';
import 'package:school_planner/routes.dart';


class HomePageCard extends StatelessWidget {
  const HomePageCard({super.key, required this.title, required this.route});

  final String title;
  final String route;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        // Routes.seafarer.navigate(route);
        Navigator.pushNamed(context, route);
      },
      child: Card(
          color: Color(0xFF3D3D3D),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.text_snippet,
                    color: Colors.black,
                    size: 30
                  ),
                  Text(
                    '$title Page',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
        ),
    );
  }
}


// height: 50,
//               width: 50,
