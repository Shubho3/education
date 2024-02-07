import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:Education/Screens/home/publication/PublicationDetailsScreen.dart';

import '../../../utill/SDP.dart';
import '../../../utill/appImports.dart';
import '../../../widgets/appbar.dart';
import 'PublicationModel.dart';

class PublicationListScreen extends StatefulWidget {
  const PublicationListScreen({super.key});

  @override
  State<PublicationListScreen> createState() => _PublicationListScreenState();
}

class _PublicationListScreenState extends State<PublicationListScreen> {
  bool loading = true;
  bool data = true;
  PublicationModel? publicationRes;
  User? user;

  @override
  void initState() {
    getPublication();
    super.initState();
  }

  getPublication() async {
    user = await getUserDetails();
    print("getUserDetailsfhgffghgfghfhg" + user!.id.toString());
    print("getUserDetailsfhgffghgfghfhg" + user!.admin_id.toString());
    setState(() {
      user;
      loading = true;
      data = true;
    });

    var res = await Webservices.getListModelFromUrl(
        ApiUrls.get_publication + "?admin_id=${user!.admin_id}");
    try {
      if (res["status"] == "1" && res["result"].toString() != "[]") {
        publicationRes = PublicationModel.fromJson(res);
        setState(() {
          publicationRes;
          data = false;
          loading = false;
        });
      } else {
        loading = false;
        data = true;
        setState(() {});
      }
    } catch (e) {
      loading = false;
      data = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      backgroundColor: CC.white,
      appBar: appBar(
        context: context,
        title: "Publications",
        BackColor: CC.themePurple,
        image: "pubss.png",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Publications",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Color(0xFF070707),
              ),
            ),
          ),
          loading
              ? Center(
                  child: Container(
                  margin: EdgeInsets.all(10),
                  child:
                      Lottie.asset('assets/loding.json', width: 50, height: 50),
                ))
              : data
                  ? Center(
                      child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "No Data Found",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF070707),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: publicationRes!.result!.isNotEmpty
                          ? StaggeredGrid.count(
                              axisDirection: AxisDirection.down,
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              children: [
                                  for (var data in publicationRes!.result!)
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            createRoute(
                                                PublicationDetailsScreen(publicationx: data,)));
                                      },
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 4, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: SDP.sdp(80),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    data.image!,
                                                  ),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 8, 0, 4),
                                              child: Text(
                                                data.name!,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Poppins',
                                                  color: CC.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ])
                          : Center(
                              child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No Data Found",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF070707),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                    ),
        ],
      ),
    );
  }
}
