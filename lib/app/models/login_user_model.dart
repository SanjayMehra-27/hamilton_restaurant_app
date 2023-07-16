class UserModel {
  String? clientName;
  String? mail;
  int? country;
  bool? clientStatus;
  String? clientPhone;
  String? clientGender;
  int? clientId;

  UserModel(
      {this.clientName,
      this.mail,
      this.country,
      this.clientStatus,
      this.clientPhone,
      this.clientGender,
      this.clientId});

  UserModel.fromJson(Map<String, dynamic> json) {
    clientName = json['client_name'] ?? "";
    mail = json['mail'] ?? "";
    country = json['country'] ?? 0;
    clientStatus = json['client_status'] ?? false;
    clientPhone = json['client_phone'] ?? "";
    clientGender = json['client_gender'];
    clientId = json['client_id'] ?? 0;
  }
}
