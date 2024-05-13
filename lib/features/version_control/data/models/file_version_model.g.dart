// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_version_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFileVersionCollection on Isar {
  IsarCollection<FileVersion> get fileVersions => this.collection();
}

const FileVersionSchema = CollectionSchema(
  name: r'FileVersion',
  id: -4228025264124535478,
  properties: {
    r'dateEdited': PropertySchema(
      id: 0,
      name: r'dateEdited',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'isFavourite': PropertySchema(
      id: 2,
      name: r'isFavourite',
      type: IsarType.bool,
    )
  },
  estimateSize: _fileVersionEstimateSize,
  serialize: _fileVersionSerialize,
  deserialize: _fileVersionDeserialize,
  deserializeProp: _fileVersionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'file': LinkSchema(
      id: -8601191015259788103,
      name: r'file',
      target: r'File',
      single: true,
    ),
    r'tags': LinkSchema(
      id: -5040227649931914487,
      name: r'tags',
      target: r'Tag',
      single: false,
    ),
    r'devicesToSyncWith': LinkSchema(
      id: 3342913906106740685,
      name: r'devicesToSyncWith',
      target: r'Device',
      single: false,
      linkName: r'fileVersionsToSync',
    )
  },
  embeddedSchemas: {},
  getId: _fileVersionGetId,
  getLinks: _fileVersionGetLinks,
  attach: _fileVersionAttach,
  version: '3.1.0+1',
);

int _fileVersionEstimateSize(
  FileVersion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _fileVersionSerialize(
  FileVersion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateEdited);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.isFavourite);
}

FileVersion _fileVersionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FileVersion();
  object.dateEdited = reader.readDateTime(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.isFavourite = reader.readBool(offsets[2]);
  return object;
}

P _fileVersionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fileVersionGetId(FileVersion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fileVersionGetLinks(FileVersion object) {
  return [object.file, object.tags, object.devicesToSyncWith];
}

void _fileVersionAttach(
    IsarCollection<dynamic> col, Id id, FileVersion object) {
  object.id = id;
  object.file.attach(col, col.isar.collection<File>(), r'file', id);
  object.tags.attach(col, col.isar.collection<Tag>(), r'tags', id);
  object.devicesToSyncWith
      .attach(col, col.isar.collection<Device>(), r'devicesToSyncWith', id);
}

extension FileVersionQueryWhereSort
    on QueryBuilder<FileVersion, FileVersion, QWhere> {
  QueryBuilder<FileVersion, FileVersion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FileVersionQueryWhere
    on QueryBuilder<FileVersion, FileVersion, QWhereClause> {
  QueryBuilder<FileVersion, FileVersion, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FileVersionQueryFilter
    on QueryBuilder<FileVersion, FileVersion, QFilterCondition> {
  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      dateEditedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateEdited',
        value: value,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      dateEditedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateEdited',
        value: value,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      dateEditedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateEdited',
        value: value,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      dateEditedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateEdited',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      isFavouriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavourite',
        value: value,
      ));
    });
  }
}

extension FileVersionQueryObject
    on QueryBuilder<FileVersion, FileVersion, QFilterCondition> {}

extension FileVersionQueryLinks
    on QueryBuilder<FileVersion, FileVersion, QFilterCondition> {
  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition> file(
      FilterQuery<File> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'file');
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition> fileIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'file', 0, true, 0, true);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition> tags(
      FilterQuery<Tag> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tags');
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, true, length, true);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, 0, true);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, false, 999999, true);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, length, include);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, include, 999999, true);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tags', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      devicesToSyncWith(FilterQuery<Device> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'devicesToSyncWith');
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      devicesToSyncWithLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'devicesToSyncWith', length, true, length, true);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      devicesToSyncWithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'devicesToSyncWith', 0, true, 0, true);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      devicesToSyncWithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'devicesToSyncWith', 0, false, 999999, true);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      devicesToSyncWithLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'devicesToSyncWith', 0, true, length, include);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      devicesToSyncWithLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'devicesToSyncWith', length, include, 999999, true);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterFilterCondition>
      devicesToSyncWithLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'devicesToSyncWith', lower, includeLower, upper, includeUpper);
    });
  }
}

extension FileVersionQuerySortBy
    on QueryBuilder<FileVersion, FileVersion, QSortBy> {
  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> sortByDateEdited() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateEdited', Sort.asc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> sortByDateEditedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateEdited', Sort.desc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> sortByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.asc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> sortByIsFavouriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.desc);
    });
  }
}

extension FileVersionQuerySortThenBy
    on QueryBuilder<FileVersion, FileVersion, QSortThenBy> {
  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> thenByDateEdited() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateEdited', Sort.asc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> thenByDateEditedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateEdited', Sort.desc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> thenByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.asc);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QAfterSortBy> thenByIsFavouriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.desc);
    });
  }
}

extension FileVersionQueryWhereDistinct
    on QueryBuilder<FileVersion, FileVersion, QDistinct> {
  QueryBuilder<FileVersion, FileVersion, QDistinct> distinctByDateEdited() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateEdited');
    });
  }

  QueryBuilder<FileVersion, FileVersion, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FileVersion, FileVersion, QDistinct> distinctByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavourite');
    });
  }
}

extension FileVersionQueryProperty
    on QueryBuilder<FileVersion, FileVersion, QQueryProperty> {
  QueryBuilder<FileVersion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FileVersion, DateTime, QQueryOperations> dateEditedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateEdited');
    });
  }

  QueryBuilder<FileVersion, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<FileVersion, bool, QQueryOperations> isFavouriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavourite');
    });
  }
}
