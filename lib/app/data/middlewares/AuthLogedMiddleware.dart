import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golapang_mitra/app/data/services/auth_services.dart';
import 'package:golapang_mitra/app/data/sessions/session.dart';
import 'package:golapang_mitra/app/routes/home_routes.dart';

class AuthLogedMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  bool isAuthenticated = false;

  @override
  RouteSettings? redirect(String? route) {
    Session.getToken().then((value) {
      if (value != null) {
        //  ke daftar masuk
        Get.offAllNamed('/home');
      }
    });

    // AuthServices.me().then((value) {
    //   isAuthenticated = value;
    //   if (isAuthenticated == true) {
    //     Get.offAllNamed('/home');
    //     // return const RouteSettings(name: HomeRoutes.home);
    //   }
    // });

    //   AuthServices.me().then((value) {
    //     var res = value;
    //     if (res != null) {
    //       if (res['code'] != 200) {
    //         return const RouteSettings(name: LoginRoutes.login);
    //       }
    //     } else {
    //       // Get.offAllNamed('/login');
    //       return const RouteSettings(name: LoginRoutes.login);
    //     }
    //   });
  }

  //This function will be called  before anything created we can use it to
  // change something about the page or give it new page
  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }

  //This function will be called right before the Bindings are initialized.
  // Here we can change Bindings for this page.
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return super.onBindingsStart(bindings);
  }

  //This function will be called right after the Bindings are initialized.
  // Here we can do something after  bindings created and before creating the page widget.
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    return super.onPageBuildStart(page);
  }

  // Page build and widgets of page will be shown
  @override
  Widget onPageBuilt(Widget page) {
    return super.onPageBuilt(page);
  }

  //This function will be called right after disposing all the related objects
  // (Controllers, views, ...) of the page.
  @override
  void onPageDispose() {
    super.onPageDispose();
  }
}
