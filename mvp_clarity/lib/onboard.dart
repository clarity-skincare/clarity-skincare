// import 'package:flutter/material.dart';

// class LabeledCheckbox extends StatelessWidget {
//   const LabeledCheckbox({
//     super.key,
//     required this.label,
//     required this.padding,
//     required this.value,
//     required this.onChanged,
//   });

//   final String label;
//   final EdgeInsets padding;
//   final bool value;
//   final ValueChanged<bool> onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         onChanged(!value);
//       },
//       child: Padding(
//         padding: padding,
//         child: Row(
//           children: <Widget>[
//             Expanded(child: Text(label)),
//             Checkbox(
//               value: value,
//               onChanged: (bool? newValue) {
//                 onChanged(newValue!);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // function to trigger build when the app is run
// void main() {
// runApp(MaterialApp(
// 	initialRoute: '/',
// 	routes: {
// 	'/': (context) => const HomeRoute(),
// 	'/second': (context) => const SkinConditions(),
// 	},
// )); //MaterialApp
// }


// class HomeRoute extends StatelessWidget {
//   const HomeRoute({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(
//       leading: Image.network("lib/logo.png"),
//       elevation: 0,
//       backgroundColor: const Color.fromARGB(248, 253, 253, 243),
//     ), // AppBar
//     body: Center(
//       child: Column(
//       children: <Widget>[
//         // Header
        
//         const SizedBox(height: 30,),

//         const Align( alignment: Alignment.topLeft, child: Text("YOUR PROFILE", style: TextStyle(fontSize: 18.0, fontWeight:  FontWeight.bold, color: Colors.grey, fontFamily: 'Poppins'),)),
        
//         const SizedBox(height: 10,),

//         const Align( alignment: Alignment.topLeft, child: Text("Let's get started! ", style: TextStyle(fontSize: 30.0, fontWeight:  FontWeight.normal, color: Colors.black, fontFamily: 'Poppins'),)),

//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'John Smith',
//               labelText: 'Name', 
//             ),
//           ),
//         ),

//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'example@gmail.com',
//               labelText: 'Email address', 
//             ),
//           ),
//         ),

//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: '21',
//               labelText: 'Age', 
//             ),
//           ),
//         ),

//         // Padding(
//         //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//         //   child: Row(
//         //       children: <Widget>[
//         //         Expanded(child: Text("Male")),
//         //         Checkbox(
//         //           value: value,
//         //           onChanged: (bool? newValue) {
//         //             onChanged(newValue!);
//         //           },
//         //         ),
//         //       ],
//         //     ),

          
//         //   ),

//         Spacer(),

//         ElevatedButton(
//         child: const Text('Next'),
//         onPressed: () {
//           Navigator.pushNamed(context, '/second');
//         },
//         ), // ElevatedButton
//       ], // <Widget>[]
//       ), // Column
//     ), // Center
//     ); // Scaffold
//   }
  
// }

// class SkinConditions extends StatelessWidget {
// const SkinConditions({Key? key}) : super(key: key);

// @override
// Widget build(BuildContext context) {
// 	return Scaffold(
//     appBar: AppBar(
//       leading: Image.network("lib/logo.png"),
//       elevation: 0,
//       backgroundColor: const Color.fromARGB(248, 253, 253, 243),
//     ), // AppBar
//     body: Center(
//       child: Column(
//       children: <Widget>[
//         // Header
        
//         const SizedBox(height: 30,),

//         const Align( alignment: Alignment.topLeft, child: Text("HI <name>", style: TextStyle(fontSize: 18.0, fontWeight:  FontWeight.bold, color: Colors.grey, fontFamily: 'Poppins'),)),
        
//         const SizedBox(height: 10,),

//         const Align( alignment: Alignment.topLeft, child: Text("What Brings you in today? ", style: TextStyle(fontSize: 30.0, fontWeight:  FontWeight.normal, color: Colors.black, fontFamily: 'Poppins'),)),

        
//         Spacer(),
//         ElevatedButton(
//         child: const Text('Next'),
//         onPressed: () {
//           Navigator.pushNamed(context, '/second');
//         },
//         ), // ElevatedButton
//       ], // <Widget>[]
//       ), // Column
//     ), // Center
//     );  // Scaffold
// }
// }

// class ThirdRoute extends StatelessWidget {
// const ThirdRoute({Key? key}) : super(key: key);

// @override
// Widget build(BuildContext context) {
// 	return Scaffold(
// 	appBar: AppBar(
// 		title: const Text("Tap Me Page"),
// 		backgroundColor: Colors.green,
// 	), // AppBar
// 	); // Scaffold
// }
// }

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:im_stepper/stepper.dart';
import 'package:mvp_clarity/profile.dart';


// function to trigger build when the app is run
void main() {
  runApp(
     MaterialApp(
      home: MultiPageBasic(profile: Profile(name: "", age: "", email: "", gender: "")), 
      )
); //MaterialApp
}

class MultiPageBasic extends StatefulWidget {
  late Profile profile; 
  MultiPageBasic({Key? key, required this.profile}) : super(key: key); 

  @override
  _MultiPageBasicState createState() => _MultiPageBasicState();
}

class _MultiPageBasicState extends State<MultiPageBasic> {
  // private vars  
  bool _male = false;  
  bool _female = false; 
  bool _nonBinary = false; 

  GlobalKey<FormState> basicFormKey = GlobalKey<FormState>();

  int activeIndex = 0;
  int totalIndex = 18;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (activeIndex != 0) {
          activeIndex--;
          setState(() {});
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(248, 253, 253, 243),
        appBar: AppBar(
          leading: Image.network("lib/logo.png" ), 
          elevation: 0,
          backgroundColor: const Color.fromARGB(248, 253, 253, 243),
        ),

        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(248, 253, 253, 243),
          child: Container( 
            padding: const EdgeInsets.all(25.0),
            height: 100, 
            child: SizedBox(
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  if (true) { // basicFormKey.currentState?.validate() ?? false
                    // next
                    setState(() {
                      // case by case (if acne is checked go to acne type page ish )
                      activeIndex++;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black), 

                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),

        ), 
        body: bodyBuilder(),
      ),
    );
  }

  Widget bodyBuilder() {
    switch (activeIndex) {
      case 0:
        return basicDetails();
      case 1:
        return skinDetails();
      // case 2:
      //   return acneDetails();
      // case 3:
      //   return drynessDetails();
      // case 4:
      //   return sensitivityDetails(); 
      // case 5:
      //   return routineDetails(); 
      // case 6: 
      //   return donePage(); 
  
      default:
        return basicDetails();
    }
  }

  Widget basicDetails() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [

          SizedBox(height: 20,),

          const Text(
            "YOUR PROFILE",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight:FontWeight.bold, 
              color: Colors.grey, 
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.left,
          ),

        
          const Text(
            "Let's get started!",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight:FontWeight.normal, 
              color: Colors.black, 
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.left,
          ),
          
          SizedBox(height: 20,),

          // NAME FIELD
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight:FontWeight.normal, 
                  color: Colors.black, 
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 10,),
                
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'John Smith',
                  // labelText: 'Name', 
                ),

                validator: RequiredValidator(
                  errorText: "Required *",
                ),
                
              ),
          ],)
        ),

        // EMAIL FIELD 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email address",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight:FontWeight.normal, 
                  color: Colors.black, 
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 10,),
                
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'example@gmail.com',
                  // labelText: 'Name', 
                ),

                validator: MultiValidator([
                RequiredValidator(
                  errorText: "Required *",
                ),
                EmailValidator(
                  errorText: "Not Valid Email",
                ),
              ])
                
              ),
          ],)
        ),

        // AGE FIELD
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Age",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight:FontWeight.normal, 
                  color: Colors.black, 
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 10,),
                
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: '21',
                  // labelText: 'Name', 
                ),

                validator: RequiredValidator(
                errorText: "Required *",
                ),
                
              ),
          ],)
        ),
          

          Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Gender",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight:FontWeight.normal, 
                  color: Colors.black, 
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 10,),
              
              Container (
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(3)) ),
                  child: CheckboxListTile(
                    tileColor: Colors.white,
                    title: const Text("Male", style: TextStyle(fontFamily: 'Poppins',)),
                    checkColor: Colors.white,
                    activeColor: Colors.orange.shade900,
                    value: _male, 
                    onChanged: (bool? value){setState(() {
                      if(value==true){
                        _male = true;
                      }
                      else{
                        _male = false;
                      }
                    });}, 
                    controlAffinity: ListTileControlAffinity.leading,
                    ), 
                  ), 
              
                SizedBox(height: 10,),

                Container (
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(3)) ),
                  child: CheckboxListTile(
                    tileColor: Colors.white,
                    title: const Text("Female", style: TextStyle(fontFamily: 'Poppins',)),
                    checkColor: Colors.white,
                    activeColor: Colors.orange.shade900,

                    value: _female, 
                    onChanged: (bool? value){setState(() {
                      if(value==true){
                        _female = true;
                      }
                      else{
                        _female = false;
                      }
                    });}, 
                    controlAffinity: ListTileControlAffinity.leading,
                    ), 
                  ), 
                
                SizedBox(height: 10,),

                Container (
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(3)) ),
                  child: CheckboxListTile(
                    tileColor: Colors.white,
                    title: const Text("Non-Binary", style: TextStyle(fontFamily: 'Poppins',)),
                    checkColor: Colors.white,
                    activeColor: Colors.orange.shade900,

                    value: _nonBinary, 
                    onChanged: (bool? value){setState(() {
                      if(value==true){
                        _nonBinary = true;
                      }
                      else{
                        _nonBinary = false;
                      }
                    });}, 
                    controlAffinity: ListTileControlAffinity.leading,
                    ), 
                  ), 
            ]
            )
          ), 


        const SizedBox(
          height: 12.0,
        ),


          // SizedBox(
          //   height: 40.0,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       if (basicFormKey.currentState?.validate() ?? false) {
          //         // next
          //         setState(() {
          //           activeIndex++;
          //         });
          //       }
          //     },
          //     child: const Text(
          //       "Next",
          //       style: TextStyle(
          //         fontSize: 20.0,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget skinDetails() {
    return ListView(
      padding: const EdgeInsets.all(
        12.0,
      ),
      children: [
        Center(
          child: DotStepper(
              activeStep: activeIndex,
              dotRadius: 20.0,
              shape: Shape.stadium,
              // spacing: 10.0,
              dotCount: 10,
              tappingEnabled: false,
            ),
        ),
        const Text(
            "Personalizing...",
            style: TextStyle(
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
        
        
        CheckboxListTile(
          title: const Text("Acne"),
          value: widget.profile.acne.checked, 
          onChanged: (bool? value){setState(() {
             if(value==true){
              widget.profile.acne.checked = true;
             }
            else{
              widget.profile.acne.checked = false;
            }
          });}), 

        const SizedBox(
          height: 12.0,
        ),
        
        SizedBox(
            height: 40.0,
            child: ElevatedButton(
              style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red), ),
              onPressed: () {
                // next
                setState(() {
                  activeIndex++;
                });
              },
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
      ],
    );
  }


}
