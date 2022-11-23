import 'package:flutter/material.dart';
import 'package:school_planner/pages/layouts/home_layout.dart';
import 'package:school_planner/widgets/home_page_card.dart';


class HomeMediumLayout extends StatelessWidget {
  const HomeMediumLayout({super.key, required this.routeTitles, required this.routeLocations });
  
  final List<String> routeTitles;
  final List<String> routeLocations;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 800),
        child: Row(
          children: [

            Container(
              child: Expanded(
                child: Column(
                  children: const [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Text('hi')
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Text('hi')
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Text('hi')
                      ),
                    ),
                  ],
                ),
              ),
            ),

            HomeLayout(routeTitles: routeTitles, routeLocations: routeLocations),
          ],
        ),
      ),
    );
  }
}

