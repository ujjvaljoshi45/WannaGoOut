import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class PropertyDetialView extends StatefulWidget {
  static const routeName = 'property_detail';
  const PropertyDetialView({super.key});

  @override
  State<PropertyDetialView> createState() => _PropertyDetialViewState();
}

class _PropertyDetialViewState extends State<PropertyDetialView> {
  late ScrollController scrollController;
  String appbarTitle = '';
  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.extentAfter < 10) {
          setState(() {
            appbarTitle = title;
          });
        } else {
          setState(() {
            appbarTitle = '';
          });
        }
      });
    super.initState();
  }

  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = false;
  var title = "Kanan's Property";
  var address = 'Address Goes here.';
  List<String> features = [
    'Feature 1',
    'Feature 2',
    'Feature 3',
    'Feature 4',
    'Feature 5',
    'Feature 6'
  ];
  var distFromRailway = '';
  var distFromBus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title: Text(appbarTitle),
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 200.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(''),
              background: Image(
                image: AssetImage('assets/image1.png'),
                fit: BoxFit.cover,
              ),
            ),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(child: BackButton(color: Colors.black)),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent.withOpacity(0.175),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const CircleAvatar(
                  child: Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          SliverList.list(
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  alignment: Alignment.centerLeft,
                  color: Colors.grey[350],
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Address
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  alignment: Alignment.centerLeft,
                  color: Colors.grey[350],
                  child: Text(
                    address,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              // Features
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey[350],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Feature 0 to 2
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text(
                              features[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              features[1],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              features[2],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      // Feature 3 to 5
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text(
                              features[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              features[1],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              features[2],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.grey[350],
                    child:
                        Text('xkm from Bus Stop | xkm from Railway Station')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Text('Hello')
            ],
          )
        ],
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () async {
              await FlutterPhoneDirectCaller.callNumber('7435951550');
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              decoration: BoxDecoration(color: Colors.grey[400]),
              child: const Center(
                child: Text(
                  'Call',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Uri url = Uri.parse('https://wa.me/917435951550');
              if (!await launchUrl(url)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Could not launch Whatsapp'),
                  ),
                );
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              decoration: BoxDecoration(color: Colors.grey[400]),
              child: const Center(
                child: Text(
                  'Chat on Whatsapp',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
