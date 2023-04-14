import 'package:artifact/Screens/hygiene_form.dart';
import 'package:artifact/Screens/hygiene_form_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:artifact/home_page.dart';

class MultiHygieneFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MultiHygieneFormWidgetState();
  }
}

class _MultiHygieneFormWidgetState extends State<MultiHygieneFormWidget> {
  List<HygieneFormWidget> hygieneForms = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Create Multi Contacts"),
        // ),

        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                top: height * 1.0 / 32.0,
                left: width * 1.0 / 5.0,
                right: width * 1.0 / 5.0,
                bottom: height * 1.0 / 32.0),
            child: SizedBox(
              child: CupertinoButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  onSave();
                },
                child: Text("Save"),
              ),
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: Icon(Icons.add),
          onPressed: () {
            onAdd();
          },
        ),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            // appBar: AppBar(actions: [Actions(actions: <Widget>[]>, child: child)]),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(height: height * 1.0 / 18.0),
              Stack(alignment: Alignment.topLeft, children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        iconSize: width * 1.0 / 18.0,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return HomePage();
                          })));
                        },
                        icon: const Icon(Icons.arrow_back))),
              ]),
              const Text("Hygiene Request",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 1.0 / 12.0,
                    vertical: height * 1.0 / 36.0),
                child: const Text(
                    "Please fill out information to request a hygiene item.",
                    textAlign: TextAlign.center),
              ),
              Flexible(
                  child: hygieneForms.isNotEmpty
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: hygieneForms.length,
                          itemBuilder: (_, index) {
                            return hygieneForms[index];
                          })
                      : Center(child: Text("Tap on + to Add a Request"))),
            ]
                // TextButton(
                //   style: TextButton.styleFrom(
                //     minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
                //     foregroundColor: Colors.black,
                //     backgroundColor: Color.fromARGB(255, 200, 200, 200),
                //     textStyle: const TextStyle(
                //         fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                //   onPressed: onSave(),
                //   child: const Text('Confirm'),
                // )
                )));
  }

  //Validate all forms and submit
  onSave() {
    bool allValid = true;

    //If any form validation function returns false means all forms are not valid
    hygieneForms
        .forEach((element) => allValid = (allValid && element.isValidated()));

    if (allValid) {
      for (int i = 0; i < hygieneForms.length; i++) {
        HygieneFormWidget item = hygieneForms[i];
        debugPrint("Age: ${item.hygieneFormInfo.ageValue}");
        debugPrint("Notes: ${item.hygieneFormInfo.notesValue}");
      }
      //Submit Form Here
    } else {
      debugPrint("Form is Not Valid");
    }
  }

  //Delete specific form
  onRemove(HygieneFormInfo form) {
    setState(() {
      int index = hygieneForms
          .indexWhere((element) => element.hygieneFormInfo.id == form.id);
      if (hygieneForms != null) hygieneForms.removeAt(index);
    });
  }

  //Add New Form
  onAdd() {
    setState(() {
      HygieneFormInfo hygieneForm = HygieneFormInfo(id: hygieneForms.length);
      hygieneForms.add(HygieneFormWidget(
        index: hygieneForms.length,
        hygieneFormInfo: hygieneForm,
        onRemove: () => onRemove(hygieneForm),
      ));
    });
  }
}
