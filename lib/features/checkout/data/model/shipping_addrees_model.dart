import 'package:fruits_hub/features/checkout/domain/entity/adrees_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? floor;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.email,
    this.floor,
  });
  factory ShippingAddressModel.fromEntity(AdreesEntity entity) {
    return ShippingAddressModel(
      address: entity.address,
      city: entity.city,
      floor: entity.floor,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
    );
  }
  String toString() {
    return "  $address $city  $floor";
  }

  toJson() {
    return {
      "address": address,
      "city": city,
      "floor": floor,
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}
