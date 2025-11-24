// routes/app_pages.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelsystem/bindings/Booking_binding.dart';
import 'package:travelsystem/core/consta/nameRoute.dart';
import 'package:travelsystem/view/screen/OnboradingScreens.dart';
import 'package:travelsystem/view/screen/auth/login.dart';
import 'package:travelsystem/view/screen/homepage.dart';

import '../TestView.dart';
import '../bindings/home_binding.dart';
import '../bindings/login_binding.dart';
import '../core/middleware/mymiddleware.dart';
import '../core/middleware/route_middleware.dart';
import '../view/screen/BookingView.dart';
import '../view/screen/HomeSection.dart';

import '../view/screen/Reservations.dart';
import '../view/screen/aboutApp.dart';
import '../view/screen/auth/VerificationCodeSginup.dart';
import '../view/screen/auth/forgetpassword/ForgetPassword.dart';

import '../view/screen/auth/forgetpassword/ResetPassword.dart';
import '../view/screen/SplashScreen.dart';
import '../view/screen/auth/forgetpassword/VerificationCode.dart';
import '../view/screen/auth/sginup.dart';
import '../view/Widget/home_view.dart';
import '../view/screen/notification.dart';
import '../view/screen/page_Login.dart';
import '../view/screen/support_help.dart';
import '../view/screen/trips_page.dart';

List<GetPage<dynamic>>? getPages=[
  GetPage(name:AppRoute.SplashScreen, page: ()=>const SplashScreen(),middlewares: [
    RouteMiddleware(),
  ]),
  GetPage(name: AppRoute.onBording, page: ()=>const onBording(),
  middlewares: [
    RouteMiddleware()
  ]),
  GetPage(name: AppRoute.Login, page: ()=>Login(),
  binding: LoginBinding(),
  middlewares: [
    RouteMiddleware()
  ]),
  GetPage(name: AppRoute.SingUp, page: ()=>Sginup()),
  GetPage(name: AppRoute.CheckEmail, page: ()=>const ForgetPassword()),
  GetPage(name: AppRoute.VerificationCode, page: ()=> VerificationCode()),
  GetPage(name: AppRoute.ResetPassword, page: ()=>const ResetPassword()),
  GetPage(name: AppRoute.Homepage, page: ()=>const Homepage()),
  GetPage(name: AppRoute.VerificationCodesginup, page: ()=> const VerificationCodeSginup()),
  GetPage(name: AppRoute.notification, page: ()=>const notification()),
  GetPage(name: AppRoute.MainController, page: ()=>const HomeView(), binding: HomeBinding()),
  GetPage(name: AppRoute.Reservations, page: ()=>const Reservations(),),
  GetPage(name: AppRoute.SupportAndHelp, page: ()=>const SupportAndHelp(),),
  GetPage(name: AppRoute.AboutApp, page: ()=>const AboutApp(),),
  GetPage(
    name: AppRoute.BookingView,
    page: () => const BookingView(),
    binding: BookingBinding()
  ),
  GetPage(name: AppRoute.testview, page: () => const TestView()),
  GetPage(name: AppRoute.TripsPage, page: ()=>TripsPage())
];


