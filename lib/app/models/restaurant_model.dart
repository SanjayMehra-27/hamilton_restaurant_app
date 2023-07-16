class RestaurantModel {
  int? id;
  String? nameEn;
  String? nameAr;
  int? parentID;
  bool? isFull;
  bool? isOpen;
  int? maxQueue;
  String? longitude;
  String? latitude;
  bool? isActive;
  String? expiredDate;
  String? creadteDate;
  int? areaId;
  int? createdUser;
  String? address;
  int? maxGroup;
  String? openHour;
  String? closeHour;
  int? accountType;
  String? savedTime;
  String? logo;
  bool? manualOpen;
  bool? manualFull;
  String? qrCode;
  int? orderId;
  double? rating;
  dynamic tablesOptions;
  int? reviews;
  dynamic phone;
  int? status;
  bool? insideActive;
  bool? outsideActive;
  bool? isOpenManual;
  bool? insideFull;
  bool? outsideFull;
  int? maxInside;
  int? maxOutside;
  int? qTime;
  bool? userHold;
  int? countryID;
  dynamic cancelReasonRequired;
  String? realTimeChannel;
  int? branchOrderID;
  bool? preOrder;
  String? conditionsEn;
  String? conditionsAr;
  int? queueCost;
  bool? fastTrackEnabled;
  bool? requiredTurnUpgrade;
  int? lilouNotificationNumber;
  String? lilouNotificationMessageEn;
  String? lilouNotificationMessageAr;
  bool? allowFullListAccess;
  String? lilouCustomMessageEn;
  String? lilouCustomMessageAr;
  bool? enableQueueTags;
  bool? requiredTickets;
  bool? onlyWalkIn;
  int? vendorCategory;
  bool? pickupAvailable;
  bool? queueAvailable;
  int? serviceCharges;
  int? vat;
  int? pickupCustomerFees;
  dynamic kioskIsFull;
  dynamic kioskInsideFull;
  dynamic kioskOutsideFull;
  dynamic branchMinQ;
  dynamic insideMinQ;
  dynamic outsideMinQ;
  dynamic cityName;
  int? branchCount;
  String? foodTypeEN;
  String? foodTypeAr;

  RestaurantModel(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.parentID,
      this.isFull,
      this.isOpen,
      this.maxQueue,
      this.longitude,
      this.latitude,
      this.isActive,
      this.expiredDate,
      this.creadteDate,
      this.areaId,
      this.createdUser,
      this.address,
      this.maxGroup,
      this.openHour,
      this.closeHour,
      this.accountType,
      this.savedTime,
      this.logo,
      this.manualOpen,
      this.manualFull,
      this.qrCode,
      this.orderId,
      this.rating,
      this.tablesOptions,
      this.reviews,
      this.phone,
      this.status,
      this.insideActive,
      this.outsideActive,
      this.isOpenManual,
      this.insideFull,
      this.outsideFull,
      this.maxInside,
      this.maxOutside,
      this.qTime,
      this.userHold,
      this.countryID,
      this.cancelReasonRequired,
      this.realTimeChannel,
      this.branchOrderID,
      this.preOrder,
      this.conditionsEn,
      this.conditionsAr,
      this.queueCost,
      this.fastTrackEnabled,
      this.requiredTurnUpgrade,
      this.lilouNotificationNumber,
      this.lilouNotificationMessageEn,
      this.lilouNotificationMessageAr,
      this.allowFullListAccess,
      this.lilouCustomMessageEn,
      this.lilouCustomMessageAr,
      this.enableQueueTags,
      this.requiredTickets,
      this.onlyWalkIn,
      this.vendorCategory,
      this.pickupAvailable,
      this.queueAvailable,
      this.serviceCharges,
      this.vat,
      this.pickupCustomerFees,
      this.kioskIsFull,
      this.kioskInsideFull,
      this.kioskOutsideFull,
      this.branchMinQ,
      this.insideMinQ,
      this.outsideMinQ,
      this.cityName,
      this.branchCount,
      this.foodTypeEN,
      this.foodTypeAr});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    parentID = json['parentID'];
    isFull = json['isFull'];
    isOpen = json['isOpen'];
    maxQueue = json['maxQueue'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    isActive = json['isActive'];
    expiredDate = json['expiredDate'];
    creadteDate = json['creadteDate'];
    areaId = json['areaId'];
    createdUser = json['createdUser'];
    address = json['address'];
    maxGroup = json['maxGroup'];
    openHour = json['openHour'];
    closeHour = json['closeHour'];
    accountType = json['accountType'];
    savedTime = json['savedTime'];
    logo = json['logo'];
    manualOpen = json['manualOpen'];
    manualFull = json['manualFull'];
    qrCode = json['qrCode'];
    orderId = json['orderId'];
    rating = json['rating'] != null ? json['rating'].toDouble() : null;
    tablesOptions = json['tablesOptions'];
    reviews = json['reviews'];
    phone = json['phone'];
    status = json['status'];
    insideActive = json['insideActive'];
    outsideActive = json['outsideActive'];
    isOpenManual = json['isOpenManual'];
    insideFull = json['insideFull'];
    outsideFull = json['outsideFull'];
    maxInside = json['maxInside'];
    maxOutside = json['maxOutside'];
    qTime = json['qTime'];
    userHold = json['userHold'];
    countryID = json['countryID'];
    cancelReasonRequired = json['cancelReasonRequired'];
    realTimeChannel = json['realTimeChannel'];
    branchOrderID = json['branchOrderID'];
    preOrder = json['preOrder'];
    conditionsEn = json['conditionsEn'];
    conditionsAr = json['conditionsAr'];
    queueCost = json['QueueCost'];
    fastTrackEnabled = json['FastTrackEnabled'];
    requiredTurnUpgrade = json['RequiredTurnUpgrade'];
    lilouNotificationNumber = json['LilouNotificationNumber'];
    lilouNotificationMessageEn = json['LilouNotificationMessageEn'];
    lilouNotificationMessageAr = json['LilouNotificationMessageAr'];
    allowFullListAccess = json['AllowFullListAccess'];
    lilouCustomMessageEn = json['LilouCustomMessageEn'];
    lilouCustomMessageAr = json['LilouCustomMessageAr'];
    enableQueueTags = json['EnableQueueTags'];
    requiredTickets = json['RequiredTickets'];
    onlyWalkIn = json['OnlyWalkIn'];
    vendorCategory = json['VendorCategory'];
    pickupAvailable = json['PickupAvailable'];
    queueAvailable = json['QueueAvailable'];
    serviceCharges = json['ServiceCharges'];
    vat = json['Vat'];
    pickupCustomerFees = json['PickupCustomerFees'];
    kioskIsFull = json['KioskIsFull'];
    kioskInsideFull = json['KioskInsideFull'];
    kioskOutsideFull = json['KioskOutsideFull'];
    branchMinQ = json['BranchMinQ'];
    insideMinQ = json['InsideMinQ'];
    outsideMinQ = json['OutsideMinQ'];
    cityName = json['cityName'];
    branchCount = json['branchCount'];
    foodTypeEN = json['foodTypeEN'];
    foodTypeAr = json['foodTypeAr'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    data['parentID'] = parentID;
    data['isFull'] = isFull;
    data['isOpen'] = isOpen;
    data['maxQueue'] = maxQueue;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['isActive'] = isActive;
    data['expiredDate'] = expiredDate;
    data['creadteDate'] = creadteDate;
    data['areaId'] = areaId;
    data['createdUser'] = createdUser;
    data['address'] = address;
    data['maxGroup'] = maxGroup;
    data['openHour'] = openHour;
    data['closeHour'] = closeHour;
    data['accountType'] = accountType;
    data['savedTime'] = savedTime;
    data['logo'] = logo;
    data['manualOpen'] = manualOpen;
    data['manualFull'] = manualFull;
    data['qrCode'] = qrCode;
    data['orderId'] = orderId;
    data['rating'] = rating;
    data['tablesOptions'] = tablesOptions;
    data['reviews'] = reviews;
    data['phone'] = phone;
    data['status'] = status;
    data['insideActive'] = insideActive;
    data['outsideActive'] = outsideActive;
    data['isOpenManual'] = isOpenManual;
    data['insideFull'] = insideFull;
    data['outsideFull'] = outsideFull;
    data['maxInside'] = maxInside;
    data['maxOutside'] = maxOutside;
    data['qTime'] = qTime;
    data['userHold'] = userHold;
    data['countryID'] = countryID;
    data['cancelReasonRequired'] = cancelReasonRequired;
    data['realTimeChannel'] = realTimeChannel;
    data['branchOrderID'] = branchOrderID;
    data['preOrder'] = preOrder;
    data['conditionsEn'] = conditionsEn;
    data['conditionsAr'] = conditionsAr;
    data['QueueCost'] = queueCost;
    data['FastTrackEnabled'] = fastTrackEnabled;
    data['RequiredTurnUpgrade'] = requiredTurnUpgrade;
    data['LilouNotificationNumber'] = lilouNotificationNumber;
    data['LilouNotificationMessageEn'] = lilouNotificationMessageEn;
    data['LilouNotificationMessageAr'] = lilouNotificationMessageAr;
    data['AllowFullListAccess'] = allowFullListAccess;
    data['LilouCustomMessageEn'] = lilouCustomMessageEn;
    data['LilouCustomMessageAr'] = lilouCustomMessageAr;
    data['EnableQueueTags'] = enableQueueTags;
    data['RequiredTickets'] = requiredTickets;
    data['OnlyWalkIn'] = onlyWalkIn;
    data['VendorCategory'] = vendorCategory;
    data['PickupAvailable'] = pickupAvailable;
    data['QueueAvailable'] = queueAvailable;
    data['ServiceCharges'] = serviceCharges;
    data['Vat'] = vat;
    data['PickupCustomerFees'] = pickupCustomerFees;
    data['KioskIsFull'] = kioskIsFull;
    data['KioskInsideFull'] = kioskInsideFull;
    data['KioskOutsideFull'] = kioskOutsideFull;
    data['BranchMinQ'] = branchMinQ;
    data['InsideMinQ'] = insideMinQ;
    data['OutsideMinQ'] = outsideMinQ;
    data['cityName'] = cityName;
    data['branchCount'] = branchCount;
    data['foodTypeEN'] = foodTypeEN;
    data['foodTypeAr'] = foodTypeAr;
    return data;
  }
}
