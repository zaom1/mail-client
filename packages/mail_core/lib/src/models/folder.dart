import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/enums.dart';

part 'folder.freezed.dart';
part 'folder.g.dart';

/// Email folder/mailbox.
@freezed
class Folder with _$Folder {
  const factory Folder({
    required String id,
    required String accountId,
    required String name,
    String? displayName,
    FolderType? folderType,
    String? parentId,
    int? uidValidity,
    int? uidNext,
    @Default(0) int messageCount,
    @Default(0) int unseenCount,
    @Default(true) bool isSubscribed,
    DateTime? lastSyncAt,
    @Default(<String>[]) List<String> children,
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) =>
      _$FolderFromJson(json);

  const Folder._();

  /// Whether this is a system folder (Inbox, Sent, Drafts, etc.)
  bool get isSystemFolder => folderType != null && folderType != FolderType.custom;

  /// Get display name, falling back to name.
  String get label => displayName ?? name;
}
