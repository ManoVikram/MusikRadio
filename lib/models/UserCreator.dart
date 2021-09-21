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


/** This is an auto generated class representing the UserCreator type in your schema. */
@immutable
class UserCreator extends Model {
  static const classType = const _UserCreatorModelType();
  final String id;
  final Creator? _creator;
  final User? _user;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Creator get creator {
    try {
      return _creator!;
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
  
  const UserCreator._internal({required this.id, required creator, required user}): _creator = creator, _user = user;
  
  factory UserCreator({String? id, required Creator creator, required User user}) {
    return UserCreator._internal(
      id: id == null ? UUID.getUUID() : id,
      creator: creator,
      user: user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCreator &&
      id == other.id &&
      _creator == other._creator &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserCreator {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("creator=" + (_creator != null ? _creator!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserCreator copyWith({String? id, Creator? creator, User? user}) {
    return UserCreator(
      id: id ?? this.id,
      creator: creator ?? this.creator,
      user: user ?? this.user);
  }
  
  UserCreator.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _creator = json['creator']?['serializedData'] != null
        ? Creator.fromJson(new Map<String, dynamic>.from(json['creator']['serializedData']))
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'creator': _creator?.toJson(), 'user': _user?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "userCreator.id");
  static final QueryField CREATOR = QueryField(
    fieldName: "creator",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Creator).toString()));
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserCreator";
    modelSchemaDefinition.pluralName = "UserCreators";
    
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
      key: UserCreator.CREATOR,
      isRequired: true,
      targetName: "creatorID",
      ofModelName: (Creator).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: UserCreator.USER,
      isRequired: true,
      targetName: "userID",
      ofModelName: (User).toString()
    ));
  });
}

class _UserCreatorModelType extends ModelType<UserCreator> {
  const _UserCreatorModelType();
  
  @override
  UserCreator fromJson(Map<String, dynamic> jsonData) {
    return UserCreator.fromJson(jsonData);
  }
}