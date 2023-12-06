import 'package:financial_assistant/data/data_manager.dart';
import 'package:financial_assistant/models/wallet_model.dart';
import 'package:financial_assistant/widgets/wallet_changes_widget.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class IncomesPage extends StatefulWidget {
  IncomesPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<IncomesPage> createState() => _IncomesPageState();
}

class _IncomesPageState extends State<IncomesPage> {
  late Future<double> totalIncomeFuture;
  late List<WalletChangeData> incomeDataList;

  @override
  void initState() {
    super.initState();
    Refresh();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize once
    return WalletChangesWidget(
      title: "Total income amount",
      emptyPrimaryInfoText: "No information on income yet",
      emptySecondaryInfoText: "Click on the \"Add income\" button",
      emptyButtonText: "Add Income",
      walletChangeList: incomeDataList,
      totalFuture: totalIncomeFuture,
      onTap: () async {
        await Navigator.pushNamed(context, AppRoutes.incomeAddScreen).then(
          (value) => Refresh(),
        );
      },
    );
  }

  void Refresh() {
    totalIncomeFuture = DataManager.getTotalIncomes();
    incomeDataList = DataManager.data.incomesData;
    setState(() {});
  }
}
