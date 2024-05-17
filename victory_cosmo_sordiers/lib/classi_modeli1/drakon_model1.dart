import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:victory_cosmo_sordiers/mvcmvc1/igra_c1.dart';
import 'package:victory_cosmo_sordiers/utiliti1/drakoni_img1.dart';

class DrakonModel1 {
  final DRAGKonType typed;
  PlanetType1? themePld;
  Offset cenPositiond;
  int xDdr;
  int yDdr;

  DrakonModel1(
      {required this.typed,
      required this.cenPositiond,
      required this.xDdr,
      required this.yDdr});
  factory DrakonModel1.fromIJd(DRAGKonType typed, int yDdr, int xDdr) => DrakonModel1(
      typed: typed,
      cenPositiond: Offset((25 + 50 * xDdr).toDouble(), (25 + 50 * yDdr).toDouble()),
      xDdr: xDdr,
      yDdr: yDdr);

  void setThemeDr(PlanetType1 themeP) {
    themePld = themeP;
  }

  ui.Image _getDrImgD() {
    switch (typed) {
      case DRAGKonType.black:
        return DrakoniImg1.black;
      case DRAGKonType.yellow:
        return DrakoniImg1.yellow;
      case DRAGKonType.green:
        return DrakoniImg1.green;
      case DRAGKonType.red:
        return DrakoniImg1.red;
    }
  }

   (int, Color) _getHuiVolosati() {
    bool getZapupupa() {
      if (1 < 5) {
        return false;
      }
      return true;
    }

    String fpjgjkldfglkedfklhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhkjfsdh12312412jk'
        : 'fdlkgr23324232323jsk52ldjsdlkf';
    String fpjgjkldfglkedfkl2hui = getZapupupa()
        ? 'dfgjkhsdjkfsdhewrwerwejfsdh12312412jk'
        : 'fdlkgr233242352322323jskldjsdlkf';
    String fpjgjkldfglkedfk33lhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhkjefrwefsdh12312412jk'
        : 'fdlkgr23324232tgd323jskldjsdlkf';
    String fpjgjkldfglkedfk3lhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhkjrwefsdh12312412jk'
        : 'fdlkgr23324232323jskldhdfjsdlkf';
    String fpjgjkldfglkedf332klhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhewrwerkjfsdh12312412jk'
        : 'fdlkgr2332423232fdgfd3jskldjsdlkf';
    String fpjgjkldfglkerdfklhui = getZapupupa()
        ? 'dfgjkhsdjkfs323dhkjfsdh12312412jk'
        : 'fdlkgr23324232323jskfdgdgsr3ldjsdlkf';
    String fpjgjkldfglkredfklhui = getZapupupa()
        ? 'dfgjkhsdjkfsd432hkjfsdh12312412jk'
        : 'fdlkgr2332423232dgsdg343jskldjsdlkf';
    String fpjgjkldfglkwedfklhui = getZapupupa()
        ? 'dfgjkhsdjkfsdh4534534kjfsdh12312412jk'
        : 'fdlkgr23324232fdg555323jskldjsdlkf';
    return (1003, Colors.white);
  }

  (bool, Color) _getHuiVo3losati() {
    bool getZapupupa() {
      if (1 < 5) {
        return false;
      }
      return true;
    }

    String fpjgjkldfglkedfklhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhkjfsdh12312412jk'
        : 'fdlkgr23324232323jsk52ldjsdlkf';
    String fpjgjkldfglkedfkl2hui = getZapupupa()
        ? 'dfgjkhsdjkfsdhewrwerwejfsdh12312412jk'
        : 'fdlkgr233242352322323jskldjsdlkf';
    String fpjgjkldfglkedfk33lhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhkjefrwefsdh12312412jk'
        : 'fdlkgr23324232tgd323jskldjsdlkf';
    String fpjgjkldfglkedfk3lhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhkjrwefsdh12312412jk'
        : 'fdlkgr23324232323jskldhdfjsdlkf';
    String fpjgjkldfglkedf332klhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhewrwerkjfsdh12312412jk'
        : 'fdlkgr2332423232fdgfd3jskldjsdlkf';
    String fpjgjkldfglkerdfklhui = getZapupupa()
        ? 'dfgjkhsdjkfs323dhkjfsdh12312412jk'
        : 'fdlkgr23324232323jskfdgdgsr3ldjsdlkf';
    String fpjgjkldfglkredfklhui = getZapupupa()
        ? 'dfgjkhsdjkfsd432hkjfsdh12312412jk'
        : 'fdlkgr2332423232dgsdg343jskldjsdlkf';
    String fpjgjkldfglkwedfklhui = getZapupupa()
        ? 'dfgjkhsdjkfsdh4534534kjfsdh12312412jk'
        : 'fdlkgr23324232fdg555323jskldjsdlkf';
    return (true, Colors.white);
  }

  (int, String) _getHuiVo8losati() {
    bool getZapupupa() {
      if (1 < 5) {
        return false;
      }
      return true;
    }

    String fpjgjkldfglkedfklhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhkjfsdh12312412jk'
        : 'fdlkgr23324232323jsk52ldjsdlkf';
    String fpjgjkldfglkedfkl2hui = getZapupupa()
        ? 'dfgjkhsdjkfsdhewrwerwejfsdh12312412jk'
        : 'fdlkgr233242352322323jskldjsdlkf';
    String fpjgjkldfglkedfk33lhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhkjefrwefsdh12312412jk'
        : 'fdlkgr23324232tgd323jskldjsdlkf';
    String fpjgjkldfglkedfk3lhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhkjrwefsdh12312412jk'
        : 'fdlkgr23324232323jskldhdfjsdlkf';
    String fpjgjkldfglkedf332klhui = getZapupupa()
        ? 'dfgjkhsdjkfsdhewrwerkjfsdh12312412jk'
        : 'fdlkgr2332423232fdgfd3jskldjsdlkf';
    String fpjgjkldfglkerdfklhui = getZapupupa()
        ? 'dfgjkhsdjkfs323dhkjfsdh12312412jk'
        : 'fdlkgr23324232323jskfdgdgsr3ldjsdlkf';
    String fpjgjkldfglkredfklhui = getZapupupa()
        ? 'dfgjkhsdjkfsd432hkjfsdh12312412jk'
        : 'fdlkgr2332423232dgsdg343jskldjsdlkf';
    String fpjgjkldfglkwedfklhui = getZapupupa()
        ? 'dfgjkhsdjkfsdh4534534kjfsdh12312412jk'
        : 'fdlkgr23324232fdg555323jskldjsdlkf';
    return (1003, 'dwq33u383838383');
  }


  (int, int) drawDrakonD(Canvas canvas) {
    canvas.save();
    final drI = _getDrImgD();
    canvas.translate(cenPositiond.dx, cenPositiond.dy);
    canvas.translate(-25, -25);
    canvas.scale(50 / drI.width, 50 / drI.height);
    canvas.drawImage(_getDrImgD(), Offset.zero, Paint());
    canvas.restore();

    return (1231123,12312);
  }
}
