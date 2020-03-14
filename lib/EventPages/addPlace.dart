import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';

class AddPlace extends StatefulWidget {
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _firestore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  Location location = new Location();

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  _onClear() {
    setState(() {
      _textEditingController.text = "";
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  void clearSelection() {
    setState(() {
      _image = null;
      _uploadedFileURL = null;
    });
  }
  // Future<DocumentReference> _addGeoPoint() async {
  //   var pos = await location.getLocation();
  //   GeoFirePoint point =
  //       geo.point(latitude: pos.latitude, longitude: pos.longitude);
  //   return _firestore.collection('places').add({
  //     'position': point.data,
  //   });
  // }

  String titletext;
  String descriptiontext;
  String Currentselectedtext;
  String categoryname = "";
  File _image;
  String _uploadedFileURL;

  var names = [
    'Others',
    'Washrooms',
    'Tea Stall',
    'Cobblers',
    'Medicals',
  ];
  var currentSelected = 'Others';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('AddPlace')),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('assets/events.png'),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  titletext = value;
                },
              ),
              TextField(
                controller: _textEditingController2,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                onChanged: (value) {
                  descriptiontext = value;
                },
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Category',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 40),
                  DropdownButton<String>(
                    items: names.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      setState(() {
                        this.currentSelected = newValueSelected;
                        Currentselectedtext = newValueSelected;
                      });
                    },
                    value: currentSelected,
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Text('Selected Image'),
                  // _image != null
                  //     ? Image.asset(
                  //         _image.path,
                  //         height: 150,
                  //       )
                  //     : Container(height: 150),
                  _image == null
                      ? RaisedButton(
                          child: Text('Choose Image'),
                          onPressed: chooseFile,
                          color: Colors.blue,
                        )
                      : Container(),
                  // _image != null
                  //     ? RaisedButton(
                  //         child: Text('Upload File'),
                  //         onPressed: uploadFile,
                  //         color: Colors.cyan,
                  //       )
                  //     : Container(),
                  _image != null
                      ? RaisedButton(
                          child: Text('Clear Selection'),
                          onPressed: clearSelection,
                        )
                      : Container(),
                  Text('Uploaded Image'),
                  _uploadedFileURL != null
                      ? Image.network(
                          _uploadedFileURL,
                          height: 150,
                        )
                      : Container(),
                ],
              ),
              FlatButton(
                color: Colors.blue,
                splashColor: Colors.blue,
                onPressed: () async {
                  var pos = await location.getLocation();
                  //Navigator.pushNamed(context,initialScreen.id);
                  GeoFirePoint point = geo.point(
                      latitude: pos.latitude, longitude: pos.longitude);
                  _firestore.collection('places').add({
                    'Title': titletext,
                    'position': point.data,
                    'Category': Currentselectedtext,
                    'Description': descriptiontext,
                  });
                  _onClear();
                  uploadFile();
                  //     _addGeoPoint();
                },
                child: Text(
                  'Submit',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
