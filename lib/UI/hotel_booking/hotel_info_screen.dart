import 'package:flutter/material.dart';
import 'package:flutter_classifiedappclone/Constants/constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HouseInfoScreen extends StatefulWidget {
  @override
  _HouseInfoScreenState createState() => _HouseInfoScreenState();
}

class _HouseInfoScreenState extends State<HouseInfoScreen>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  GoogleMapController mapController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  buildSwiperPagination() {
    return SwiperPagination(
      alignment: Alignment.bottomCenter, // 位置 Alignment.bottomCenter 底部中间
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
      builder: DotSwiperPaginationBuilder(
          space: 2,
          size: 6,
          activeSize: 12,
          color: Colors.black54,
          activeColor: Colors.yellow),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.4,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.asset(
                      "assets/hotel/hotel_2.png",
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: 3,
                  pagination: buildSwiperPagination(),
                ),
              ),
            ],
          ),
          Positioned(
            top: _width / 1.4 - 20,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: DesignCourseAppTheme.nearlyWhite,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: DesignCourseAppTheme.grey.withOpacity(0.2),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: infoHeight,
                        maxHeight:
                            tempHeight > infoHeight ? tempHeight : infoHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 16),
                          child: Text(
                            '\$28.99',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              letterSpacing: 0.27,
                              color: DesignCourseAppTheme.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'So Beautiful House',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: 0.27,
                              color: DesignCourseAppTheme.darkerText,
                            ),
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            getTimeBoxUI('24', 'Classe'),
                            getTimeBoxUI('2hours', 'Time'),
                            getTimeBoxUI('24', 'Seat'),
                          ],
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Text(
                            'Detail',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 0.27,
                              color: DesignCourseAppTheme.darkerText,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Lorem ipsum is simply  dummy text of printing & typesetting industry, Lorem i dummy text of printing & typesetting industry, Lorem idummy text of printing & typesetting industry, Lorem ipsum is simply dummy text of printing & typesetting industry.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                                letterSpacing: 0.27,
                                color: DesignCourseAppTheme.grey,
                              ),
                              maxLines: 30,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                          child: Text(
                            'Nearby',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 0.27,
                              color: DesignCourseAppTheme.darkerText,
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 1.8,
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: const LatLng(45.521563, -122.677433),
                              zoom: 11.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: SizedBox(
              width: AppBar().preferredSize.height,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: DesignCourseAppTheme.nearlyBlack,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.nearlyBlack,
            ),
          ),
          Text(
            txt2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 14,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomAppBar(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: 50,
              child: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 4,
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonMinWidth:
                    (MediaQuery.of(context).size.width - 80 - 40) / 2,
                children: <Widget>[
                  new RaisedButton(
                    color: DesignCourseAppTheme.blue,
                    child: new Text('Booking'),
                    onPressed: (){},
                  ),
                  new RaisedButton(
                    color: DesignCourseAppTheme.red,
                    child: new Text('Call'),
                    onPressed: (){},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
