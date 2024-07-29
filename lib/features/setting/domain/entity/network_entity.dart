

class NetworkEntity {
  final String? ssid;
  final String? password;
  final String? ip;
  final int? signal;

  NetworkEntity({
    this.ssid,
    this.password,
    this.ip,
    this.signal,
  });

  NetworkEntity copyWith({
    String? ssid,
    String? password,
    String? ip,
  }) {
    return NetworkEntity(
      ssid: ssid ?? this.ssid,
      password: password ?? this.password,
      ip: ip ?? this.ip,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ssid': ssid,
      'password': password,
      'ip': ip,
    };
  }

  factory NetworkEntity.fromJson(Map<String, dynamic> json) {
    return NetworkEntity(
      ssid: json['ssid'],
      password: json['password'],
      ip: json['ip'],
    );
  }
}