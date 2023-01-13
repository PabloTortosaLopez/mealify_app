/// Returns `true` if `a` and `b` aren't `null` nor empty strings.
/// Otherwise, it returns false
bool areNotNullNorEmpty(String? a, String? b) =>
    a != null && b != null && a.isNotEmpty && b.isNotEmpty;
