class AdreesEntity {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? floor;

  AdreesEntity({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.email,
    this.floor,
  });
  String toString() {
    return "  $address $city  $floor";
  }
}
