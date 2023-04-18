class Profile {
  late String name; 
  late String email; 
  late String age; 
  late String gender; 
  Acne acne = Acne();
  Dryness dryness = Dryness(); 
  Sensitivity sensitivity = Sensitivity();
  List<String> ingredients = [];

  Profile({required this.name, required this.email, required this.age, required this.gender});

}

class Acne{
  bool checked = false; 
  bool whitehead = false; 
  bool blackhead = false;
  bool pimples = false; 
  String often = "";   
}

class Dryness{
  late bool checked = false; 
  late String often = "";   
}

class Sensitivity {
  late bool checked = false; 
  late String often = "";   
}
