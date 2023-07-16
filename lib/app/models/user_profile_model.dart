class UserProfileModel {
  int? clientId;
  String? clientName;
  String? clientPhone;
  dynamic createdDate;
  bool? clientStatus;
  dynamic clientGender;
  String? password;
  String? mail;
  dynamic birthDate;
  dynamic points;
  dynamic longitude;
  dynamic latitude;
  int? country;
  dynamic savedTime;
  dynamic createdMethod;
  dynamic userId;
  dynamic restId;
  dynamic lastSeen;
  dynamic avatar;
  dynamic activationStep;
  dynamic walletBalance;
  dynamic realTimeChannel;
  dynamic freeQueue;
  dynamic subscription;
  dynamic subscriptionExpiredOn;
  dynamic totalQueue;
  bool? addedFreeQueue;
  dynamic loginPassword;
  bool? hasApp;
  dynamic carno;
  dynamic cardetails;
  dynamic oTP;
  dynamic online;
  int? id;
  int? userid;
  String? username;
  dynamic bio;
  List<Setting>? setting;
  Connections? connections;
  Connections? userconnections;
  Followlist? followlist;

  UserProfileModel(
      {this.clientId,
      this.clientName,
      this.clientPhone,
      this.createdDate,
      this.clientStatus,
      this.clientGender,
      this.password,
      this.mail,
      this.birthDate,
      this.points,
      this.longitude,
      this.latitude,
      this.country,
      this.savedTime,
      this.createdMethod,
      this.userId,
      this.restId,
      this.lastSeen,
      this.avatar,
      this.activationStep,
      this.walletBalance,
      this.realTimeChannel,
      this.freeQueue,
      this.subscription,
      this.subscriptionExpiredOn,
      this.totalQueue,
      this.addedFreeQueue,
      this.loginPassword,
      this.hasApp,
      this.carno,
      this.cardetails,
      this.oTP,
      this.online,
      this.id,
      this.userid,
      this.username,
      this.bio,
      this.setting,
      this.connections,
      this.userconnections,
      this.followlist});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
    clientPhone = json['client_phone'];
    createdDate = json['created_date'];
    clientStatus = json['client_status'];
    clientGender = json['client_gender'];
    password = json['password'];
    mail = json['mail'];
    birthDate = json['birthDate'];
    points = json['points'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    country = json['country'];
    savedTime = json['savedTime'];
    createdMethod = json['createdMethod'];
    userId = json['userId'];
    restId = json['restId'];
    lastSeen = json['lastSeen'];
    avatar = json['avatar'];
    activationStep = json['activationStep'];
    walletBalance = json['walletBalance'];
    realTimeChannel = json['realTimeChannel'];
    freeQueue = json['freeQueue'];
    subscription = json['subscription'];
    subscriptionExpiredOn = json['subscriptionExpiredOn'];
    totalQueue = json['totalQueue'];
    addedFreeQueue = json['AddedFreeQueue'];
    loginPassword = json['LoginPassword'];
    hasApp = json['hasApp'];
    carno = json['carno'];
    cardetails = json['Cardetails'];
    oTP = json['OTP'];
    online = json['online'];
    id = json['id'];
    userid = json['Userid'];
    username = json['Username'];
    bio = json['Bio'];
    if (json['setting'] != null) {
      setting = <Setting>[];
      json['setting'].forEach((v) {
        setting?.add(Setting.fromJson(v));
      });
    }
    connections = json['connections'] != null
        ? Connections?.fromJson(json['connections'])
        : null;
    userconnections = json['userconnections'] != null
        ? Connections?.fromJson(json['userconnections'])
        : null;
    followlist = json['followlist'] != null
        ? Followlist?.fromJson(json['followlist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['client_id'] = clientId;
    data['client_name'] = clientName;
    data['client_phone'] = clientPhone;
    data['created_date'] = createdDate;
    data['client_status'] = clientStatus;
    data['client_gender'] = clientGender;
    data['password'] = password;
    data['mail'] = mail;
    data['birthDate'] = birthDate;
    data['points'] = points;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['country'] = country;
    data['savedTime'] = savedTime;
    data['createdMethod'] = createdMethod;
    data['userId'] = userId;
    data['restId'] = restId;
    data['lastSeen'] = lastSeen;
    data['avatar'] = avatar;
    data['activationStep'] = activationStep;
    data['walletBalance'] = walletBalance;
    data['realTimeChannel'] = realTimeChannel;
    data['freeQueue'] = freeQueue;
    data['subscription'] = subscription;
    data['subscriptionExpiredOn'] = subscriptionExpiredOn;
    data['totalQueue'] = totalQueue;
    data['AddedFreeQueue'] = addedFreeQueue;
    data['LoginPassword'] = loginPassword;
    data['hasApp'] = hasApp;
    data['carno'] = carno;
    data['Cardetails'] = cardetails;
    data['OTP'] = oTP;
    data['online'] = online;
    data['id'] = id;
    data['Userid'] = userid;
    data['Username'] = username;
    data['Bio'] = bio;
    if (setting != null) {
      data['setting'] = setting?.map((v) => v.toJson()).toList();
    }
    if (connections != null) {
      data['connections'] = connections?.toJson();
    }
    if (userconnections != null) {
      data['userconnections'] = userconnections?.toJson();
    }
    if (followlist != null) {
      data['followlist'] = followlist?.toJson();
    }
    return data;
  }
}

class Setting {
  int? id;
  String? country;
  String? language;
  int? termOfCondition;
  int? chatMessages;
  int? notificationSound;
  int? profilePrivate;
  int? queueVisible;
  int? myOrder;
  int? seated;
  int? chatPrivicy;
  int? commentFromAnyone;
  int? notification;
  int? userID;

  Setting(
      {this.id,
      this.country,
      this.language,
      this.termOfCondition,
      this.chatMessages,
      this.notificationSound,
      this.profilePrivate,
      this.queueVisible,
      this.myOrder,
      this.seated,
      this.chatPrivicy,
      this.commentFromAnyone,
      this.notification,
      this.userID});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['Country'];
    language = json['language'];
    termOfCondition = json['Term_Of_Condition'];
    chatMessages = json['Chat_Messages'];
    notificationSound = json['Notification_Sound'];
    profilePrivate = json['Profile_Private'];
    queueVisible = json['Queue_visible'];
    myOrder = json['my_Order'];
    seated = json['Seated'];
    chatPrivicy = json['Chat_Privicy'];
    commentFromAnyone = json['Comment_From_Anyone'];
    notification = json['Notification'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['Country'] = country;
    data['language'] = language;
    data['Term_Of_Condition'] = termOfCondition;
    data['Chat_Messages'] = chatMessages;
    data['Notification_Sound'] = notificationSound;
    data['Profile_Private'] = profilePrivate;
    data['Queue_visible'] = queueVisible;
    data['my_Order'] = myOrder;
    data['Seated'] = seated;
    data['Chat_Privicy'] = chatPrivicy;
    data['Comment_From_Anyone'] = commentFromAnyone;
    data['Notification'] = notification;
    data['UserID'] = userID;
    return data;
  }
}

class Connections {
  int? followList;
  int? blockList;
  int? muteList;

  Connections({this.followList, this.blockList, this.muteList});

  Connections.fromJson(Map<String, dynamic> json) {
    followList = json['follow_list'];
    blockList = json['block_list'];
    muteList = json['mute_list'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['follow_list'] = followList;
    data['block_list'] = blockList;
    data['mute_list'] = muteList;
    return data;
  }
}

class Followlist {
  int? following;
  int? follower;

  Followlist({this.following, this.follower});

  Followlist.fromJson(Map<String, dynamic> json) {
    following = json['following'];
    follower = json['follower'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['following'] = following;
    data['follower'] = follower;
    return data;
  }
}
