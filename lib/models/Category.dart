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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Category type in your schema. */
@immutable
class Category extends Model {
  static const classType = const _CategoryModelType();
  final String id;
  final String? _title;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Category._internal({required this.id, required title}): _title = title;
  
  factory Category({String? id, required String title}) {
    return Category._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Category &&
      id == other.id &&
      _title == other._title;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Category {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Category copyWith({String? id, String? title}) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title);
  }
  
  Category.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title
  };

  static final QueryField ID = QueryField(fieldName: "category.id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Category";
    modelSchemaDefinition.pluralName = "Categories";
    
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
      key: Category.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _CategoryModelType extends ModelType<Category> {
  const _CategoryModelType();
  
  @override
  Category fromJson(Map<String, dynamic> jsonData) {
    return Category.fromJson(jsonData);
  }
}