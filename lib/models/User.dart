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
  final List<UserCreator>? _following;
  final List<UserAudio>? _liked;

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
  
  List<UserCreator>? get following {
    return _following;
  }
  
  List<UserAudio>? get liked {
    return _liked;
  }
  
  const User._internal({required this.id, required createdOn, required email, name, description, required isCreator, following, liked}): _createdOn = createdOn, _email = email, _name = name, _description = description, _isCreator = isCreator, _following = following, _liked = liked;
  
  factory User({String? id, required TemporalDateTime createdOn, required String email, String? name, String? description, required bool isCreator, List<UserCreator>? following, List<UserAudio>? liked}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      createdOn: createdOn,
      email: email,
      name: name,
      description: description,
      isCreator: isCreator,
      following: following != null ? List<UserCreator>.unmodifiable(following) : following,
      liked: liked != null ? List<UserAudio>.unmodifiable(liked) : liked);
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
      DeepCollectionEquality().equals(_following, other._following) &&
      DeepCollectionEquality().equals(_liked, other._liked);
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
    buffer.write("isCreator=" + (_isCreator != null ? _isCreator!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, TemporalDateTime? createdOn, String? email, String? name, String? description, bool? isCreator, List<UserCreator>? following, List<UserAudio>? liked}) {
    return User(
      id: id ?? this.id,
      createdOn: createdOn ?? this.createdOn,
      email: email ?? this.email,
      name: name ?? this.name,
      description: description ?? this.description,
      isCreator: isCreator ?? this.isCreator,
      following: following ?? this.following,
      liked: liked ?? this.liked);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdOn = json['createdOn'] != null ? TemporalDateTime.fromString(json['createdOn']) : null,
      _email = json['email'],
      _name = json['name'],
      _description = json['description'],
      _isCreator = json['isCreator'],
      _following = json['following'] is List
        ? (json['following'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserCreator.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _liked = json['liked'] is List
        ? (json['liked'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserAudio.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdOn': _createdOn?.format(), 'email': _email, 'name': _name, 'description': _description, 'isCreator': _isCreator, 'following': _following?.map((e) => e?.toJson())?.toList(), 'liked': _liked?.map((e) => e?.toJson())?.toList()
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField ISCREATOR = QueryField(fieldName: "isCreator");
  static final QueryField FOLLOWING = QueryField(
    fieldName: "following",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (UserCreator).toString()));
  static final QueryField LIKED = QueryField(
    fieldName: "liked",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (UserAudio).toString()));
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
      key: User.FOLLOWING,
      isRequired: false,
      ofModelName: (UserCreator).toString(),
      associatedKey: UserCreator.USER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.LIKED,
      isRequired: false,
      ofModelName: (UserAudio).toString(),
      associatedKey: UserAudio.USER
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