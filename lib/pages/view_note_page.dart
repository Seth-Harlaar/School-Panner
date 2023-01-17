import 'package:flutter/material.dart';
import 'package:school_planner/widgets/app_bar.dart';


class ViewNotePage extends StatelessWidget {
  const ViewNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppToolBar(), 
      ),

      body: Column(
        children: [
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}