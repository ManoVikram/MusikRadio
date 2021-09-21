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


/** This is an auto generated class representing the Audio type in your schema. */
@immutable
class Audio extends Model {
  static const classType = const _AudioModelType();
  final String id;
  final TemporalDateTime? _uploadedOn;
  final String? _title;
  final String? _description;
  final List<UserAudio>? _likes;
  final String? _creatorID;
  final String? _category;
  final int? _listenings;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime get uploadedOn {
    try {
      return _uploadedOn!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get description {
    return _description;
  }
  
  List<UserAudio>? get likes {
    return _likes;
  }
  
  String? get creatorID {
    return _creatorID;
  }
  
  String get category {
    try {
      return _category!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  int? get listenings {
    return _listenings;
  }
  
  const Audio._internal({required this.id, required uploadedOn, required title, description, likes, creatorID, required category, listenings}): _uploadedOn = uploadedOn, _title = title, _description = description, _likes = likes, _creatorID = creatorID, _category = category, _listenings = listenings;
  
  factory Audio({String? id, required TemporalDateTime uploadedOn, required String title, String? description, List<UserAudio>? likes, String? creatorID, required String category, int? listenings}) {
    return Audio._internal(
      id: id == null ? UUID.getUUID() : id,
      uploadedOn: uploadedOn,
      title: title,
      description: description,
      likes: likes != null ? List<UserAudio>.unmodifiable(likes) : likes,
      creatorID: creatorID,
      category: category,
      listenings: listenings);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Audio &&
      id == other.id &&
      _uploadedOn == other._uploadedOn &&
      _title == other._title &&
      _description == other._description &&
      DeepCollectionEquality().equals(_likes, other._likes) &&
      _creatorID == other._creatorID &&
      _category == other._category &&
      _listenings == other._listenings;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Audio {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uploadedOn=" + (_uploadedOn != null ? _uploadedOn!.format() : "null") + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("creatorID=" + "$_creatorID" + ", ");
    buffer.write("category=" + "$_category" + ", ");
    buffer.write("listenings=" + (_listenings != null ? _listenings!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Audio copyWith({String? id, TemporalDateTime? uploadedOn, String? title, String? description, List<UserAudio>? likes, String? creatorID, String? category, int? listenings}) {
    return Audio(
      id: id ?? this.id,
      uploadedOn: uploadedOn ?? this.uploadedOn,
      title: title ?? this.title,
      description: description ?? this.description,
      likes: likes ?? this.likes,
      creatorID: creatorID ?? this.creatorID,
      category: category ?? this.category,
      listenings: listenings ?? this.listenings);
  }
  
  Audio.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uploadedOn = json['uploadedOn'] != null ? TemporalDateTime.fromString(json['uploadedOn']) : null,
      _title = json['title'],
      _description = json['description'],
      _likes = json['likes'] is List
        ? (json['likes'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserAudio.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _creatorID = json['creatorID'],
      _category = json['category'],
      _listenings = json['listenings'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uploadedOn': _uploadedOn?.format(), 'title': _title, 'description': _description, 'likes': _likes?.map((e) => e?.toJson())?.toList(), 'creatorID': _creatorID, 'category': _category, 'listenings': _listenings
  };

  static final QueryField ID = QueryField(fieldName: "audio.id");
  static final QueryField UPLOADEDON = QueryField(fieldName: "uploadedOn");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField LIKES = QueryField(
    fieldName: "likes",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (UserAudio).toString()));
  static final QueryField CREATORID = QueryField(fieldName: "creatorID");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField LISTENINGS = QueryField(fieldName: "listenings");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Audio";
    modelSchemaDefinition.pluralName = "Audio";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.UPLOADEDON,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Audio.LIKES,
      isRequired: false,
      ofModelName: (UserAudio).toString(),
      associatedKey: UserAudio.AUDIO
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.CREATORID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.CATEGORY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.LISTENINGS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}

class _AudioModelType extends ModelType<Audio> {
  const _AudioModelType();
  
  @override
  Audio fromJson(Map<String, dynamic> jsonData) {
    return Audio.fromJson(jsonData);
  }
}