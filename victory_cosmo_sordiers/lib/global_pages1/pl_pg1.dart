import 'dart:ui';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory_cosmo_sordiers/classi_modeli1/pt_model1.dart';
import 'package:victory_cosmo_sordiers/divs1/knopka1.dart';
import 'package:victory_cosmo_sordiers/global_pages1/lv_pg1.dart';
import 'package:victory_cosmo_sordiers/mvcmvc1/igra_c1.dart';
import 'package:victory_cosmo_sordiers/mvcmvc1/pt_c1.dart';
import 'package:victory_cosmo_sordiers/utiliti1/moneti1.dart';
import '../utiliti1/hranilishe1.dart';

import '../classi_modeli1/kletka_model1.dart';
import '../utiliti1/musica1.dart';

class PlPg1 extends StatefulWidget {
  final String dsfsdfsdf;
  final String fsdfsdfgdfv;
  final String grtyri7654t;
  final int startPage;
  const PlPg1(
      {this.dsfsdfsdf = 'fjkgjfgk323322332ldfjgkdf',
      this.fsdfsdfgdfv = 'fjkgjfgk323322332ldfjgkdf',
      this.grtyri7654t = 'fjkgjfgk323322332ldfjgkdf',
      this.startPage = 0,
      super.key});

  final aaa = 'ofgkopsgdkgodfgs';
  final aarqwercwa = 'ofgkopsrcqwrwercqwrgdkgodfgs';
  final arewqraa = 'ofgkopsqercwwegdkgodfgs';
  final aeqrcaa = 'ofgkopsgdreqwcrqwercqwkgodfgs';
  DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
      generateP11o1211212121221534WWW53sdf4BVB4464545hdfgssKl(
          int xKk, int yKk, PlanetType1 themeP) {
    final xKDr = xKk;
    final yKDr = yKk;
    final themePld = themeP;
    final cenPositiond =
        Offset((25 + 50 * xKDr).toDouble(), (25 + 50 * yKDr).toDouble());

    return DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG.Dr;
  }

  DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
      generateP11o1211212121221534WWW53sGRTdf44464545hdfgssKl(
          int xKk, int yKk, PlanetType1 themeP) {
    final xKDr = xKk;
    final yKDr = yKk;
    final themePld = themeP;
    final cenPositiond =
        Offset((25 + 50 * xKDr).toDouble(), (25 + 50 * yKDr).toDouble());

    return DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG.Dr;
  }

  DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
      generateP11o1211212121221534WWW53BCVBsdf44464545hdfgssKl(
          int xKk, int yKk, PlanetType1 themeP) {
    final xKDr = xKk;
    final yKDr = yKk;
    final themePld = themeP;
    final cenPositiond =
        Offset((25 + 50 * xKDr).toDouble(), (25 + 50 * yKDr).toDouble());

    return DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
        .Dr;
  }

  DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
      generateP11o1211212121221534WWW53sd543f44464545hdfgssKl(
          int xKk, int yKk, PlanetType1 themeP) {
    final xKDr = xKk;
    final yKDr = yKk;
    final themePld = themeP;
    final cenPositiond =
        Offset((25 + 50 * xKDr).toDouble(), (25 + 50 * yKDr).toDouble());

    return DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
        .Dr;
  }

  DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
      generateP11o1211212121221534WWW53sTRTdf44464545hdfgssKl(
          int xKk, int yKk, PlanetType1 themeP) {
    final xKDr = xKk;
    final yKDr = yKk;
    final themePld = themeP;
    final cenPositiond =
        Offset((25 + 50 * xKDr).toDouble(), (25 + 50 * yKDr).toDouble());

    return DRAGKGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
        .Dr;
  }

  @override
  State<PlPg1> createState() => _PlPgState();
}

class _PlPgState extends State<PlPg1> with TickerProviderStateMixin {
  final RxInt _curPg = 0.obs;
  final _crsCtl = CarouselController();
  final _ptC = Get.find<PtC1>();

  List<Color> _getCrCls1(RxInt pg) {
    if (pg.value == 1) {
      return [
        Color.fromRGBO(255, 127, 127, 1),
        Color.fromRGBO(106, 22, 22, 1),
      ];
    } else if (pg.value == 0) {
      return [
        Color.fromRGBO(80, 156, 246, 1),
        Color.fromRGBO(31, 52, 83, 1),
      ];
    } else if (pg.value == 2) {
      return [
        Color.fromRGBO(118, 91, 198, 1),
        Color.fromRGBO(65, 45, 84, 1),
      ];
    } else {
      return [
        Color.fromRGBO(89, 95, 221, 1),
        Color.fromRGBO(37, 39, 94, 1),
      ];
    }
  }

  void seseDlg1() {
    RxBool muc = (Hranilishe1.hranilishe!.getBool('muc') ?? true).obs;
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: IntrinsicHeight(
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(24).copyWith(bottom: 0),
                          child: GestureDetector(
                            onTap: Get.back,
                            child: Image.asset(
                              'assets/decor/krest.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Center(
                          child: Text(
                            'SETTINGS'.toUpperCase(),
                            style: TextStyle(
                                color: Color.fromRGBO(40, 10, 130, 1),
                                fontSize: 28,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  muc.toggle();
                                  if (muc.value) {
                                    Musica1.dancedance1('bg_mus.mp3');
                                    Hranilishe1.hranilishe!
                                        .setBool('muc', true);
                                  } else {
                                    Musica1.breakALeg1();
                                    Hranilishe1.hranilishe!
                                        .setBool('muc', false);
                                  }
                                },
                                child: Obx(
                                  () => Knopka1(
                                      rebenokDr: Text(
                                        muc.value ? 'MUSIC ON' : 'MUSIC OFF',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      tsvetDr: muc.value
                                          ? Color.fromRGBO(170, 141, 255, 1)
                                          : Color.fromRGBO(185, 185, 185, 1),
                                      tenTsvetDr:
                                          Color.fromRGBO(144, 144, 144, 0.4),
                                      borColDr: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Knopka1(
                                      heightDr: 50,
                                      rebenokDr: Text(
                                        'Privacy Policy'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      tsvetDr: Color.fromRGBO(170, 141, 255, 1),
                                      tenTsvetDr:
                                          Color.fromRGBO(54, 16, 166, 0.4),
                                      borColDr: Colors.white)),
                              SizedBox(
                                height: 16,
                              ),
                              Knopka1(
                                  rebenokDr: Text(
                                    'TERMS OF USE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  tsvetDr: Color.fromRGBO(170, 141, 255, 1),
                                  tenTsvetDr:
                                      Color.fromRGBO(144, 144, 144, 0.4),
                                  borColDr: Colors.white),
                              SizedBox(
                                height: 16,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Knopka1(
                                    rebenokDr: Text(
                                      'SUPPORT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    tsvetDr: Color.fromRGBO(170, 141, 255, 1),
                                    tenTsvetDr:
                                        Color.fromRGBO(144, 144, 144, 0.4),
                                    borColDr: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.startPage != 0) {
        _crsCtl.jumpToPage(widget.startPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: _getCrCls1(_curPg),
            )),
          ),
        ),
        Positioned(
          left: 50,
          child: Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/decor/sopli.png',
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: GetBuilder<PtC1>(builder: (_) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: SizedBox(
                              width: 48,
                              height: 48,
                              child: Image.asset('assets/decor/back.png'),
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 48,
                                width: 107,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(223, 215, 255, 1),
                                  borderRadius: BorderRadius.circular(48),
                                  border:
                                      Border.all(width: 3, color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 2),
                                      color: Color.fromRGBO(0, 0, 0, 0.2),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 107,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/decor/almaz.png',
                                      height: 48,
                                      width: 48,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(minWidth: 48),
                                      alignment: Alignment.center,
                                      child: Obx(
                                        () => Text(
                                          Moneti1.alm.value.toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  90, 56, 191, 1)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 48,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CarouselSlider.builder(
                        carouselController: _crsCtl,
                        options: CarouselOptions(
                          enlargeFactor: 0.5,
                          viewportFraction: 0.6,
                          enlargeCenterPage: true,
                          disableCenter: true,
                          onPageChanged: (index, reason) {
                            _curPg.value = index;
                          },
                        ),
                        itemCount: _ptC.pts1.length,
                        itemBuilder: (context, index, realIndex) => PltCd1(
                          ptm: _ptC.pts1[index],
                          onPtBtn: (pt) => _ptC.onPtBntTap1(pt),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              _crsCtl.previousPage();
            },
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 144, 81, 1),
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomRight: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      color: Color.fromRGBO(170, 141, 255, 0.4))
                ],
              ),
              padding: EdgeInsets.only(right: 16),
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/decor/left.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              _crsCtl.nextPage();
            },
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 144, 81, 1),
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      color: Color.fromRGBO(170, 141, 255, 0.4))
                ],
              ),
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/decor/right.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PltCd1 extends StatefulWidget {
  final PtModelD ptm;
  final void Function(PtModelD ptt1) onPtBtn;
  const PltCd1({required this.ptm, required this.onPtBtn, super.key});
  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o121121245512122vvvx153454534534343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o12112124551212215345453453vx4343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o1211212455cxcb12122153454534534343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o12112124551212215345dfs4534534343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o12112124551212215345dfd4534534343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  @override
  State<PltCd1> createState() => _PltCd1State();
}

class _PltCd1State extends State<PltCd1> {
  void bbbDlg1(BuildContext context, String msgggg) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: IntrinsicHeight(
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            msgggg.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16).copyWith(top: 0),
                          child: GestureDetector(
                            onTap: Get.back,
                            child: Knopka1(
                                rebenokDr: Text(
                                  'GREAT!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                tsvetDr: Color.fromRGBO(170, 141, 255, 1),
                                tenTsvetDr: Color.fromRGBO(144, 144, 144, 0.4),
                                borColDr: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o121121245512122vvvx153454534534343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o12112124551212215345453453vx4343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o1211212455cxcb12122153454534534343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o12112124551212215345dfs4534534343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  DRAGKGGGGGGGGGGGGG?
      generateP1R323R32RR231o12112124551212215345dfd4534534343sdf44464545sKl(
          PlanetType1 themeP,
          bool idIdiD,
          DRAGK draaaa,
          int f1,
          int ff1,
          int fff1) {
    final String askldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklklds = 1;
    final String askldska1dksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkgfjk1fgjkgfjk = Offset.infinite;
    final alkdkldskdlsk1lklds = 1;
    final String askld1skadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfkg1fjkfgjkgfjk = Offset.infinite;
    final alkdkldskdl1sklklds = 1;
    final String askl1dskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gf1kgfjkfgjkgfjk = Offset.infinite;
    final alkdkldskd1lsklklds = 1;
    final String ask1ldskadksak = 'аугарцгуагрцугарцуац1212212';
    final Offset gfk1gfjkfgjkgfjk = Offset.infinite;
    final alkdkldskdlsklk11lds = 1;
    print(alkdkldskdlsklklds + 2);
    var gggggg = alkdkldskdlsklklds + 100;
    return null;
  }

  RxBool _plLo = false.obs;
  RxBool _reLo = false.obs;
  final _ptC = Get.find<PtC1>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Column(
          children: [
            Image.asset(
              widget.ptm.phtD,
              width: 234,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              widget.ptm.ptnmD,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 4),
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    )
                  ]),
            ),
            Visibility(
              visible: !widget.ptm.isActD && widget.ptm.isPayD,
              child: Text(
                'AVAILABLE ONLY WITH PREMIUM',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            Visibility(
              visible: !widget.ptm.isActD && !widget.ptm.isPayD,
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Open planet for ${widget.ptm.prsD}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Visibility(
                        visible: !widget.ptm.isPayD,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            Image.asset(
                              'assets/decor/diam.png',
                              width: 24,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: () async {
            if (widget.ptm.isActD) {
              Get.to(() => LvPg1(
                    ptt1: widget.ptm.ptTypeD,
                    ptt1Nm: widget.ptm.ptnmD,
                  ));
            } else {
              if (!widget.ptm.isActD && widget.ptm.isPayD) {
                if (!_plLo.value) {
                  _plLo.value = true;
                  final wwwwww = await Apphud.paywalls();
                  print(wwwwww?.paywalls.first.products!);

                  final ananan = await Apphud.purchase(
                    product: wwwwww?.paywalls.first.products!
                        .where(
                            (fodpofdopfd) => fodpofdopfd.productId == 'premium')
                        .toList()
                        .first,
                  );
                  if (ananan.error == null) {
                    Hranilishe1.hranilishe!.setBool('spermDr', true);
                    Hranilishe1.hranilishe!.setBool('blue', true);
                    _ptC.pts1[3].isActD = true;
                    _ptC.update();
                    bbbDlg1(context, 'YOU GOT Galactarius planet');
                  }

                  _plLo.value = false;
                }
              } else {
                widget.onPtBtn(widget.ptm);
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Knopka1(
              rebenokDr: Obx(
                () => _plLo.value
                    ? CupertinoActivityIndicator()
                    : Text(
                        widget.ptm.isActD
                            ? 'START'
                            : widget.ptm.isPayD
                                ? 'BUY'
                                : 'OPEN',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
              ),
              tsvetDr: widget.ptm.isActD ||
                      widget.ptm.isPayD ||
                      widget.ptm.prsD < Moneti1.alm.value
                  ? Color.fromRGBO(170, 141, 255, 1)
                  : Color.fromRGBO(185, 185, 185, 1),
              tenTsvetDr: Color.fromRGBO(54, 16, 166, 0.4),
              borColDr: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
