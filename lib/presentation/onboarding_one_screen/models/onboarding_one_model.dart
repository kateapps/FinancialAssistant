// ignore_for_file: must_be_immutable

import 'thirteen_item_model.dart';

/// This class defines the variables used in the [onboarding_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingOneModel  {
  OnboardingOneModel({this.thirteenItemList = const []}) {}

  List<ThirteenItemModel> thirteenItemList;

  OnboardingOneModel copyWith({List<ThirteenItemModel>? thirteenItemList}) {
    return OnboardingOneModel(
      thirteenItemList: thirteenItemList ?? this.thirteenItemList,
    );
  }

  @override
  List<Object?> get props => [thirteenItemList];
}
