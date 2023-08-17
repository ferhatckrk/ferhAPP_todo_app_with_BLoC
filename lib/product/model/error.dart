class RepoError {
  final String errorMessage;
  RepoError({
    required this.errorMessage,
  });

  RepoError copyWith({
    String? errorMessage,
  }) {
    return RepoError(
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'errorMessage': errorMessage,
    };
  }

  factory RepoError.fromJson(Map<String, dynamic> map) {
    return RepoError(
      errorMessage: map['errorMessage'] as String,
    );
  }
}
