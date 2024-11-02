import 'package:flutter/material.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/core/theme/text_styles.dart';
import 'package:flutter_master/gen/assets.gen.dart';
import 'package:flutter_master/ui/widgets/atoms/app_wrapper.dart';
import 'package:flutter_master/ui/widgets/atoms/custom_button.dart';
import 'package:flutter_master/ui/widgets/tokens/spacings.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required this.onSignIn});

  final VoidCallback onSignIn;

  static const _logoSize = 200.0;
  static const _spacer = Spacer();

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _spacer,
          Image.asset(
            Assets.images.png.dartBird.path,
            height: _logoSize,
            width: _logoSize,
          ),
          Padding(
            padding: Spacings.paddingV16,
            child: Text(context.s.welcome_to_flutter_master, style: TextStyles.bigStyle),
          ),
          Text(
            context.s.to_launch_the_application_please_click_on_the_anonymous_login_button,
            style: TextStyles.mediumStyle,
            textAlign: TextAlign.center,
          ),
          _spacer,
          CustomButton(
            onPressed: onSignIn,
            text: context.s.log_in_anonymously,
          ),
        ],
      ),
    );
  }
}
