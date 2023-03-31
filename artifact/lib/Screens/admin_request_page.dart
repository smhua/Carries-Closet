import "package:flutter/material.dart";
import "package:artifact/home_page.dart";
import "package:artifact/admin_home_page.dart";

import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminRequestPage extends StatefulWidget {
  const AdminRequestPage({super.key});

  @override
  _AdminRequestPageState createState() {
    return _AdminRequestPageState();
  }
}

class _AdminRequestPageState extends State<AdminRequestPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  SizedBox(height: height * 1.0 / 18.0),
                  Stack(alignment: Alignment.topLeft, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            iconSize: width * 1.0 / 18.0,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return AdminHomePage();
                              })));
                            },
                            icon: const Icon(Icons.arrow_back))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/dsdf1.png",
                            height: height * 1.0 / 6.75,
                            width: height * 1.0 / 6.75,
                            alignment: Alignment.center))
                  ]),
                  RequestWidget(),
                ]))));
  }
}

class RequestWidget extends StatefulWidget {
  const RequestWidget({super.key});

  @override
  _RequestWidgetState createState() {
    return _RequestWidgetState();
  }
}

class _RequestWidgetState extends State<RequestWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: FutureBuilder<String>(
          future: parseRequests(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              List<dynamic> decode = json.decode(snapshot.data.toString());
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: decode.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                            title:
                                Text("Request #${decode[index]['requestno']}"),
                            subtitle: Text("${decode[index]['date']}"),
                            trailing: Row(
                                mainAxisSize: MainAxisSize
                                    .min, //hacky workaround but works
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        //action_on_tap here -> put whatever you want here, it will run when the notes icon is tapped- ideally some sort of popup showing additional notes/info
                                        //can also just make this display any other additonal info, but tbh I don't think there's much else to display...
                                        //...that shouldn't just be shown on the listing itself- address, size, item, gender, date are already shown
                                        //...the only things not shown are like age, email, and additonal notes (so ig just display those? maybe include age in main list)
                                        //TODO: See above comments^
                                        if (decode[index]['notes'] == "N/A") {
                                          print(
                                              "No notes available for request #${decode[index]['requestno']}");
                                        } else {
                                          print(
                                              "Displaying notes for request #${decode[index]['requestno']}"); //for example
                                        }
                                      },
                                      child: Icon(Icons.notes)),
                                  GestureDetector(
                                      onTap: () {
                                        //action_on_tap here -> put whatever you want here, it will run when the delete icon is tapped- ideally some sort of popup, then based on result, delete
                                        print(
                                            "Popup saying 'Are you sure you want to delete request #${decode[index]['requestno']}?'"); //something something are u sure u want to delete request ? y/n
                                      },
                                      child: Icon(Icons.delete))
                                ])),
                        Row(
                          //some weird gap before this row here idk why
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "     Item: ${decode[index]['item']} ") //TODO: update this to handle multiple items per request, if we do that
                          ], //spaces line it up with the title, def fix this to not be a hacky workaround
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "     Size: ${decode[index]['size']}"), //TODO: This whole way of displaying can use some work, but everything is displayable
                          ], //same thing here
                        ),
                        Text("Gender: ${decode[index]['gender']} "),
                        Text("Address: ${decode[index]['address']}"),
                        Row(
                            //TODO: maybe make these buttons conditional- only display when a requested is 'received' status
                            //TODO: Also add some kind of display of the request status somewhere
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  updateRequest(
                                      true, decode[index]['requestno']);
                                },
                                child: const Text('Complete'),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  updateRequest(
                                      false, decode[index]['requestno']);
                                },
                                child: Text('Deny'),
                              ),
                              const SizedBox(width: 8),
                            ])
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          }),
    );
  }

  Future<String> parseRequests() async {
    print('parse requests called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/requests/list')
        : Uri.parse('http://10.0.2.2:8080/requests/list');

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.body;
  }

  void updateRequest(bool complete, String requestno_str) async {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    int requestno = int.parse(requestno_str);
    String status = complete ? "shipped" : "rejected";
    var url = isIOS
        ? Uri.parse(
            'http://127.0.0.1:8080/requests/update?requestno=$requestno')
        : Uri.parse(
            'http://10.0.2.2:8080/requests/update?requestno=$requestno');

    var response = await http.patch(url, body: {'status': status});
  }
}
