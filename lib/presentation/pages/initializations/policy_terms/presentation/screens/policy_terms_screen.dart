import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ninedots/core/common/widgets/app_bars/custom_app_bar.dart' as mine;
import 'package:ninedots/core/common/widgets/app_bars/registration_app_bar.dart';
import 'package:ninedots/core/common/widgets/loading_widget.dart';
import 'package:ninedots/presentation/pages/initializations/policy_terms/presentation/providers/policy_terms_provider.dart';

@RoutePage()
class WebScreen extends ConsumerWidget {
  const WebScreen({
    required this.url,
    required this.title,
    this.canBack = true,
    super.key,
  });
  final String url;
  final String title;
  final bool canBack;

  get provider => policyTermsStateProvider(url);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue screenState = ref.watch(provider);

    return PopScope(
      canPop: canBack,
      child: Scaffold(
        drawer: canBack ? null : Container(),
        appBar: canBack
          ? RegistrationAppBar(title: title).build(context)
          : mine.CustomAppBar(
          title: title,
          leading: mine.CustomAppBarLeadingButton(
            leadingType: mine.LeadingType.drawer,
            onPress: () {},
          ),
        ).build(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ref.read(provider.notifier).webViewWidget,
                  Visibility(
                    visible: screenState.isLoading,
                    child: const LoadingWidget(),
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
