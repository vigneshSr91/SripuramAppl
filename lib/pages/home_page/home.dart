import 'package:flutter/material.dart';
import 'package:sakthi_amma/custom_icons_icons.dart';
import 'package:sakthi_amma/button_icons_icons.dart';
import 'package:sakthi_amma/pages/home_page/video_player.dart';
import '../../models/channel_info.dart';
import '../../models/videos_list.dart';
import '../../services/services.dart';
import 'home_model.dart';
export 'home_model.dart';
import '../../flutter_flow/flutter_flow_model.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int visit = 0;
  var _selectedTab = _SelectedTab.home;
  late HomePageModel _model;
  List<String> thumbnailUrlList = [];

  late ChannelInfo _channelInfo;
  late Item _item;
  late bool _loading;
  late String _playlistId;
  late String _nextPageToken;
  VideosList? _videosList;
  late ScrollController _scrollController;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loading = true;
    _nextPageToken = '';
    _scrollController = ScrollController();
    _getChannelInfo();
    _model = createModel(context, () => HomePageModel());
  }

  _loadVideos() async {
    VideosList tempVideosList = await Services.getVideosList(
        playlistId: _playlistId, pageToken: _nextPageToken);
    _nextPageToken = tempVideosList.nextPageToken;

    if (_videosList == null) {
      _videosList = VideosList(
          kind: tempVideosList.kind,
          etag: tempVideosList.etag,
          nextPageToken: tempVideosList.nextPageToken,
          videos: tempVideosList.videos,
          pageInfo: tempVideosList.pageInfo);
    } else {
      _videosList?.videos.addAll(tempVideosList.videos);
    }
    setState(() {});
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo.items[0];
    _playlistId = _item.contentDetails.relatedPlaylists.uploads;

    await _loadVideos();
    setState(() {
      _loading = false;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: scaffoldKey,
      body: Stack(
        children: <Widget>[
          SafeArea(
          top: true,
          child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 386.0,
                            height: 460.0,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(-1.00, -1.00),
                              child: SizedBox(
                                width: double.infinity,
                                height: 460.0,
                                child: Stack(
                                  children: [
                                    PageView(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/img1.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/img2.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/img4.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.00, 1.00),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 16.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: _model.pageViewController ??=
                                              PageController(initialPage: 0),
                                          count: 3,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration: const Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          effect: smooth_page_indicator
                                              .ExpandingDotsEffect(
                                            expansionFactor: 3.0,
                                            spacing: 8.0,
                                            radius: 16.0,
                                            dotWidth: 16.0,
                                            dotHeight: 8.0,
                                            dotColor: FlutterFlowTheme.of(context)
                                                .accent1,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                                width: 397.0,
                                height: 88.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox.fromSize(
                                        size: const Size(66, 66),
                                        child: ClipOval(
                                            child: Material(
                                                color:
                                                    const Color.fromRGBO(167, 0, 0, 0.4),
                                                //shadowColor: ,
                                                //surfaceTintColor: ,
                                                child: InkWell(
                                                  splashColor: Colors.black,
                                                  onTap: () {},
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        const Icon(ButtonIcons.button1),
                                                        RichText(
                                                          text: const TextSpan(
                                                            text: "About Amma",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    Colors.black),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          softWrap: true,
                                                        ),
                                                      ]),
                                                )))),
                                    SizedBox.fromSize(
                                        size: const Size(66, 66),
                                        child: ClipOval(
                                            child: Material(
                                                color: const Color.fromRGBO(
                                                    255, 189, 89, 0.4),
                                                //shadowColor: ,
                                                //surfaceTintColor: ,
                                                child: InkWell(
                                                  splashColor: Colors.black,
                                                  onTap: () {},
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        const Icon(ButtonIcons.button2),
                                                        RichText(
                                                          text: const TextSpan(
                                                            text: "About Temples",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    Colors.black),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          softWrap: true,
                                                        ),
                                                      ]),
                                                )))),
                                    SizedBox.fromSize(
                                        size: const Size(66, 66),
                                        child: ClipOval(
                                            child: Material(
                                                color:
                                                    const Color.fromRGBO(0, 74, 173, 0.4),
                                                //shadowColor: ,
                                                //surfaceTintColor: ,
                                                child: InkWell(
                                                  splashColor: Colors.black,
                                                  onTap: () {},
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        const Icon(ButtonIcons.button3),
                                                        RichText(
                                                          text: const TextSpan(
                                                            text: "Events",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    Colors.black),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          softWrap: true,
                                                        ),
                                                      ]),
                                                )))),
                                    SizedBox.fromSize(
                                        size: const Size(66, 66),
                                        child: ClipOval(
                                            child: Material(
                                                color:
                                                    const Color.fromRGBO(167, 0, 0, 0.4),
                                                //shadowColor: ,
                                                //surfaceTintColor: ,
                                                child: InkWell(
                                                  splashColor: Colors.black,
                                                  onTap: () {},
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        const Icon(ButtonIcons.button4),
                                                        RichText(
                                                          text: const TextSpan(
                                                            text: "Gallery",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    Colors.black),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          softWrap: true,
                                                        ),
                                                      ]),
                                                )))),
                                    //ElevatedButton.icon(onPressed: (){}, icon: Icon(ButtonIcons.button1), label: Text("About Amma")),
                                    //ElevatedButton.icon(onPressed: (){}, icon: Icon(ButtonIcons.button2), label: Text("About Temples")),
                                    //ElevatedButton.icon(onPressed: (){}, icon: Icon(ButtonIcons.button3), label: Text("Pujas & Events")),
                                    //ElevatedButton.icon(onPressed: (){}, icon: Icon(ButtonIcons.button4), label: Text("Gallery")),
                                  ],
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Videos",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 386.0,
                            height: 90,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: 
                                  _loading ? SpinKitWave(color: FlutterFlowTheme.of(context).secondary )
                                    :
                                     NotificationListener<ScrollEndNotification>(
                                       onNotification: (ScrollNotification notification){
                                        if (_videosList!.videos.length >= 
                                            int.parse(_item.statistics.videoCount)){
                                              return true;
                                            }
                                        if (notification.metrics.pixels == notification.metrics.maxScrollExtent){
                                          _loadVideos();
                                        }
                                        return true;
                                       },
                                       child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        controller: _scrollController,
                                        itemBuilder: (context, index) {
                                          VideoItem videoItem =
                                              _videosList!.videos[index];
                                          return InkWell(
                                            onTap: () async{
                                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                                return VideoPlayerScreen(videoItem: videoItem,);
                                              }));
                                            },
                                            child: Container(
                                                child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: CachedNetworkImage(
                                                    imageUrl: videoItem.video.thumbnails
                                                        .thumbnailsDefault.url,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                )
                                              ],
                                            )),
                                          );
                                        }),
                                     ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 386.0,
                            height: 90,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                          )
                          /*
                          Align(
                            child: Container(
                              width: 397.0,
                              height: 160.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row( 
                                children: [
                                  ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index){
                                    VideoItem videoItem = _videosList!.videos[index];
                                    return Container(
                                      child : Row(
                                        children: [
                                          CachedNetworkImage(imageUrl: videoItem.video.thumbnails.thumbnailsDefault.url,)
                                        ],
                                      )
                                      
                                    );
                                  }),
                                ],
                              ),
                            ),
                            ),
                            */
                        ],
                      ),
                    ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: bottomNavigationBar())
        ]
        ,),
      );
      // bottomNavigationBar: DotNavigationBar(
      //   onTap: (int index) => setState(() {
      //             visit = index;
      //           }),
      //   margin: const EdgeInsets.only(bottom: 30, right: 32, left: 32),
      //   items: [
      //         DotNavigationBarItem(icon: Icon( Icons.home, semanticLabel: "Home", )),
      //         DotNavigationBarItem(icon: Icon( CustomIcons.pujas, semanticLabel: "Pujas")),
      //         DotNavigationBarItem(icon: Icon(CustomIcons.mantras, semanticLabel: "Mantras")),
      //         DotNavigationBarItem(icon: Icon( CustomIcons.about, semanticLabel: "About"))
      //       ],
      // )
      
      // Container(
      //   //padding: EdgeInsets.only(bottom: 10),
      //   padding: const EdgeInsets.only(bottom: 30, right: 32, left: 32),
      //   decoration: new BoxDecoration(
      //     color: FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.5)
      //   ),
      //   child: BottomBarFloating(
      //       backgroundColor: Color.fromRGBO(255, 255, 239, 1),
      //       colorSelected: Color.fromRGBO(255, 189, 89, 1),
      //       color: Colors.black,
      //       paddingVertical: 24,
      //       indexSelected: visit,
      //       borderRadius: BorderRadius.circular(20),
      //       //curve: Curve,
      //       items: [
      //         TabItem(icon: Icons.home, title: "Home"),
      //         TabItem(icon: CustomIcons.pujas, title: "Pujas"),
      //         TabItem(icon: CustomIcons.mantras, title: "Mantras"),
      //         TabItem(icon: CustomIcons.about, title: "About")
      //       ],
      //       onTap: (int index) => setState(() {
      //             visit = index;
      //           })),
      // ),
  }
  Widget bottomNavigationBar(){
    return Container(
      //padding: const EdgeInsets.only(bottom: 30, right: 32, left: 32),
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.5),
        ),
      child: BottomBarFloating(
            backgroundColor: const Color.fromRGBO(255, 255, 239, 1),
            colorSelected: const Color.fromRGBO(255, 189, 89, 1),
            color: Colors.black,
            paddingVertical: 12,
            indexSelected: visit,
            borderRadius: BorderRadius.circular(20),
            //curve: Curve,
            items: const [
              TabItem(icon: Icons.home, title: "Home"),
              TabItem(icon: CustomIcons.pujas, title: "Pujas"),
              TabItem(icon: CustomIcons.mantras, title: "Mantras"),
              TabItem(icon: CustomIcons.about, title: "About")
            ],
            onTap: (int index) => setState(() {
                  visit = index;
                })),
    );
    
  }
}

enum _SelectedTab { home, favorite, search, person }
