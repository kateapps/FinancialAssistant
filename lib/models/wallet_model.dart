import 'dart:convert';

class WalletModel {
  double totalBalance;
  List<WalletChangeData> incomesData;
  List<WalletChangeData> expensesData;

  WalletModel({
    required this.totalBalance,
    required this.incomesData,
    required this.expensesData,
  });

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() {
    return {
      'totalBalance': totalBalance,
      'incomesData': incomesData.map((data) => data.toJson()).toList(),
      'expensesData': expensesData.map((data) => data.toJson()).toList(),
    };
  }

  // Метод для десериализации из JSON
  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      totalBalance: json['totalBalance'],
      incomesData: (json['incomesData'] as List).map((data) => WalletChangeData.fromJson(data)).toList(),
      expensesData: (json['expensesData'] as List).map((data) => WalletChangeData.fromJson(data)).toList(),
    );
  }
}

class WalletChangeData {
  double changeValue;
  String changeDescription;
  DateTime dateTime;

  WalletChangeData({
    required this.changeValue,
    required this.changeDescription,
    required this.dateTime,
  });

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() {
    return {
      'changeValue': changeValue,
      'changeDescription': changeDescription,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  // Метод для десериализации из JSON
  factory WalletChangeData.fromJson(Map<String, dynamic> json) {
    return WalletChangeData(
      changeValue: json['changeValue'],
      changeDescription: json['changeDescription'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}