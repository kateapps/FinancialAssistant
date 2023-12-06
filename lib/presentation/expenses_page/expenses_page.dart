import 'package:financial_assistant/core/app_export.dart';
import 'package:financial_assistant/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../data/data_manager.dart';
import '../../models/wallet_model.dart';
import '../../widgets/wallet_changes_widget.dart';

class ExpensesPage extends StatefulWidget {
  ExpensesPage({Key? key})
      : super(
    key: key,
  );

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}



class _ExpensesPageState extends State<ExpensesPage> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  late Future<double> totalExpensesFuture;
  late List<WalletChangeData> expensesDataList;

  @override
  void initState() {
    super.initState();
    Refresh();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WalletChangesWidget(
      title: "Total expenses amount",
      emptyPrimaryInfoText: "No information on expenses yet",
      emptySecondaryInfoText: "Click on the \"Add expenses\" button",
      emptyButtonText: "Add Expenses",
      walletChangeList: expensesDataList,
      totalFuture: totalExpensesFuture,
      positive: false,
      onTap: () async {
        await Navigator.pushNamed(context, AppRoutes.expensesAddScreen).then(
              (value) => Refresh(),
        );
      },
    );
  }

  void Refresh() {
    totalExpensesFuture = DataManager.getTotalExpenses();
    expensesDataList = DataManager.data.expensesData;
    setState(() {});
  }
}
