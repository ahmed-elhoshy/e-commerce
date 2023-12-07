/// value : "0101070000"
/// msg : "accept only egypt phone numbers"
/// param : "phone"
/// location : "body"

class Error {
  Error({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  Error.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  String? value;
  String? msg;
  String? param;
  String? location;

  Error copyWith({
    String? value,
    String? msg,
    String? param,
    String? location,
  }) =>
      Error(
        value: value ?? this.value,
        msg: msg ?? this.msg,
        param: param ?? this.param,
        location: location ?? this.location,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }
}
