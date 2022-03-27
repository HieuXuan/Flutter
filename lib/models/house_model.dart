class HouseModel {
  String houseid;
  String name;
  String images;
  String houseimg;
  String address;
  String bds;
  String baths;
  String sqft;
  String prices;

  HouseModel(
      {this.houseid,
      this.name,
      this.images,
      this.houseimg,
      this.address,
      this.bds,
      this.baths,
      this.sqft,
      this.prices});

  // receiving data from server
  factory HouseModel.fromMap(map) {
    return HouseModel(
      houseid: map['houseid'],
      name: map['name'],
      images: map['images'],
      houseimg: map['houseimg'],
      address: map['address'],
      bds: map['bds'],
      baths: map['baths'],
      sqft: map['sqft'],
      prices: map['prices'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'houseid': houseid,
      'name': name,
      'images': images,
      'houseimg': houseimg,
      'address': address,
      'bds': bds,
      'baths': baths,
      'sqft': sqft,
      'prices': prices,
    };
  }
}
