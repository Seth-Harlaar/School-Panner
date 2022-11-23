import 'package:flutter/material.dart';
import 'package:school_planner/widgets/home_page_card.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, required this.routeTitles, required this.routeLocations });
  
  final List<String> routeTitles;
  final List<String> routeLocations;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: routeTitles.length,

          gridDelegate: 
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              child: HomePageCard(title: routeTitles[index], route: routeLocations[index])
            );
          }
        ),
      ),
    );
  }
}

