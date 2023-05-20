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

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Game type in your schema. */
@immutable
class Game extends Model {
  static const classType = const _GameModelType();
  final String id;
  final String? _gameName;
  final String? _description;
  final TemporalDate? _releaseDate;
  final String? _gameImageUrl;
  final String? _gameImageKey;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  GameModelIdentifier get modelIdentifier {
      return GameModelIdentifier(
        id: id
      );
  }
  
  String get gameName {
    try {
      return _gameName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDate get releaseDate {
    try {
      return _releaseDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get gameImageUrl {
    return _gameImageUrl;
  }
  
  String? get gameImageKey {
    return _gameImageKey;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Game._internal({required this.id, required gameName, required description, required releaseDate, gameImageUrl, gameImageKey, createdAt, updatedAt}): _gameName = gameName, _description = description, _releaseDate = releaseDate, _gameImageUrl = gameImageUrl, _gameImageKey = gameImageKey, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Game({String? id, required String gameName, required String description, required TemporalDate releaseDate, String? gameImageUrl, String? gameImageKey}) {
    return Game._internal(
      id: id == null ? UUID.getUUID() : id,
      gameName: gameName,
      description: description,
      releaseDate: releaseDate,
      gameImageUrl: gameImageUrl,
      gameImageKey: gameImageKey);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Game &&
      id == other.id &&
      _gameName == other._gameName &&
      _description == other._description &&
      _releaseDate == other._releaseDate &&
      _gameImageUrl == other._gameImageUrl &&
      _gameImageKey == other._gameImageKey;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Game {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("gameName=" + "$_gameName" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("releaseDate=" + (_releaseDate != null ? _releaseDate!.format() : "null") + ", ");
    buffer.write("gameImageUrl=" + "$_gameImageUrl" + ", ");
    buffer.write("gameImageKey=" + "$_gameImageKey" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Game copyWith({String? gameName, String? description, TemporalDate? releaseDate, String? gameImageUrl, String? gameImageKey}) {
    return Game._internal(
      id: id,
      gameName: gameName ?? this.gameName,
      description: description ?? this.description,
      releaseDate: releaseDate ?? this.releaseDate,
      gameImageUrl: gameImageUrl ?? this.gameImageUrl,
      gameImageKey: gameImageKey ?? this.gameImageKey);
  }
  
  Game.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _gameName = json['gameName'],
      _description = json['description'],
      _releaseDate = json['releaseDate'] != null ? TemporalDate.fromString(json['releaseDate']) : null,
      _gameImageUrl = json['gameImageUrl'],
      _gameImageKey = json['gameImageKey'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'gameName': _gameName, 'description': _description, 'releaseDate': _releaseDate?.format(), 'gameImageUrl': _gameImageUrl, 'gameImageKey': _gameImageKey, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'gameName': _gameName, 'description': _description, 'releaseDate': _releaseDate, 'gameImageUrl': _gameImageUrl, 'gameImageKey': _gameImageKey, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<GameModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<GameModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField GAMENAME = QueryField(fieldName: "gameName");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField RELEASEDATE = QueryField(fieldName: "releaseDate");
  static final QueryField GAMEIMAGEURL = QueryField(fieldName: "gameImageUrl");
  static final QueryField GAMEIMAGEKEY = QueryField(fieldName: "gameImageKey");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Game";
    modelSchemaDefinition.pluralName = "Games";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Game.GAMENAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Game.DESCRIPTION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Game.RELEASEDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Game.GAMEIMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Game.GAMEIMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _GameModelType extends ModelType<Game> {
  const _GameModelType();
  
  @override
  Game fromJson(Map<String, dynamic> jsonData) {
    return Game.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Game';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Game] in your schema.
 */
@immutable
class GameModelIdentifier implements ModelIdentifier<Game> {
  final String id;

  /** Create an instance of GameModelIdentifier using [id] the primary key. */
  const GameModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'GameModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is GameModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}