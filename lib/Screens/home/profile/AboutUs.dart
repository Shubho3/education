import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:Education/model/app_details.dart';
import 'package:Education/utill/appImports.dart';

import '../../../Apis/interceptor.dart';
import '../../../utill/SDP.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUs> {
  bool loading = true;
  AppDetails? profileRes;
  late final customMarkers = <Marker>[
    buildPin(const LatLng(51.51868093513547, -0.12835376940892318)),
  ];
  bool counterRotate = false;

  Marker buildPin(LatLng point) => Marker(
        point: point,
        child: const Icon(Icons.location_pin, size: 60, color: Colors.red),
        width: 60,
        height: 60,
      );
  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CC.white,
        appBar: AppBar(
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: CC.transparent,
          elevation: 0,
          title: loading == true
              ? null
              : Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        height: 50,
                        width: 60,
                        fit: BoxFit.fill,
                        color: CC.black,
                        imageUrl: profileRes!.result!.logo == null
                            ? ""
                            : profileRes!.result!.logo!,
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          color: CC.themePurple,
                          strokeWidth: 2,
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Text(
                        profileRes!.result!.restaurantName == null
                            ? ""
                            : profileRes!.result!.restaurantName!,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            // fontFamily:
                            fontFamily: 'popins'),
                      ),
                    ],
                  ),
                ),
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: loading
            ? Center(
                child: Container(
                margin: EdgeInsets.all(10),
                child: lottie.Lottie.asset('assets/loding.json',
                    width: 50, height: 50),
              ))
            : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: CachedNetworkImage(
                              height: 200,
                              width: 320,
                              fit: BoxFit.fill,
                              color: CC.black,
                              imageUrl: profileRes!.result!.logo!,
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                color: CC.themePurple,
                                strokeWidth: 2,
                              )),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Address :- ${profileRes!.result!.restaurantAddress}',
                                      style: GoogleFonts.josefinSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: CC.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Phone :- ${profileRes!.result!.restaurantPhoneNumber}',
                                      style: GoogleFonts.josefinSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: CC.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'City :- ${profileRes!.result!.restaurantCity}',
                                      style: GoogleFonts.josefinSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: CC.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Icon(Icons.facebook,
                                  color: CC.black, size: 30),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Icon(Icons.snapchat,
                                  color: CC.black, size: 30),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child:
                                  Icon(Icons.tiktok, color: CC.black, size: 30),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                  'assets/icons/instagram.svg',
                                  height: 30),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                  'assets/icons/twitterx.svg',
                                  height: 30),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                  'assets/icons/youtube.svg',
                                  height: 30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: CC.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x33000000),
                              offset: Offset(5, 5),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                '       Map',
                                style: GoogleFonts.josefinSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: CC.black),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: SDP.height! / 3.5,
                                  width: SDP.height! / 2.5,
                                  margin: EdgeInsets.all(12),
                                  child: FlutterMap(
                                    options: const MapOptions(
                                      initialCenter: LatLng(22.7196, 75.8577),
                                      initialZoom: 14,
                                      interactionOptions:
                                          const InteractionOptions(
                                        flags: ~InteractiveFlag.doubleTapZoom,
                                      ),
                                    ),
                                    children: [
                                      MarkerLayer(rotate: false, markers: [
                                        Marker(
                                          point: LatLng(22.7196, 75.8577),
                                          width: 20,
                                          height: 20,
                                          alignment: Alignment.centerLeft,
                                          child: Icon(Icons.location_pin,
                                              size: 20, color: Colors.red),
                                        ),
                                      ]),
                                      TileLayer(
                                        urlTemplate:
                                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName: 'com.example.app',
                                      ),
                                      /*  RichAttributionWidget(
                                    attributions: [
                                      TextSourceAttribution(
                                        'OpenStreetMap contributors',
                                        onTap: () => launchUrl(Uri.parse(
                                            'https://openstreetmap.org/copyright')),
                                      ),
                                      //    openStreetMapTileLayer,
                                      //    MarkerLayer(markers: [_marker!]),
                                    ],
                                  ),*/
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ));
  }

  getProfile() async {
    loading = true;
    setState(() {});
    User? user = await getUserDetails();
    final res =
        await api().get(ApiUrls.get_app_setting + '?admin_id=${user.admin_id}');
    AppDetails model = AppDetails.fromJson(res.data);
    if (model.status == "1") {
      ShowToast.ShowT0astError(model.message.toString());
      profileRes = model;
      loading = false;
      setState(() {});
    } else {
      ShowToast.ShowT0astError(model.message.toString());
      loading = false;
      setState(() {});
    }
  }
}
