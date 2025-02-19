abstract final class AppRoutes {
  // Base paths
  static const menuView = '/';
  static const loginView = '/login';
  static const addictionsView = '/addictions';
  static const diariesView = '/diaries';
  static const profileView = '/profile';

  // Relative paths
  static const addictionViewRelative = ':name';

  // Helper methods for constructing paths
  static String addictionWithName(String name) => '$addictionsView/$name';
}
