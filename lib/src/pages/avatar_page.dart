import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar'),
          actions: [
            Container(
              padding: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage(
                    'https://pngimg.com/uploads/lego/lego_PNG37.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.green[100],
              ),
            ),
          ],
        ),
        body: Center(
            child: FadeInImage(
          image: NetworkImage(
              'https://wtspdp.com/wp-content/uploads/2020/03/Doremon-images-for-whatsapp-dp-14.jpg'),
          placeholder: AssetImage('assets/loading-icon-gif-6.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        )));
  }
}
