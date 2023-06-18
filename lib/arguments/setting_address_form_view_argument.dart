import 'package:mobile_flutter/models/user_model.dart';

class SettingAddressFormViewArgument {
  final bool isEditAddress;
  final UserAddress address;

  const SettingAddressFormViewArgument({required this.isEditAddress, required this.address});
}