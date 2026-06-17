/// Conflict resolver for sync conflicts.
class ConflictResolver {
  /// Resolve a conflict between local and remote message states.
  /// Strategy: Server wins (remote state takes precedence).
  ConflictResolution resolve({
    required Map<String, dynamic> localState,
    required Map<String, dynamic> remoteState,
  }) {
    // For now, server always wins
    return ConflictResolution(
      resolvedState: remoteState,
      wasConflict: true,
    );
  }
}

/// Result of conflict resolution.
class ConflictResolution {
  final Map<String, dynamic> resolvedState;
  final bool wasConflict;

  ConflictResolution({
    required this.resolvedState,
    required this.wasConflict,
  });
}
