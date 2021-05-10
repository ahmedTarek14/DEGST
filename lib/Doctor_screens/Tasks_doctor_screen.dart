import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:DGEST/Constins.dart';

class TasksDoctorScreen extends StatefulWidget {
  @override
  _TasksDoctorScreenState createState() => _TasksDoctorScreenState();
}

class _TasksDoctorScreenState extends State<TasksDoctorScreen> {
  @override
  // // Future<String> uploadPdfToStorage(File pdfFile) async {
  // //   try {
  // //     Reference ref = FirebaseStorage.instance
  // //         .ref()
  // //         .child('pdfs/${DateTime.now().millisecondsSinceEpoch}');
  // //     UploadTask uploadTask =
  // //         ref.putFile(pdfFile, SettableMetadata(contentType: 'pdf'));
  // //
  // //     TaskSnapshot snapshot = await uploadTask;
  // //
  // //     String url = await snapshot.ref.getDownloadURL();
  // //
  // //     print("url:$url");
  // //     return url;
  // //   } catch (e) {
  // //     return null;
  // //   }
  // // }
  //String _fileName;
  //String _path;
  //Map<String, String> _paths;
  // String _extension;
  //bool _loadingPath = false;
  // bool _multiPick = false;
  // bool _hasValidMime = false;
  // FileType _pickingType;
  // TextEditingController _controller = new TextEditingController();
  // void initState() {
  //   super.initState();
  //   _controller.addListener(() => _extension = _controller.text);
  // }
  //
  // void _openFileExplorer() async {
  //   if (_pickingType != FileType.CUSTOM || _hasValidMime) {
  //     setState(() => _loadingPath = true);
  //     try {
  //       if (_multiPick) {
  //         _path = null;
  //         _paths = await FilePicker.getMultiFilePath(
  //             type: _pickingType, fileExtension: _extension);
  //       } else {
  //         _paths = null;
  //         _path = await FilePicker.getFilePath(
  //             type: _pickingType, fileExtension: _extension);
  //       }
  //     } on PlatformException catch (e) {
  //       print("Unsupported operation" + e.toString());
  //     }
  //     if (!mounted) return;
  //     setState(() {
  //       _loadingPath = false;
  //       _fileName = _path != null
  //           ? _path.split('/').last
  //           : _paths != null
  //               ? _paths.keys.toString()
  //               : '...';
  //     });
  //   }
  // }
  //final mainReference = FirebaseDatabase.instance.reference().child('Database');
  final _fireStore = FirebaseFirestore.instance;
  Future getPdfAndUpload() async {
    var rng = new Random();
    String randomName = "";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    File file =
        await FilePicker.getFile(type: FileType.CUSTOM, fileExtension: 'pdf');
    String fileName = '${randomName}.pdf';
    print(fileName);
    print('${file.readAsBytesSync()}');
    await FirebaseStorage.instance
        .ref()
        .child(fileName)
        .putData(file.readAsBytesSync());
    String url = await FirebaseStorage.instance.ref(fileName).getDownloadURL();
    print(url);
    _fireStore
        .collection('Doctors')
        .doc('${loggedInUSer.email}')
        .update({'pdf': url});
    //documentFileUpload(url);
    //savePdf(file.readAsBytesSync(), fileName);
  }

  // Future savePdf(List<int> asset, String name) async {
  //   await FirebaseStorage.instance.ref().child(fileName).putData(file.readAsBytesSync());
  //   String url = await FirebaseStorage.instance.ref(fileName).getDownloadURL();
  //   //StorageReference reference = FirebaseStorage.instance.ref().child(name);
  //   //StorageUploadTask uploadTask = reference.putData(asset);
  //   //String url = await (await uploadTask.onComplete).ref.getDownloadURL();
  //   print(url);
  //   documentFileUpload(url);
  //   return url;
  // }

  // void documentFileUpload(String downloadURL) {
  //   _fireStore
  //       .collection('Doctors')
  //       .doc('${loggedInUSer.email}')
  //       .update({'pdf': downloadURL});
  // }

  Widget build(BuildContext context) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.teal,
    //       title: Text("Upload PDF"),
    //       leading: IconButton(
    //         icon: Icon(Icons.arrow_back_ios),
    //         color: Colors.white,
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //       ),
    //     ),
    //     body: BackgroundImage(
    //       image: 'images/sora5a.jpeg',
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () {},
    //       child: Icon(
    //         Icons.add,
    //         color: Colors.black,
    //       ),
    //       backgroundColor: Colors.teal,
    //     ),
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF06D6A0),
        title: Text("Upload PDF"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BackgroundImage(
        image: 'images/sora5a.jpeg',
        child: SafeArea(
          child: Container(
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                // Builder(
                //   builder: (BuildContext context) => _loadingPath
                //       ? Padding(
                //           padding: EdgeInsets.only(bottom: 10.0),
                //           child: CircularProgressIndicator())
                //       : _path != null || _paths != null
                //           ? Container(
                //               decoration: BoxDecoration(
                //                 color: Color(0xFF06D6A0),
                //                 borderRadius: BorderRadius.circular(50.0),
                //               ),
                //               padding: EdgeInsets.only(bottom: 30.0),
                //               height: MediaQuery.of(context).size.height * 0.50,
                //               child: Padding(
                //                 padding: EdgeInsets.all(15.0),
                //                 child: Scrollbar(
                //                     child: ListView.separated(
                //                   itemCount: _paths != null && _paths.isNotEmpty
                //                       ? _paths.length
                //                       : 1,
                //                   itemBuilder:
                //                       (BuildContext context, int index) {
                //                     final bool isMultiPath =
                //                         _paths != null && _paths.isNotEmpty;
                //                     final String name = 'File : ' +
                //                         (isMultiPath
                //                             ? _paths.keys
                //                             : _fileName ?? '...');
                //                     final path = isMultiPath
                //                         ? _paths.values.toString()
                //                         : _path;
                //                     return ListTile(
                //                       title: Text(
                //                         name,
                //                       ),
                //                       subtitle: Text(path),
                //                     );
                //                   },
                //                   separatorBuilder:
                //                       (BuildContext context, int index) =>
                //                           Divider(),
                //                 )),
                //               ),
                //             )
                //           : Container(),
                // ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF06D6A0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        StadiumBorder()),
                  ),
                  onPressed: () {
                    getPdfAndUpload();
                    final messageBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                          bottom: 50.0, left: 20.0, right: 20.0),
                      backgroundColor: Color(0xFF06D6A0),
                      content: Text(
                        'You Uploaded PDF File',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                      duration: Duration(seconds: 3),
                    );
                  },
                  child: Text("Upload New PDF"),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
