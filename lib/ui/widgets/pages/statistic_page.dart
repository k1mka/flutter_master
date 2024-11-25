import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/core/theme/palette.dart';
import 'package:flutter_master/ui/widgets/atoms/app_wrapper.dart';
import 'package:flutter_master/ui/widgets/tokens/spacings.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({
    super.key,
    required this.onItemDelete,
    required this.failedQuestions,
  });

  final List<String> failedQuestions;
  final ValueChanged<String> onItemDelete;

  static const _icon = Icon(Icons.sms_failed_outlined);
  static const _deleteIcon = Icon(Icons.delete, color: Palette.white);

  void copyQuestion(String question) =>
      Clipboard.setData(ClipboardData(text: question));

  @override
  Widget build(BuildContext context) => AppWrapper(
        child: ListView.builder(
          itemCount: failedQuestions.length,
          itemBuilder: (context, index) {
            final question = failedQuestions[index];
            return Dismissible(
              key: ValueKey(question),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Palette.redColor,
                padding: Spacings.paddingH20,
                alignment: Alignment.centerRight,
                child: _deleteIcon,
              ),
              confirmDismiss: (direction) async {
                onItemDelete(question);
                return null;
              },
              child: ListTile(
                leading: _icon,
                title: Text(question),
                onTap: () {
                  copyQuestion(question);
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content:
                          Text('${context.s.copied_to_clipboard} $question'),
                    ));
                },
              ),
            );
          },
        ),
      );
}
