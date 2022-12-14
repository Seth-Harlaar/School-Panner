import 'package:flutter/material.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/widgets/assets/assets.dart';



class ViewAssessmentPageProgressSection extends StatelessWidget {
  // const ViewAssessmentPageProgressSection({super.key, required this.status, required this.weight});
  const ViewAssessmentPageProgressSection({super.key, required this.weight, required this.status});

  // final AsessmentStatus status;
  final int weight;
  final AssessmentStatus status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const CustomHeader(
            size: 1,
            text: 'Progress: ',
          ),
          const SizedBox(height: 20),


          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: (status.index + 1)/4,
                    minHeight: 20,
                    backgroundColor: const Color(0xFF3D3D3D),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFC20430)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CustomHeader(
                size: 2,
                text: '${(status.index + 1)*25}%'
              )
            ],
          ),
          const SizedBox(height: 20),

          const CustomHeader(
            size: 1,
            text: 'Weight: ',
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: weight/100,
                    minHeight: 20,
                    backgroundColor: const Color(0xFF3D3D3D),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFC20430)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CustomHeader(
                size: 2,
                text: '$weight%',
              )
            ],
          ),
        ],
      )
    );
  }
}