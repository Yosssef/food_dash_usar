import 'package:hive_ce/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserSettings extends HiveObject {
  @HiveField(0)
  bool isDark;

  @HiveField(1)
  String languageCode;

  @HiveField(2)
  bool hasCompletedOnboarding;

  @HiveField(3)
  String? userToken;

  @HiveField(4)
  String? userName;

  @HiveField(5)
  String? userEmail;

  @HiveField(6)
  String? userProfileImagePath;

  UserSettings({
    this.isDark = false,
    this.languageCode = 'en',
    this.hasCompletedOnboarding = false,
    this.userToken,
    this.userName,
    this.userEmail,
    this.userProfileImagePath,
  });

  UserSettings copyWith({
    bool? isDark,
    String? languageCode,
    bool? hasCompletedOnboarding,
    String? userToken,
    bool clearUserToken = false,
    String? userName,
    bool clearUserName = false,
    String? userEmail,
    bool clearUserEmail = false,
    String? userProfileImagePath,
    bool clearUserProfileImagePath = false,
  }) {
    return UserSettings(
      isDark: isDark ?? this.isDark,
      languageCode: languageCode ?? this.languageCode,
      hasCompletedOnboarding:
          hasCompletedOnboarding ?? this.hasCompletedOnboarding,
      userToken: clearUserToken ? null : (userToken ?? this.userToken),
      userName: clearUserName ? null : (userName ?? this.userName),
      userEmail: clearUserEmail ? null : (userEmail ?? this.userEmail),
      userProfileImagePath: clearUserProfileImagePath
          ? null
          : (userProfileImagePath ?? this.userProfileImagePath),
    );
  }
}
