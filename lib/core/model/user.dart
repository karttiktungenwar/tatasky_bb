final class User {
  final String deviceModel;
  final String version;
  final String checkVersion;
  final String client;
  final String syncDate;
  final String entityId;
  final String versionCode;
  final String userNumber;
  final String syncCheck;
  final String apiType;

  User({
    required this.deviceModel,
    required this.version,
    required this.checkVersion,
    required this.client,
    required this.syncDate,
    required this.entityId,
    required  this.versionCode,
    required this.userNumber,
    required this.syncCheck,
    required this.apiType});

  factory User.fromJson(Map<String, dynamic> json) => User(
      deviceModel : json['deviceModel'] as String,
      version : json['version'] as String,
      checkVersion : json['checkVersion'] as String,
      client : json['client'] as String,
      syncDate : json['syncDate'] as String,
      entityId : json['entityId'] as String,
      versionCode : json['versionCode'] as String,
      userNumber : json['userNumber'] as String,
      syncCheck : json['syncCheck'] as String,
      apiType : json['APIType'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'deviceModel' : deviceModel,
    'version' : version ,
    'checkVersion' : checkVersion ,
    'client' : client ,
    'syncDate' : syncDate ,
    'entityId' : entityId ,
    'versionCode' : versionCode ,
    'userNumber' : userNumber ,
    'syncCheck' : syncCheck ,
    'APIType' : apiType ,
  };
}