import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import '../Control/FirebaseFunctions.dart';
import '../Control/SharedFunctions.dart';
import '../Model/CustomWidgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool click = false;
  bool isLoading = false;
  bool isStudent = true;
  String userName = "";
  String email = "";
  String link = '';
  Image? data;


  _getUserData() async {
    bool? isData = await SharedFunctions.getUserStudentSharedPreference();
    var val = await SharedFunctions.getUserEmailSharedPreference();
    setState(() {
      isStudent = isData!;
      email = val!;
    });
    var user = await FirebaseFunctions().getStudentData(email);
    print(isData!);
    setState(() {
      userName = user.docs[0].get('studentName');
    });
  }
  _getImage() async {
    setState(() {
      isLoading = true;
    });
    final ref = await FirebaseStorage.instance.ref('sampleFile').child('samplePicture.png');
    link = await ref.getDownloadURL();
    setState(() {
      data = Image.network(
      link,
      fit: BoxFit.fill,
       );
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
   _getUserData();
   _getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
          centerTitle: true,
          title: Text("HOME", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                isLoading ? CircularProgressIndicator() : customContentFeed(userName: 'Yarkın Ata', content: data),
                SizedBox(height: 30),
                customContentFeed(userName: 'Yarkın Ata', content: 'hello world teacher now'),
                customContentFeed(userName: 'Metin Baybars Arslan', content: 'İzmir Ekonomi Üniversitesi’nin (İEÜ) 25 öğrencisi, deprem sonrası oluşturulan barınma alanlarına yönelik alternatif projeler geliştirmek üzere 5 gün süren atölye çalışmasında bir araya geldi. Konteyner kent başta olmak üzere depremzedeler için en iyi yaşam alanlarını oluşturmak üzerine yoğunlaşan gençler, hızlı ve düşük maliyetle uygulanabilecek fikirler geliştirdi. Dörder ve beşer kişilik gruplar halinde çalışan öğrenciler, konteyner kentlerde ortak yaşam alanlarının çoğaltılabileceğine vurgu yaptı, çocukların oyun oynayabileceği ve film izleyebileceği özel bölümlerin de yer aldığı tasarımlar hazırladı. Öğrenciler, atölye sonunda İEÜ Rektörü Prof. Dr. Murat Aşkar’ın elinden sertifikalarını aldı.'),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
        drawer: customDrawer(),
        floatingActionButton: Visibility(
          visible: !isStudent,
          child: Transform.scale(
            scale: 1.2,
            child: FloatingActionButton(
                backgroundColor: PageColors.mainColor,
                onPressed: () {

                },
                child: Icon(FontAwesomeIcons.paperPlane, size: 25.0)
            ),
          ),
        ),
    );
  }
}
