
class Student {

  // change to make NULL class possible
  Student({String programName = 'Dental Hygiene', String studentName = 'Carmen',  int currentYear = 2})
    : _studentName = studentName,
      _programName = programName,
      _currentYear = currentYear;

  Student.fromJson(Map<String, dynamic> json)
    : _studentName = json['name'],
      _programName = json['program'],
      _currentYear = json['currentYear'];

  // student info
  final String _studentName;
  final String _programName;
  final int _currentYear;


  String get name => _studentName;
  String get program => _programName;
  int get year => _currentYear;


  // TO BE ADDED when notes and courses are added

  // list of notes
  // private ArrayList<Note> notes = new ArrayList<Note>();
  
  // a list of classes they're in
  // private ArrayList<Course> courses = new ArrayList<Course>();


  
  

  // from first attempt at state mmanagement
  static void newStudent({required formKey}){
    final form = formKey.currentState!;

    // validate
    if( form.validate() ){
    
      // make new student if valid
      form.save();
    }
  }



  Map<String, dynamic> toJson() => {
    'name': _studentName,
    'program': _programName,
    'currentYear': _currentYear,
  };
}