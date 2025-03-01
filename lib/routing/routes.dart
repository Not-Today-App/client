abstract final class AppRoutes {
  // Base paths
  static const menuView = '/';
  static const loginView = '/login';
  static const registerView = '/register';
  static const addictionsView = '/addictions';
  static const diariesView = '/diaries';
  static const profileView = '/profile';

  // Relative paths
  static const addictionViewRelative = ':name';
  static const profileSettingsViewRelative = 'settings';
  static const diaryViewRelative = ':id';

  // Helper methods for constructing paths
  static String addictionWithName(String name) => '$addictionsView/$name';
  static String diaryWithId(String id) => '$diariesView/$id';
  static String profileSettings() =>
      '$profileView/$profileSettingsViewRelative';
}
