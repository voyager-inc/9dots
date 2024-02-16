import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ninedots/core/common/widgets/progress_indicator.dart' as mine;
import 'package:ninedots/core/common/widgets/app_bars/registration_app_bar.dart';
import 'package:ninedots/core/common/widgets/simple_text_button.dart';
import 'package:ninedots/core/constants/app_colors.dart';
import 'package:ninedots/core/constants/app_strings.dart';
import 'package:ninedots/core/extensions/extensions.dart';
import 'package:ninedots/core/router/app_route.dart';
import 'package:ninedots/gen/assets.gen.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: RegistrationAppBar(
          leading: false,
          title: "registration.navTitleRegistration".tr(),
        ).build(context),
        body: Stack(
          children: [
            const mine.ProgressIndicator(current: 1, max: 4),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: 120.topPadding,
                          height: 200.resize,
                          width: 500.resize,
                          child: Center(child: Assets.images.glamoG4.image()),
                        ),
                        Padding(
                          padding: 90.topPadding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "registration.introduction".tr().text.regular.s28
                                  .c(AppColors.primaryBlue),
                            ],
                          ),
                        ),
                        Padding(
                          padding: 30.horizontalPadding,
                          child: Row(
                            children: [
                              Flexible(
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle().regular.s28
                                          .c(AppColors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "registration.msgIntro1".tr(),
                                          style: const TextStyle().s28,
                                        ),
                                        TextSpan(
                                          text: "registration.msgIntro2".tr(),
                                          style: const TextStyle().s28,
                                        ),
                                        TextSpan(
                                          text: "registration.msgIntro3".tr(),
                                          style: const TextStyle().s28.bold,
                                        ),
                                        TextSpan(
                                          text: "registration.msgIntro4".tr(),
                                          style: const TextStyle().s28,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: 40.topPadding,
                          child: SizedBox(
                            width: 500.resize,
                            height: 100.resize,
                            child: Assets.images.logoRegister.image(),
                          ),
                        ),
                        Padding(
                          padding: [30, 54].padding,
                          child: Row(
                            children: [
                              Flexible(
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle().regular.s28.c(AppColors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => context.pushRoute(
                                                WebRoute(
                                                  url: AppStrings.urls.termsOfUseUrl,
                                                  title: "term.navTitleTemsOfUse".tr(),
                                                  canBack: true,
                                                ),
                                            ),
                                          text: "registration.temsOfService".tr(),
                                          style: const TextStyle().s28.u
                                              .c(AppColors.primaryBlue),
                                        ),
                                        TextSpan(
                                          text: "registration.and".tr(),
                                          style: const TextStyle().s28,
                                        ),
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => context.pushRoute(
                                              WebRoute(
                                                url: AppStrings.urls.privacyPolicyUrl,
                                                title: "policy.navTitlePolicy".tr(),
                                                canBack: true,
                                              ),
                                            ),
                                          text: "registration.privacyPolicy".tr(),
                                          style: const TextStyle().s28.u
                                              .c(AppColors.primaryBlue),
                                        ),
                                        TextSpan(
                                          text: "registration.msgTemsAndPolicy".tr(),
                                          style: const TextStyle().s28,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: 30.horizontalPadding,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  _isCheck = !_isCheck;
                                });
                              },
                              child: Container(
                                padding: 4.allPadding,
                                width: 60.resize,
                                height: 60.resize,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.grey,
                                    style: BorderStyle.solid,
                                    width: 2.resize,
                                  ),
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16.resize),
                                ),
                                child: _isCheck
                                    ? Assets.images.checkBox.image()
                                    : const SizedBox.shrink(),
                              ),
                            ),
                            SizedBox(width: 20.resize),
                            Flexible(
                              child: "registration.msgAgreeTemsAndPolicy".tr()
                                  .text.s28,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.resize),
                      SimpleTextButton(
                        label: "registration.btnNext".tr(),
                        enable: _isCheck,
                        onPress: () {
                          // Navigator.of(context).push(
                          //             CupertinoPageRoute(
                          //                 builder: (context) => NfcScreen()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
