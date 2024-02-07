import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Education/Screens/home/publication/PublicationModel.dart'as pb;
import '../../../utill/SDP.dart';
import '../../../utill/appImports.dart';
import '../../../widgets/appbar.dart';

class PublicationDetailsScreen extends StatefulWidget {
  const PublicationDetailsScreen({super.key, required this.publicationx});
  final pb.Result publicationx;
  @override
  State<PublicationDetailsScreen> createState() =>
      _PublicationDetailsScreenState();
}

class _PublicationDetailsScreenState extends State<PublicationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CC.white,
        appBar: appBar(
          context: context,
          title: "Publication Details",
          BackColor: CC.themePurple,
          image: "pubss.png",
        ),
        body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: CachedNetworkImage(
                              height: 240,
                              width:SDP.width!,
                              fit: BoxFit.fill,
                              imageUrl: widget.publicationx.image??
                                  "https://imgmediagumlet.lbb.in/media/2021/03/60624a1d44d66a1e000f0937_1617054237584.jpg?fm=webp&w=750&h=500&dpr=1",
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                       '${widget.publicationx.name}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: CC.themePurple),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '${widget.publicationx.name}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: CC.themePurple),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '  About ',
                          //  '${profileRes!.result!.restaurantAddress}',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: CC.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '${widget.publicationx.description}',
                          style: GoogleFonts.josefinSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: CC.black),
                        ),
                      ),
                    ]),
              ));
  }

}
