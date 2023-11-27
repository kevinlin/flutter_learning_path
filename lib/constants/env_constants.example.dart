class Constants {
  // prevent instantiation
  Constants._();

  static const String supabaseServicesUrl = String.fromEnvironment(
    'SUPABASE_SERVICES_URL',
    defaultValue: '',
  );

  static const String supabaseEdgeUrl = String.fromEnvironment(
    'SUPABASE_EDGE_URL',
    defaultValue: '',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );
}
