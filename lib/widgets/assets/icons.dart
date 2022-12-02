import 'package:flutter/material.dart';
import 'package:school_planner/models/assessment.dart';



Widget assessmentIcon(AssessmentType type){

  if(type == AssessmentType.assignment){
    return const Icon(
      Icons.article,
      color: Color(0xFFC20430),
      size: 50
    );
  }

  if(type == AssessmentType.lab){
    return const Icon(
      Icons.science,
      color: Color(0xFFC20430),
      size: 50
    );
  }

  return const Icon(
    Icons.quiz,
    color: Color(0xFFC20430),
    size: 50
  );  
}