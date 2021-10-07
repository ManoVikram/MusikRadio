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
  final String? _category;
  final int? _listenings;
  final String? _audioKey;
  final String? _thumbnailKey;
  final String? _userID;

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
  
  String get audioKey {
    try {
      return _audioKey!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get thumbnailKey {
    try {
      return _thumbnailKey!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get userID {
    return _userID;
  }
  
  const Audio._internal({required this.id, required uploadedOn, required title, description, likes, required category, listenings, required audioKey, required thumbnailKey, userID}): _uploadedOn = uploadedOn, _title = title, _description = description, _likes = likes, _category = category, _listenings = listenings, _audioKey = audioKey, _thumbnailKey = thumbnailKey, _userID = userID;
  
  factory Audio({String? id, required TemporalDateTime uploadedOn, required String title, String? description, List<UserAudio>? likes, required String category, int? listenings, required String audioKey, required String thumbnailKey, String? userID}) {
    return Audio._internal(
      id: id == null ? UUID.getUUID() : id,
      uploadedOn: uploadedOn,
      title: title,
      description: description,
      likes: likes != null ? List<UserAudio>.unmodifiable(likes) : likes,
      category: category,
      listenings: listenings,
      audioKey: audioKey,
      thumbnailKey: thumbnailKey,
      userID: userID);
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
      _category == other._category &&
      _listenings == other._listenings &&
      _audioKey == other._audioKey &&
      _thumbnailKey == other._thumbnailKey &&
      _userID == other._userID;
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
    buffer.write("category=" + "$_category" + ", ");
    buffer.write("listenings=" + (_listenings != null ? _listenings!.toString() : "null") + ", ");
    buffer.write("audioKey=" + "$_audioKey" + ", ");
    buffer.write("thumbnailKey=" + "$_thumbnailKey" + ", ");
    buffer.write("userID=" + "$_userID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Audio copyWith({String? id, TemporalDateTime? uploadedOn, String? title, String? description, List<UserAudio>? likes, String? category, int? listenings, String? audioKey, String? thumbnailKey, String? userID}) {
    return Audio(
      id: id ?? this.id,
      uploadedOn: uploadedOn ?? this.uploadedOn,
      title: title ?? this.title,
      description: description ?? this.description,
      likes: likes ?? this.likes,
      category: category ?? this.category,
      listenings: listenings ?? this.listenings,
      audioKey: audioKey ?? this.audioKey,
      thumbnailKey: thumbnailKey ?? this.thumbnailKey,
      userID: userID ?? this.userID);
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
      _category = json['category'],
      _listenings = json['listenings'],
      _audioKey = json['audioKey'],
      _thumbnailKey = json['thumbnailKey'],
      _userID = json['userID'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uploadedOn': _uploadedOn?.format(), 'title': _title, 'description': _description, 'likes': _likes?.map((e) => e?.toJson())?.toList(), 'category': _category, 'listenings': _listenings, 'audioKey': _audioKey, 'thumbnailKey': _thumbnailKey, 'userID': _userID
  };

  static final QueryField ID = QueryField(fieldName: "audio.id");
  static final QueryField UPLOADEDON = QueryField(fieldName: "uploadedOn");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField LIKES = QueryField(
    fieldName: "likes",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (UserAudio).toString()));
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField LISTENINGS = QueryField(fieldName: "listenings");
  static final QueryField AUDIOKEY = QueryField(fieldName: "audioKey");
  static final QueryField THUMBNAILKEY = QueryField(fieldName: "thumbnailKey");
  static final QueryField USERID = QueryField(fieldName: "userID");
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
      key: Audio.CATEGORY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.LISTENINGS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.AUDIOKEY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.THUMBNAILKEY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Audio.USERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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