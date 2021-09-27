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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the UserAudio type in your schema. */
@immutable
class UserAudio extends Model {
  static const classType = const _UserAudioModelType();
  final String id;
  final Audio? _audio;
  final User? _user;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Audio get audio {
    try {
      return _audio!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  User get user {
    try {
      return _user!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const UserAudio._internal({required this.id, required audio, required user}): _audio = audio, _user = user;
  
  factory UserAudio({String? id, required Audio audio, required User user}) {
    return UserAudio._internal(
      id: id == null ? UUID.getUUID() : id,
      audio: audio,
      user: user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserAudio &&
      id == other.id &&
      _audio == other._audio &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserAudio {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("audio=" + (_audio != null ? _audio!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserAudio copyWith({String? id, Audio? audio, User? user}) {
    return UserAudio(
      id: id ?? this.id,
      audio: audio ?? this.audio,
      user: user ?? this.user);
  }
  
  UserAudio.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _audio = json['audio']?['serializedData'] != null
        ? Audio.fromJson(new Map<String, dynamic>.from(json['audio']['serializedData']))
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'audio': _audio?.toJson(), 'user': _user?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "userAudio.id");
  static final QueryField AUDIO = QueryField(
    fieldName: "audio",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Audio).toString()));
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserAudio";
    modelSchemaDefinition.pluralName = "UserAudios";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: UserAudio.AUDIO,
      isRequired: true,
      targetName: "audioID",
      ofModelName: (Audio).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: UserAudio.USER,
      isRequired: true,
      targetName: "userID",
      ofModelName: (User).toString()
    ));
  });
}

class _UserAudioModelType extends ModelType<UserAudio> {
  const _UserAudioModelType();
  
  @override
  UserAudio fromJson(Map<String, dynamic> jsonData) {
    return UserAudio.fromJson(jsonData);
  }
}