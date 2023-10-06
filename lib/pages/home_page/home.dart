import 'package:flutter/material.dart';
import 'package:sakthi_amma/custom_icons_icons.dart';
import 'package:sakthi_amma/button_icons_icons.dart';
import 'home_model.dart';
export 'home_model.dart';
import '../../flutter_flow/flutter_flow_model.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';

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


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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

    
    return  Scaffold(
        extendBody: true,
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
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
                          alignment: AlignmentDirectional(-1.00, -1.00),
                          child: Container(
                            width: double.infinity,
                            height: 500.0,
                            child: Stack(
                              children: [
                                PageView(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset('assets/images/img1.png',
                                                        fit: BoxFit.scaleDown,),
                                    ),
                                    
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset('assets/images/img2.png',
                                                        fit: BoxFit.scaleDown,),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset('assets/images/img4.png',
                                                        fit: BoxFit.scaleDown,),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                          duration: Duration(milliseconds: 500),
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
                                size: Size(66,66),
                                child: ClipOval(
                                  child: Material(
                                    color: Color.fromRGBO(167, 0, 0, 0.4),
                                    //shadowColor: ,
                                    //surfaceTintColor: ,
                                    child: InkWell(
                                      splashColor: Colors.black,
                                      onTap: () {}, 
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(ButtonIcons.button1),
                                          RichText(text: TextSpan(
                                            text: "About Amma",
                                            style: TextStyle(fontSize: 10, color: Colors.black),
                                            
                                          ),
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          ),
                                        ]),
                                    )
                                  )
                                )
                              ),
                              SizedBox.fromSize(
                                size: Size(66,66),
                                child: ClipOval(
                                  child: Material(
                                    color: Color.fromRGBO(255, 189, 89, 0.4),
                                    //shadowColor: ,
                                    //surfaceTintColor: ,
                                    child: InkWell(
                                      splashColor: Colors.black,
                                      onTap: () {}, 
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(ButtonIcons.button2),
                                          RichText(text: TextSpan(
                                            text: "About Temples",
                                            style: TextStyle(fontSize: 10, color: Colors.black),
                                            
                                          ),
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          ),
                                        ]),
                                    )
                                  )
                                )
                              ),
                              SizedBox.fromSize(
                                size: Size(66,66),
                                child: ClipOval(
                                  child: Material(
                                    color: Color.fromRGBO(0, 74, 173, 0.4),
                                    //shadowColor: ,
                                    //surfaceTintColor: ,
                                    child: InkWell(
                                      splashColor: Colors.black,
                                      onTap: () {}, 
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(ButtonIcons.button3),
                                          RichText(text: TextSpan(
                                            text: "Events",
                                            style: TextStyle(fontSize: 10, color: Colors.black),
                                            
                                          ),
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          ),
                                        ]),
                                    )
                                  )
                                )
                              ),
                              SizedBox.fromSize(
                                size: Size(66,66),
                                child: ClipOval(
                                  child: Material(
                                    color: Color.fromRGBO(167, 0, 0, 0.4),
                                    //shadowColor: ,
                                    //surfaceTintColor: ,
                                    child: InkWell(
                                      splashColor: Colors.black,
                                      onTap: () {}, 
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(ButtonIcons.button4),
                                          RichText(text: TextSpan(
                                            text: "Gallery",
                                            style: TextStyle(fontSize: 10, color: Colors.black),
                                            
                                          ),
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          ),
                                        ]),
                                    )
                                  )
                                )
                              ),
                              //ElevatedButton.icon(onPressed: (){}, icon: Icon(ButtonIcons.button1), label: Text("About Amma")),
                              //ElevatedButton.icon(onPressed: (){}, icon: Icon(ButtonIcons.button2), label: Text("About Temples")),
                              //ElevatedButton.icon(onPressed: (){}, icon: Icon(ButtonIcons.button3), label: Text("Pujas & Events")),
                              //ElevatedButton.icon(onPressed: (){}, icon: Icon(ButtonIcons.button4), label: Text("Gallery")),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),

                
/*                 Container(
                  width: 403.0,
                  height: 999.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
/*                     image: DecorationImage(image: AssetImage('assets/images/temple.png'),
                                           fit: BoxFit.cover,
                                           opacity: 0.70) */

                  ),
                  child: MasonryGridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    itemCount: 0,
                    itemBuilder: (context, index) {
                      return [][index]();
                    },
                  ),
                ), */
              ],
            ),
          ),
        ),
      bottomNavigationBar: Container(
        //padding: EdgeInsets.only(bottom: 10),
        padding:const EdgeInsets.only(bottom: 30, right: 32, left: 32),
        child:  BottomBarFloating(
            backgroundColor: Color.fromRGBO(255, 255, 239, 1),
            colorSelected: Color.fromRGBO(255, 189, 89, 1),
            color: Colors.black,
            paddingVertical: 24,
            indexSelected: visit,
            borderRadius: BorderRadius.circular(20),
            //curve: Curve,
            items:[
              TabItem(icon: Icons.home,
                        title: "Home"),
              
              TabItem(icon: CustomIcons.pujas,
                        title: "Pujas"),
              TabItem(icon: CustomIcons.mantras,
                        title: "Mantras"),
              TabItem(icon: CustomIcons.about,
                        title: "About")
              
            ],
            onTap: (int index) => setState(() {
                visit = index;
              })
          ),
          /*
          child: DotNavigationBar(
            borderRadius: 60,
            margin: EdgeInsets.only(left: 5, right: 5),
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            dotIndicatorColor: Colors.white,
            unselectedItemColor: Colors.grey[300],
            enableFloatingNavBar: true,
            onTap: _handleIndexChanged,
            splashColor: Color.fromARGB(255, 235, 136, 22),
            items: [
              /// Home
              DotNavigationBarItem(
                icon: Icon(Icons.home, semanticLabel: "Home",),
                selectedColor: Color(0xff73544C),
              ),
        
              /// Likes
              DotNavigationBarItem(
                icon: Icon(CustomIcons.pujas, semanticLabel: "Pujas"),
                selectedColor: Color(0xff73544C),
              ),
        
              /// Search
              DotNavigationBarItem(
                icon: Icon(CustomIcons.mantras, semanticLabel: "Mantras",),
                selectedColor: Color(0xff73544C),
              ),
        
              /// Profile
              DotNavigationBarItem(
                icon: Icon(CustomIcons.about, semanticLabel: "About",),
                selectedColor: Color(0xff73544C),
              ),
            ],
          ),
          */
      ),
      );
  }
}

enum _SelectedTab { home, favorite, search, person }
