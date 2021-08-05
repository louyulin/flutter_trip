import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "https://i2.hoopchina.com.cn/hupuapp/bbs/744/34861744/1624857076_7175112IMG_6041.JPG",
    "https://i4.hoopchina.com.cn/hupuapp/bbs/744/34861744/1624857076_93709IMG_6040.JPG"
  ];
  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / 100;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: NotificationListener(
              onNotification: (notify) {
                if (notify is ScrollUpdateNotification && notify.depth == 0) {
                  _onScroll(notify.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 460,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(_imageUrls[index],
                            fit: BoxFit.fill);
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text('hehe'),
                    ),
                  )
                ],
              )),
        ),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
