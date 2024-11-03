import 'package:flutter/material.dart';
import 'package:flutter_master/ui/widgets/atoms/app_wrapper.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({
    super.key,
    required this.onItemDelete,
    required this.failedQuestions,
  });

  final List<String> failedQuestions;
  final ValueChanged<String> onItemDelete;

  static const _icon = Icon(Icons.sms_failed_outlined);

  @override
  Widget build(BuildContext context) => AppWrapper(
        child: ListView.builder(
          itemCount: failedQuestions.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(failedQuestions[index]),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              confirmDismiss: (direction) async {
                onItemDelete(failedQuestions[index]);
                return null;
              },
              child: ListTile(
                leading: _icon,
                title: Text(failedQuestions[index]),
              ),
            );
          },
        ),
      );
}
