import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory_cosmo_sordiers/classi_modeli1/drakon_model1.dart';
import 'package:victory_cosmo_sordiers/classi_modeli1/kletka_model1.dart';
import 'package:victory_cosmo_sordiers/classi_modeli1/put_model1.dart';
import 'package:victory_cosmo_sordiers/utiliti1/moneti1.dart';
import 'package:victory_cosmo_sordiers/utiliti1/musica1.dart';
import '../utiliti1/hranilishe1.dart';

enum DRAGKonType { black, green, yellow, red }

enum PlanetType1 { red, gray, blue, green }

enum GameProgress1 { win, lose, cont }

class IgraC1 extends GetxController {
  List<DrakonModel1> drakoni = [];
  List<List<KletkaModel1>> kletki = [];
  List<PutModel1> puti = [];
  int allSteps = 0;
  int dSteps = 0;
  Offset? tappedKl;

  String _gtpts1t1(PlanetType1 ptt1) {
    switch (ptt1) {
      case PlanetType1.blue:
        return 'blue';
      case PlanetType1.green:
        return 'green';
      case PlanetType1.gray:
        return 'gray';
      case PlanetType1.red:
        return 'red';
    }
  }

  void genIgraDr(int lvN, PlanetType1 ptt1) {
    puti.clear();
    tappedKl = null;
    if (ptt1 == PlanetType1.gray) {
      if (lvN == 1) {
        _generateFirstLDr(ptt1);
      } else if (lvN == 2) {
        _generateSecondLDr(ptt1);
      } else if (lvN == 3) {
        _generateThirdLDr(ptt1);
      } else if (lvN == 4) {
        _generateFourthLDr(ptt1);
      } else if (lvN == 5) {
        _generateFivthLDr(ptt1);
      } else if (lvN == 6) {
        _generateSixthLDr(ptt1);
      }
    } else if (ptt1 == PlanetType1.red) {
      if (lvN == 1) {
        _generateRedFirstLDr(ptt1);
      } else if (lvN == 2) {
        _generateRedSecondLDr(ptt1);
      } else if (lvN == 3) {
        _generateRedThirdLDr(ptt1);
      }
    } else if (ptt1 == PlanetType1.green) {
      if (lvN == 1) {
        _generateGreenFirstLDr(ptt1);
      } else if (lvN == 2) {
        _generateGreenSecondLDr(ptt1);
      }
    } else if (ptt1 == PlanetType1.blue) {
      if (lvN == 1) {
        _generateBlueFirstLDr(ptt1);
      } else if (lvN == 2) {
        _generateBlueSecondLDr(ptt1);
      }
    }
  }

  void reseteeeeDr(int lvlN, PlanetType1 ptt1) {
    puti.clear();
    tappedKl = null;
    genIgraDr(lvlN, ptt1);
    update();
  }

  void onBackStepTapDr() {
    if (puti.isNotEmpty && Moneti1.bst.value > 0) {
      int iDr = 0;
      if (puti.last.toIDSD == tappedKl) {
        tappedKl = null;
        for (final kletkiRow in kletki) {
          for (final kletka in kletkiRow) {
            kletka.isNazatad = false;
            kletka.canBeSteppedd = false;
          }
        }
      }
      Moneti1.setBs1(-1);
      dSteps++;
      for (final drakon in drakoni) {
        if (drakon.xDdr == puti.last.toIDSD.dx.toInt() &&
            drakon.yDdr == puti.last.toIDSD.dy.toInt()) {
          kletki[drakon.yDdr][drakon.xDdr].drInKletkad = null;
          kletki[puti.last.fromIDSD.dy.toInt()][puti.last.fromIDSD.dx.toInt()]
              .drInKletkad = drakon.typed;
          drakon.xDdr = puti.last.fromIDSD.dx.toInt();
          drakon.yDdr = puti.last.fromIDSD.dy.toInt();
          break;
        }
        iDr++;
      }

      _animateDr(
          kletki[puti.last.toIDSD.dy.toInt()][puti.last.toIDSD.dx.toInt()]
              .cenPositiond,
          kletki[puti.last.fromIDSD.dy.toInt()][puti.last.fromIDSD.dx.toInt()]
              .cenPositiond,
          iDr);

      puti.removeLast();

      update();
    }
  }

  GameProgress1 onIgraEkranTapDr(
      Offset localOffset, int lvN, PlanetType1 ptt1) {
    int yKDr = 0;
    int xKDr = 0;

    bool foundedKl = false;
    bool onSteppedTap = false;
    for (final kletkiRow in kletki) {
      xKDr = 0;
      for (final kletka in kletkiRow) {
        if (kletka.containsOffsetD(localOffset)) {
          if (kletka.drInKletkad != null) {
            tappedKl = Offset(xKDr.toDouble(), yKDr.toDouble());
          }
          if (kletka.canBeSteppedd) {
            onSteppedTap = true;
          }
          foundedKl = true;
          break;
        }
        xKDr++;
      }
      if (foundedKl) {
        break;
      }
      yKDr++;
    }

    for (final kletkiRow in kletki) {
      for (final kletka in kletkiRow) {
        kletka.isNazatad = false;
        kletka.canBeSteppedd = false;
      }
    }

    if (onSteppedTap) {
      int iDr = 0;
      for (final drakon in drakoni) {
        if (drakon.xDdr == tappedKl!.dx.toInt() &&
            drakon.yDdr == tappedKl!.dy.toInt()) {
          kletki[drakon.yDdr][drakon.xDdr].drInKletkad = null;
          kletki[yKDr][xKDr].drInKletkad = drakon.typed;
          drakon.xDdr = xKDr;
          drakon.yDdr = yKDr;
          break;
        }
        iDr++;
      }
      puti.add(PutModel1(
          kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt()].cenPositiond,
          kletki[yKDr][xKDr].cenPositiond,
          Offset(tappedKl!.dx, tappedKl!.dy),
          Offset(xKDr.toDouble(), yKDr.toDouble()),
          drakoni[iDr].typed));
      _animateDr(
          kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt()].cenPositiond,
          kletki[yKDr][xKDr].cenPositiond,
          iDr);
      dSteps--;
      if (_checkWinPosesDr()) {
        Moneti1.setAlm1(100);
        Moneti1.setBs1(3);
        Hranilishe1.hranilishe!
            .setBool(_gtpts1t1(ptt1) + (lvN + 1).toString(), true);
        return GameProgress1.win;
      } else if (dSteps == 0) {
        return GameProgress1.lose;
      }
      tappedKl = null;
    }

    if (tappedKl != null) {
      _onDrakonTapDr();
    }

    update();

    return GameProgress1.cont;
  }

  bool _checkWinPosesDr() {
    int allKl = 0;
    int withDr = 0;
    for (final kletkiRow in kletki) {
      for (final kletka in kletkiRow) {
        if (kletka.withCircled) {
          allKl++;
          if (kletka.drInKletkad != null) {
            withDr++;
          }
        }
      }
    }

    return allKl == withDr;
  }

  Future<void> _animateDr(Offset startD, Offset endD, int iDr) async {
    Musica1.musOnce1('move_mus.mp3');
    int aniTr = 0;
    late final Timer timer;
    timer = Timer.periodic(const Duration(milliseconds: 20), (time) {
      if (aniTr == 10) {
        timer.cancel();
      }
      drakoni[iDr].cenPositiond =
          Offset.lerp(startD, endD, aniTr * 0.1) ?? Offset.zero;
      aniTr++;
      update();
    });
  }

  void _onDrakonTapDr() {
    kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt()].isNazatad = true;

    if (kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt()].drInKletkad! ==
        DRAGKonType.black) {
      if (yInAreaDr(tappedKl!.dy.toInt() - 1)) {
        if (kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt()]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt()].canBeSteppedd =
              true;
        }
      }
    }
    if (kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt()].drInKletkad! ==
        DRAGKonType.yellow) {
      if (yInAreaDr(tappedKl!.dy.toInt() - 2) &&
          xInAreaDr(tappedKl!.dx.toInt() - 1)) {
        if (kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt() - 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt() - 1]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() - 2) &&
          xInAreaDr(tappedKl!.dx.toInt() + 1)) {
        if (kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt() + 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt() + 1]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() - 1) &&
          xInAreaDr(tappedKl!.dx.toInt() + 2)) {
        if (kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() + 2]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() + 2]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 1) &&
          xInAreaDr(tappedKl!.dx.toInt() + 2)) {
        if (kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() + 2]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() + 2]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 2) &&
          xInAreaDr(tappedKl!.dx.toInt() + 1)) {
        if (kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt() + 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt() + 1]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 2) &&
          xInAreaDr(tappedKl!.dx.toInt() - 1)) {
        if (kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt() - 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt() - 1]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 1) &&
          xInAreaDr(tappedKl!.dx.toInt() - 2)) {
        if (kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() - 2]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() - 2]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() - 1) &&
          xInAreaDr(tappedKl!.dx.toInt() - 2)) {
        if (kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() - 2]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() - 2]
              .canBeSteppedd = true;
        }
      }
    }

    if (kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt()].drInKletkad! ==
        DRAGKonType.green) {
      if (yInAreaDr(tappedKl!.dy.toInt() - 1) &&
          xInAreaDr(tappedKl!.dx.toInt() - 1)) {
        if (kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() - 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() - 1]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() - 2) &&
          xInAreaDr(tappedKl!.dx.toInt() - 2)) {
        if (kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt() - 2]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() - 1]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt() - 2]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 1) &&
          xInAreaDr(tappedKl!.dx.toInt() + 1)) {
        if (kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() + 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() + 1]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 2) &&
          xInAreaDr(tappedKl!.dx.toInt() + 2)) {
        if (kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt() + 2]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() + 1]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt() + 2]
              .canBeSteppedd = true;
        }
      }

      if (yInAreaDr(tappedKl!.dy.toInt() + 1) &&
          xInAreaDr(tappedKl!.dx.toInt() - 1)) {
        if (kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() - 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() - 1]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 2) &&
          xInAreaDr(tappedKl!.dx.toInt() - 2)) {
        if (kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt() - 2]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt() - 1]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt() - 2]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() - 1) &&
          xInAreaDr(tappedKl!.dx.toInt() + 1)) {
        if (kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() + 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() + 1]
              .canBeSteppedd = true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() - 2) &&
          xInAreaDr(tappedKl!.dx.toInt() + 2)) {
        if (kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt() + 2]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt() + 1]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt() + 2]
              .canBeSteppedd = true;
        }
      }
    }
    if (kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt()].drInKletkad! ==
        DRAGKonType.red) {
      if (yInAreaDr(tappedKl!.dy.toInt() - 1)) {
        if (kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt()]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt()].canBeSteppedd =
              true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() - 2)) {
        if (kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt()].canBeSteppedd =
              true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() - 3)) {
        if (kletki[tappedKl!.dy.toInt() - 3]
                        [tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() - 2][tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() - 1][tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt() - 3][tappedKl!.dx.toInt()].canBeSteppedd =
              true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 1)) {
        if (kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt()]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt()].canBeSteppedd =
              true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 2)) {
        if (kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt()].canBeSteppedd =
              true;
        }
      }
      if (yInAreaDr(tappedKl!.dy.toInt() + 3)) {
        if (kletki[tappedKl!.dy.toInt() + 3]
                        [tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() + 2][tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt() + 1][tappedKl!.dx.toInt()]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt() + 3][tappedKl!.dx.toInt()].canBeSteppedd =
              true;
        }
      }
      if (xInAreaDr(tappedKl!.dx.toInt() - 1)) {
        if (kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() - 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() - 1].canBeSteppedd =
              true;
        }
      }
      if (xInAreaDr(tappedKl!.dx.toInt() - 2)) {
        if (kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() - 2]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() - 1]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() - 2].canBeSteppedd =
              true;
        }
      }
      if (xInAreaDr(tappedKl!.dx.toInt() - 3)) {
        if (kletki[tappedKl!.dy.toInt()]
                        [tappedKl!.dx.toInt() - 3]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() - 2]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() - 1]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() - 3].canBeSteppedd =
              true;
        }
      }
      if (xInAreaDr(tappedKl!.dx.toInt() + 1)) {
        if (kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() + 1]
                .drInKletkad ==
            null) {
          kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() + 1].canBeSteppedd =
              true;
        }
      }
      if (xInAreaDr(tappedKl!.dx.toInt() + 2)) {
        if (kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() + 2]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() + 1]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() + 2].canBeSteppedd =
              true;
        }
      }
      if (xInAreaDr(tappedKl!.dx.toInt() + 3)) {
        if (kletki[tappedKl!.dy.toInt()]
                        [tappedKl!.dx.toInt() + 3]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() + 2]
                    .drInKletkad ==
                null &&
            kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() + 1]
                    .drInKletkad ==
                null) {
          kletki[tappedKl!.dy.toInt()][tappedKl!.dx.toInt() + 3].canBeSteppedd =
              true;
        }
      }
    }
  }

  bool yInAreaDr(int yKDr) {
    if (yKDr >= 0 && yKDr < 8) {
      return true;
    }
    return false;
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

  bool xInAreaDr(int xKDr) {
    if (xKDr >= 0 && xKDr < 6) {
      return true;
    }
    return false;
  }

  bool _generateFirstLDr(PlanetType1 themePld) {
    dSteps = 16;
    allSteps = 16;
    kletki = [
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.yellow, 0, 1),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 3, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 4, 1),
      DrakonModel1.fromIJd(DRAGKonType.green, 5, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 2),
      DrakonModel1.fromIJd(DRAGKonType.red, 5, 4),
      DrakonModel1.fromIJd(DRAGKonType.green, 6, 3),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 6, 5),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }

    return true;
  }

  bool _generateSecondLDr(PlanetType1 themePld) {
    dSteps = 16;
    allSteps = 16;
    kletki = [
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.red),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.green, 1, 2),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 1, 3),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 2, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 2, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 2, 3),
      DrakonModel1.fromIJd(DRAGKonType.red, 3, 0),
      DrakonModel1.fromIJd(DRAGKonType.green, 4, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 4),
      DrakonModel1.fromIJd(DRAGKonType.red, 5, 5),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateThirdLDr(PlanetType1 themePld) {
    dSteps = 14;
    allSteps = 14;
    kletki = [
      [
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.red),
      ],
      [
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 1),
      DrakonModel1.fromIJd(DRAGKonType.red, 0, 3),
      DrakonModel1.fromIJd(DRAGKonType.green, 0, 4),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 0),
      DrakonModel1.fromIJd(DRAGKonType.green, 4, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 4, 4),
      DrakonModel1.fromIJd(DRAGKonType.red, 4, 5),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 5, 0),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 6, 0),
      DrakonModel1.fromIJd(DRAGKonType.red, 7, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 7, 1),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 7, 3),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateFourthLDr(PlanetType1 themePld) {
    dSteps = 15;
    allSteps = 15;
    kletki = [
      [
        KletkaModel1(true),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.green),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 4),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 1, 0),
      DrakonModel1.fromIJd(DRAGKonType.green, 1, 5),
      DrakonModel1.fromIJd(DRAGKonType.black, 2, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 2, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 4),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 5, 3),
      DrakonModel1.fromIJd(DRAGKonType.red, 6, 0),
      DrakonModel1.fromIJd(DRAGKonType.green, 6, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 7, 3),
      DrakonModel1.fromIJd(DRAGKonType.red, 7, 4),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateFivthLDr(PlanetType1 themePld) {
    dSteps = 14;
    allSteps = 14;
    kletki = [
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.yellow, 1, 1),
      DrakonModel1.fromIJd(DRAGKonType.green, 1, 4),
      DrakonModel1.fromIJd(DRAGKonType.red, 2, 1),
      DrakonModel1.fromIJd(DRAGKonType.red, 2, 4),
      DrakonModel1.fromIJd(DRAGKonType.red, 4, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 4, 1),
      DrakonModel1.fromIJd(DRAGKonType.green, 4, 3),
      DrakonModel1.fromIJd(DRAGKonType.green, 5, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 4),
      DrakonModel1.fromIJd(DRAGKonType.black, 6, 1),
      DrakonModel1.fromIJd(DRAGKonType.red, 6, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 6, 3),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateSixthLDr(PlanetType1 themePld) {
    dSteps = 13;
    allSteps = 13;
    kletki = [
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 4),
      DrakonModel1.fromIJd(DRAGKonType.red, 1, 0),
      DrakonModel1.fromIJd(DRAGKonType.green, 1, 4),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 2, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 2, 2),
      DrakonModel1.fromIJd(DRAGKonType.green, 5, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 5),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 6, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 6, 5),
      DrakonModel1.fromIJd(DRAGKonType.black, 7, 1),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateRedFirstLDr(PlanetType1 themePld) {
    dSteps = 14;
    allSteps = 14;
    kletki = [
      [
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
      ],
      [
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.red, 0, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 4),
      DrakonModel1.fromIJd(DRAGKonType.green, 1, 5),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 2, 2),
      DrakonModel1.fromIJd(DRAGKonType.red, 2, 5),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 5),
      DrakonModel1.fromIJd(DRAGKonType.green, 4, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 2),
      DrakonModel1.fromIJd(DRAGKonType.red, 5, 5),
      DrakonModel1.fromIJd(DRAGKonType.black, 6, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 6, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 7, 1),
      DrakonModel1.fromIJd(DRAGKonType.red, 7, 2),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateRedSecondLDr(PlanetType1 themePld) {
    dSteps = 11;
    allSteps = 11;
    kletki = [
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.yellow, 0, 2),
      DrakonModel1.fromIJd(DRAGKonType.red, 0, 3),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 1, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 1, 3),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 2, 3),
      DrakonModel1.fromIJd(DRAGKonType.green, 2, 4),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 4, 3),
      DrakonModel1.fromIJd(DRAGKonType.green, 5, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 4),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 6, 2),
      DrakonModel1.fromIJd(DRAGKonType.green, 7, 3),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateRedThirdLDr(PlanetType1 themePld) {
    dSteps = 14;
    allSteps = 14;
    kletki = [
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false, DRAGKonType.green),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.green, 0, 4),
      DrakonModel1.fromIJd(DRAGKonType.red, 1, 4),
      DrakonModel1.fromIJd(DRAGKonType.green, 1, 5),
      DrakonModel1.fromIJd(DRAGKonType.black, 2, 4),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 1),
      DrakonModel1.fromIJd(DRAGKonType.green, 4, 2),
      DrakonModel1.fromIJd(DRAGKonType.green, 5, 2),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 6, 0),
      DrakonModel1.fromIJd(DRAGKonType.red, 6, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 6, 2),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 7, 1),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateGreenFirstLDr(PlanetType1 themePld) {
    dSteps = 14;
    allSteps = 14;
    kletki = [
      [
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
      ],
      [
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.red),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.green, 0, 1),
      DrakonModel1.fromIJd(DRAGKonType.red, 0, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 4),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 5),
      DrakonModel1.fromIJd(DRAGKonType.red, 4, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 4, 1),
      DrakonModel1.fromIJd(DRAGKonType.green, 4, 4),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 5, 5),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 6, 5),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 7, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 7, 4),
      DrakonModel1.fromIJd(DRAGKonType.red, 7, 5),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateGreenSecondLDr(PlanetType1 themePld) {
    dSteps = 13;
    allSteps = 13;
    kletki = [
      [
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 3),
      DrakonModel1.fromIJd(DRAGKonType.green, 1, 0),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 1, 5),
      DrakonModel1.fromIJd(DRAGKonType.black, 2, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 2, 4),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 1),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 5, 2),
      DrakonModel1.fromIJd(DRAGKonType.green, 6, 2),
      DrakonModel1.fromIJd(DRAGKonType.red, 6, 5),
      DrakonModel1.fromIJd(DRAGKonType.red, 7, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 7, 2),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateBlueFirstLDr(PlanetType1 themePld) {
    dSteps = 14;
    allSteps = 14;
    kletki = [
      [
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
      ],
      [
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
      ],
      [
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.black),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 1),
      DrakonModel1.fromIJd(DRAGKonType.red, 0, 4),
      DrakonModel1.fromIJd(DRAGKonType.green, 1, 5),
      DrakonModel1.fromIJd(DRAGKonType.red, 2, 0),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 2, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 3, 2),
      DrakonModel1.fromIJd(DRAGKonType.green, 4, 2),
      DrakonModel1.fromIJd(DRAGKonType.red, 5, 0),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 6, 4),
      DrakonModel1.fromIJd(DRAGKonType.black, 6, 5),
      DrakonModel1.fromIJd(DRAGKonType.red, 7, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 7, 4),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }

  bool _generateBlueSecondLDr(PlanetType1 themePld) {
    dSteps = 12;
    allSteps = 12;
    kletki = [
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.red),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.green),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
      ],
      [
        KletkaModel1(false, DRAGKonType.yellow),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(false),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.green),
      ],
      [
        KletkaModel1(true),
        KletkaModel1(true),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(false),
        KletkaModel1(false, DRAGKonType.black),
        KletkaModel1(true),
      ],
    ];

    drakoni = [
      DrakonModel1.fromIJd(DRAGKonType.black, 0, 3),
      DrakonModel1.fromIJd(DRAGKonType.red, 0, 4),
      DrakonModel1.fromIJd(DRAGKonType.red, 1, 0),
      DrakonModel1.fromIJd(DRAGKonType.green, 1, 3),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 2, 3),
      DrakonModel1.fromIJd(DRAGKonType.black, 4, 4),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 1),
      DrakonModel1.fromIJd(DRAGKonType.black, 5, 2),
      DrakonModel1.fromIJd(DRAGKonType.yellow, 6, 0),
      DrakonModel1.fromIJd(DRAGKonType.green, 6, 5),
      DrakonModel1.fromIJd(DRAGKonType.black, 7, 2),
      DrakonModel1.fromIJd(DRAGKonType.black, 7, 4),
    ];

    for (final drak in drakoni) {
      drak.setThemeDr(themePld);
    }

    int yKDr = 0;
    for (final kletkiRow in kletki) {
      int xKDr = 0;
      for (final kletka in kletkiRow) {
        kletka.generateP11o1211212121221sKlD(xKDr, yKDr, themePld);
        xKDr++;
      }
      yKDr++;
    }
    return true;
  }
}
