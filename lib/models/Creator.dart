/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Creator type in your schema. */
@immutable
class Creator extends Model {
  static const classType = const _CreatorModelType();
  final String id;
  final List<Audio>? _audioUploads;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  List<Audio>? get audioUploads {
    return _audioUploads;
  }
  
  const Creator._internal({required this.id, audioUploads}): _audioUploads = audioUploads;
  
  factory Creator({String? id, List<Audio>? audioUploads}) {
    return Creator._internal(
      id: id == null ? UUID.getUUID() : id,
      audioUploads: audioUploads != null ? List<Audio>.unmodifiable(audioUploads) : audioUploads);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Creator &&
      id == other.id &&
      DeepCollectionEquality().equals(_audioUploads, other._audioUploads);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Creator {");
    buffer.write("id=" + "$id");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Creator copyWith({String? id, List<Audio>? audioUploads}) {
    return Creator(
      id: id ?? this.id,
      audioUploads: audioUploads ?? this.audioUploads);
  }
  
  Creator.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _audioUploads = json['audioUploads'] is List
        ? (json['audioUploads'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Audio.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'audioUploads': _audioUploads?.map((e) => e?.toJson())?.toList()
  };

  static final QueryField ID = QueryField(fieldName: "creator.id");
  static final QueryField AUDIOUPLOADS = QueryField(
    fieldName: "audioUploads",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Audio).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Creator";
    modelSchemaDefinition.pluralName = "Creators";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Creator.AUDIOUPLOADS,
      isRequired: false,
      ofModelName: (Audio).toString(),
      associatedKey: Audio.CREATORID
    ));
  });
}

class _CreatorModelType extends ModelType<Creator> {
  const _CreatorModelType();
  
  @override
  Creator fromJson(Map<String, dynamic> jsonData) {
    return Creator.fromJson(jsonData);
  }
}