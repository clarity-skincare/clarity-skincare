import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: HomePage(),
	);
}
}

//Creating a class user to store the data;
class User {
final int id;
final int userId;
final String title;
final String body;

User({
	required this.id,
	required this.userId,
	required this.title,
	required this.body,
});
}

class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

Future<List<User>> getRequest() async {
	//replace your restFull API here.
	// String url = "https://jsonplaceholder.typicode.com/posts";
  // String url = "https://serpapi.com/search.json?engine=google_reverse_image&image_url=https://i.imgur.com/5bGzZi7.jpg";
  String url = "https://serpapi.com/search.json?engine=google_reverse_image&image_url=https://i.ebayimg.com/images/g/CTkAAOSwfDFjV7jN/s-l1600.jpg&api_key=142ffa27e99c668b31a0cc7c457a13f76dd4a11e0739321e0c5e5600a56335ba";
	final response = await http.get(Uri.parse(url));

	var responseData = json.decode(response.body);

  // print(responseData);
	// Creating a list to store input data;
	List<User> users = [];
	for (var singleUser in responseData) {
	User user = User(
		id: singleUser["id"],
		userId: singleUser["userId"],
		title: singleUser["title"],
		body: singleUser["body"]);

	//Adding user to the list.
	// users.add(user);
  return responseData; 
	}

  // for (var singleUser in responseData["image_results"]) {
	// User user = User(
	// 	id: singleUser["position"],
	// 	userId: singleUser["link"],
	// 	title: singleUser["title"],
	// 	body: singleUser["snippet"]);

	// //Adding user to the list.
	// users.add(user);
	// }

	// return responseData;
  return users;
}

@override
Widget build(BuildContext context) {
	return SafeArea(
	child: Scaffold(
		appBar: AppBar(
		title: Text("Http Get Request."),
		leading: Icon(
			Icons.get_app,
		),
		),
		body: Container(
		padding: EdgeInsets.all(16.0),
		child: FutureBuilder(
			future: getRequest(),
			builder: (BuildContext ctx, AsyncSnapshot snapshot) {
			print(snapshot.data);
      if (snapshot.data == null) {
				return Container(
				child: Center(
					child: CircularProgressIndicator(),
				),
				);
			} else {
				// print(snapshot.data);
        // return const SizedBox(width: 1,); 
        return ListView.builder(
				itemCount: snapshot.data.length,
				itemBuilder: (ctx, index) => ListTile(
					title: Text(snapshot.data[index].title),
					subtitle: Text(snapshot.data[index].body),
					contentPadding: EdgeInsets.only(bottom: 20.0),
				),
				);
			}
			},
		),
		),
	),
	);
}
}
