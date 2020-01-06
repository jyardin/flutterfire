// Copyright 2017, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of cloud_firestore;

enum _FieldPathType {
  documentId,
  path,
}

/// A [FieldPath] refers to a field in a document.
class FieldPath {
  final List<String> segments;

  const FieldPath._(this.type, this.segments);

  factory FieldPath.fromSegments(List<String> segments) => FieldPath._(_FieldPathType.path, segments);

  @visibleForTesting
  final _FieldPathType type;

  /// The path to the document id, which can be used in queries.
  static FieldPath get documentId =>
      const FieldPath._(_FieldPathType.documentId, ['__name__']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FieldPath &&
              runtimeType == other.runtimeType &&
              type == other.type;

  @override
  int get hashCode => type.hashCode;

}
