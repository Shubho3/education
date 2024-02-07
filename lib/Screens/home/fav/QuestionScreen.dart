import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/types/gf_progress_type.dart';
import 'package:lottie/lottie.dart';

import '../../../model/ItemRes.dart';
import '../../../utill/SDP.dart';
import '../../../utill/appImports.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool loading = true;
  bool data = true;
  ItemRes? productRes;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    super.initState();
    //  getProducts();
  }

  void getProducts() async {
    setState(() {
      loading = true;
      data = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString("user_id");

    var res = await Webservices.getListModelFromUrl(
        "${ApiUrls.get_favorite_item}?user_id=$user_id");
    try {
      if (res["status"] == "1" && res["result"].toString() != "[]") {
        productRes = ItemRes.fromJson(res);
        setState(() {
          productRes;
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
    return Scaffold(
      backgroundColor: CC.white,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 10, 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 5, 7, 12),
                        child: SizedBox(
                          child: Text(
                            "1 % Completed",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: CC.gray),
                          ),
                        ),
                      ),
                      GFProgressBar(
                        percentage: 0.1,
                        lineHeight: 3,
                        alignment: MainAxisAlignment.spaceBetween,
                        /* leading  : Icon( Icons.sentiment_dissatisfied, color: GFColors.DANGER),
                                              trailing: Icon( Icons.sentiment_satisfied, color: GFColors.SUCCESS),
                                            */
                        backgroundColor: Colors.black26,
                        progressBarColor: GFColors.SUCCESS,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                                color: CC.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_left,
                                  color: CC.themePurple,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Topic Anterior',
                                  style: TextStyle(
                                    color: CC.themePurple,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                                color: CC.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Text(
                                  'Próximo Topic',
                                  style: TextStyle(
                                    color: CC.themePurple,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: CC.themePurple,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'WELCOME TO THE BASIC COURSE | WELCOME TO THE BASIC COURSE',
                          style: TextStyle(
                            color: CC.black,
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Material didático: Avalie a possibilidade de adquirir os livros que eu recomendo para acompanhar os meus cursos. Ter um livro para guiar os seus estudos pode fazer toda a diferença nos resultados que você procura; os exercícios vão estimular a sua memória e ajudar na fixação do conteúdo ensinado ao longo das aulas.',
                          style: TextStyle(
                            color: CC.black,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Material didático: Avalie a possibilidade de adquirir os livros que eu recomendo para acompanhar os meus cursos. Ter um livro para guiar os seus estudos pode fazer toda a diferença nos resultados que você procura; os exercícios vão estimular a sua memória e ajudar na fixação do conteúdo ensinado ao longo das aulas.',
                          style: TextStyle(
                            color: CC.black,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}

CongratspaymentWidget() {}
