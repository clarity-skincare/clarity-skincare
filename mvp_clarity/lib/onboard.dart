import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}


// function to trigger build when the app is run
void main() {
runApp(MaterialApp(
	initialRoute: '/',
	routes: {
	'/': (context) => const HomeRoute(),
	'/second': (context) => const SkinConditions(),
	},
)); //MaterialApp
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: Image.network("lib/logo.png"),
      elevation: 0,
      backgroundColor: const Color.fromARGB(248, 253, 253, 243),
    ), // AppBar
    body: Center(
      child: Column(
      children: <Widget>[
        // Header
        
        const SizedBox(height: 30,),

        const Align( alignment: Alignment.topLeft, child: Text("YOUR PROFILE", style: TextStyle(fontSize: 18.0, fontWeight:  FontWeight.bold, color: Colors.grey, fontFamily: 'Poppins'),)),
        
        const SizedBox(height: 10,),

        const Align( alignment: Alignment.topLeft, child: Text("Let's get started! ", style: TextStyle(fontSize: 30.0, fontWeight:  FontWeight.normal, color: Colors.black, fontFamily: 'Poppins'),)),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'John Smith',
              labelText: 'Name', 
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'example@gmail.com',
              labelText: 'Email address', 
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '21',
              labelText: 'Age', 
            ),
          ),
        ),

        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        //   child: Row(
        //       children: <Widget>[
        //         Expanded(child: Text("Male")),
        //         Checkbox(
        //           value: value,
        //           onChanged: (bool? newValue) {
        //             onChanged(newValue!);
        //           },
        //         ),
        //       ],
        //     ),

          
        //   ),

        Spacer(),

        ElevatedButton(
        child: const Text('Next'),
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        ), // ElevatedButton
      ], // <Widget>[]
      ), // Column
    ), // Center
    ); // Scaffold
  }
  
}

class SkinConditions extends StatelessWidget {
const SkinConditions({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
    appBar: AppBar(
      leading: Image.network("lib/logo.png"),
      elevation: 0,
      backgroundColor: const Color.fromARGB(248, 253, 253, 243),
    ), // AppBar
    body: Center(
      child: Column(
      children: <Widget>[
        // Header
        
        const SizedBox(height: 30,),

        const Align( alignment: Alignment.topLeft, child: Text("HI <name>", style: TextStyle(fontSize: 18.0, fontWeight:  FontWeight.bold, color: Colors.grey, fontFamily: 'Poppins'),)),
        
        const SizedBox(height: 10,),

        const Align( alignment: Alignment.topLeft, child: Text("What Brings you in today? ", style: TextStyle(fontSize: 30.0, fontWeight:  FontWeight.normal, color: Colors.black, fontFamily: 'Poppins'),)),
        
        
        
        Spacer(),
        ElevatedButton(
        child: const Text('Next'),
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        ), // ElevatedButton
      ], // <Widget>[]
      ), // Column
    ), // Center
    );  // Scaffold
}
}

class ThirdRoute extends StatelessWidget {
const ThirdRoute({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text("Tap Me Page"),
		backgroundColor: Colors.green,
	), // AppBar
	); // Scaffold
}
}
