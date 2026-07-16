/// The build flavors this app ships in.
///
/// The name of each value is kept in sync with the Android product flavor and
/// the iOS scheme (`dev` / `prod`) so a single `--flavor` argument works on both
/// platforms.
enum Flavor { dev, prod }
