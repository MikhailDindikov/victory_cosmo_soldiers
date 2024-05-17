import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:victory_cosmo_sordiers/bds1/glavni_ekran_bind1.dart';
import 'package:victory_cosmo_sordiers/mvcmvc1/globalni_c1.dart';
import 'package:victory_cosmo_sordiers/utiliti1/moneti1.dart';

import 'classi_modeli1/kletka_model1.dart';
import 'global_pages1/ekran_glavni1.dart';
import 'global_pages1/igra_pg1.dart';
import 'utiliti1/drakoni_img1.dart';
import 'utiliti1/hranilishe1.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hranilishe1.aoaoaoGooo1();
  await DrakoniImg1.getDrakoni1();
  //Hranilishe1.hranilishe!.clear();

  final bs = Hranilishe1.hranilishe!.getInt('bs');
  if (bs == null) {
    Hranilishe1.hranilishe!.setInt('bs', 5);
    await Hranilishe1.hranilishe!.setBool('gray1', true);
    await Hranilishe1.hranilishe!.setBool('red1', true);
    await Hranilishe1.hranilishe!.setBool('green1', true);
    await Hranilishe1.hranilishe!.setBool('blue1', true);
  }
  Moneti1.startstart1();
  await Apphud.start(apiKey: 'app_hMQqtD5NH517o5jqVuA4b5fYWQC681');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyGame());
}

class MyGame extends StatelessWidget {
  final Offset? bleaaa;
  final Offset? bleaa3a;
  final Offset? ble3aaa;
  final Offset? blea4aa;
  final Offset? blea2aa;
  final Offset? blea3aa;
  final Offset? blea3afa;
  const MyGame(
      {super.key,
      this.bleaaa,
      this.bleaa3a,
      this.ble3aaa,
      this.blea4aa,
      this.blea2aa,
      this.blea3aa,
      this.blea3afa});
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Victory Cosmo Soldiers',
      initialBinding: GlavniEkranBind1(),
      theme: ThemeData(
        fontFamily: 'Popp',
        useMaterial3: true,
      ),
      home: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: GetBuilder<GlobalniC1>(builder: (_) {
            return const EkranGlavni1();
          })),
    );
  }
}
