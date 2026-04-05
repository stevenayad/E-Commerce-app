/// Extracts user-facing error text from Django REST Framework and similar JSON bodies.
String? parseBackendErrorMessage(dynamic data) {
  if (data == null) return null;
  if (data is String && data.trim().isNotEmpty) return data.trim();

  if (data is Map<String, dynamic>) {
    if (data['message'] is String) return data['message'] as String;
    if (data['error'] is String) return data['error'] as String;
    if (data['error'] is Map && (data['error'] as Map)['message'] is String) {
      return (data['error'] as Map)['message'] as String;
    }
    if (data['detail'] is String) return data['detail'] as String;
    if (data['detail'] is List && (data['detail'] as List).isNotEmpty) {
      final first = (data['detail'] as List).first;
      if (first is String) return first;
    }
    if (data['non_field_errors'] is List &&
        (data['non_field_errors'] as List).isNotEmpty) {
      final first = (data['non_field_errors'] as List).first;
      if (first is String) return first;
    }
    if (data['errors'] is Map) {
      final map = data['errors'] as Map;
      for (final value in map.values) {
        if (value is List && value.isNotEmpty && value.first is String) {
          return value.first as String;
        }
        if (value is String) return value;
      }
    }
  }
  return null;
}

double parsePriceToDouble(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}
