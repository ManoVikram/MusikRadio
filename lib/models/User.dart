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


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final TemporalDateTime? _createdOn;
  final String? _email;
  final String? _name;
  final String? _description;
  final bool? _isCreator;
  final List<UserAudio>? _liked;
  final List<String>? _following;
  final List<String>? _followers;
  final String? _profilePictureKey;
  final List<Audio>? _audioUploads;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime get createdOn {
    try {
      return _createdOn!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get name {
    return _name;
  }
  
  String? get description {
    return _description;
  }
  
  bool get isCreator {
    try {
      return _isCreator!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  List<UserAudio>? get liked {
    return _liked;
  }
  
  List<String>? get following {
    return _following;
  }
  
  List<String>? get followers {
    return _followers;
  }
  
  String? get profilePictureKey {
    return _profilePictureKey;
  }
  
  List<Audio>? get audioUploads {
    return _audioUploads;
  }
  
  const User._internal({required this.id, required createdOn, required email, name, description, required isCreator, liked, following, followers, profilePictureKey, audioUploads}): _createdOn = createdOn, _email = email, _name = name, _description = description, _isCreator = isCreator, _liked = liked, _following = following, _followers = followers, _profilePictureKey = profilePictureKey, _audioUploads = audioUploads;
  
  factory User({String? id, required TemporalDateTime createdOn, required String email, String? name, String? description, required bool isCreator, List<UserAudio>? liked, List<String>? following, List<String>? followers, String? profilePictureKey, List<Audio>? audioUploads}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      createdOn: createdOn,
      email: email,
      name: name,
      description: description,
      isCreator: isCreator,
      liked: liked != null ? List<UserAudio>.unmodifiable(liked) : liked,
      following: following != null ? List<String>.unmodifiable(following) : following,
      followers: followers != null ? List<String>.unmodifiable(followers) : followers,
      profilePictureKey: profilePictureKey,
      audioUploads: audioUploads != null ? List<Audio>.unmodifiable(audioUploads) : audioUploads);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _createdOn == other._createdOn &&
      _email == other._email &&
      _name == other._name &&
      _description == other._description &&
      _isCreator == other._isCreator &&
      DeepCollectionEquality().equals(_liked, other._liked) &&
      DeepCollectionEquality().equals(_following, other._following) &&
      DeepCollectionEquality().equals(_followers, other._followers) &&
      _profilePictureKey == other._profilePictureKey &&
      DeepCollectionEquality().equals(_audioUploads, other._audioUploads);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdOn=" + (_createdOn != null ? _createdOn!.format() : "null") + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("isCreator=" + (_isCreator != null ? _isCreator!.toString() : "null") + ", ");
    buffer.write("following=" + (_following != null ? _following!.toString() : "null") + ", ");
    buffer.write("followers=" + (_followers != null ? _followers!.toString() : "null") + ", ");
    buffer.write("profilePictureKey=" + "$_profilePictureKey");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, TemporalDateTime? createdOn, String? email, String? name, String? description, bool? isCreator, List<UserAudio>? liked, List<String>? following, List<String>? followers, String? profilePictureKey, List<Audio>? audioUploads}) {
    return User(
      id: id ?? this.id,
      createdOn: createdOn ?? this.createdOn,
      email: email ?? this.email,
      name: name ?? this.name,
      description: description ?? this.description,
      isCreator: isCreator ?? this.isCreator,
      liked: liked ?? this.liked,
      following: following ?? this.following,
      followers: followers ?? this.followers,
      profilePictureKey: profilePictureKey ?? this.profilePictureKey,
      audioUploads: audioUploads ?? this.audioUploads);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdOn = json['createdOn'] != null ? TemporalDateTime.fromString(json['createdOn']) : null,
      _email = json['email'],
      _name = json['name'],
      _description = json['description'],
      _isCreator = json['isCreator'],
      _liked = json['liked'] is List
        ? (json['liked'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserAudio.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _following = json['following']?.cast<String>(),
      _followers = json['followers']?.cast<String>(),
      _profilePictureKey = json['profilePictureKey'],
      _audioUploads = json['audioUploads'] is List
        ? (json['audioUploads'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Audio.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdOn': _createdOn?.format(), 'email': _email, 'name': _name, 'description': _description, 'isCreator': _isCreator, 'liked': _liked?.map((e) => e?.toJson())?.toList(), 'following': _following, 'followers': _followers, 'profilePictureKey': _profilePictureKey, 'audioUploads': _audioUploads?.map((e) => e?.toJson())?.toList()
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField ISCREATOR = QueryField(fieldName: "isCreator");
  static final QueryField LIKED = QueryField(
    fieldName: "liked",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (UserAudio).toString()));
  static final QueryField FOLLOWING = QueryField(fieldName: "following");
  static final QueryField FOLLOWERS = QueryField(fieldName: "followers");
  static final QueryField PROFILEPICTUREKEY = QueryField(fieldName: "profilePictureKey");
  static final QueryField AUDIOUPLOADS = QueryField(
    fieldName: "audioUploads",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Audio).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
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
      key: User.CREATEDON,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.ISCREATOR,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.LIKED,
      isRequired: false,
      ofModelName: (UserAudio).toString(),
      associatedKey: UserAudio.USER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.FOLLOWING,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.FOLLOWERS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PROFILEPICTUREKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.AUDIOUPLOADS,
      isRequired: false,
      ofModelName: (Audio).toString(),
      associatedKey: Audio.USERID
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}