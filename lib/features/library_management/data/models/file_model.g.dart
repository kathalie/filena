// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFileCollection on Isar {
  IsarCollection<File> get files => this.collection();
}

const FileSchema = CollectionSchema(
  name: r'File',
  id: -3161376545294130050,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'timeCreated': PropertySchema(
      id: 1,
      name: r'timeCreated',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _fileEstimateSize,
  serialize: _fileSerialize,
  deserialize: _fileDeserialize,
  deserializeProp: _fileDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'parentCollection': LinkSchema(
      id: -2189727000819485259,
      name: r'parentCollection',
      target: r'FilesCollection',
      single: true,
    ),
    r'currentFileVersion': LinkSchema(
      id: -5091094390097241603,
      name: r'currentFileVersion',
      target: r'FileVersion',
      single: true,
    ),
    r'allFileVersions': LinkSchema(
      id: -2518991599346932165,
      name: r'allFileVersions',
      target: r'FileVersion',
      single: false,
      linkName: r'file',
    )
  },
  embeddedSchemas: {},
  getId: _fileGetId,
  getLinks: _fileGetLinks,
  attach: _fileAttach,
  version: '3.1.0+1',
);

int _fileEstimateSize(
  File object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _fileSerialize(
  File object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeDateTime(offsets[1], object.timeCreated);
}

File _fileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = File();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  object.timeCreated = reader.readDateTime(offsets[1]);
  return object;
}

P _fileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fileGetId(File object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fileGetLinks(File object) {
  return [
    object.parentCollection,
    object.currentFileVersion,
    object.allFileVersions
  ];
}

void _fileAttach(IsarCollection<dynamic> col, Id id, File object) {
  object.id = id;
  object.parentCollection.attach(
      col, col.isar.collection<FilesCollection>(), r'parentCollection', id);
  object.currentFileVersion.attach(
      col, col.isar.collection<FileVersion>(), r'currentFileVersion', id);
  object.allFileVersions
      .attach(col, col.isar.collection<FileVersion>(), r'allFileVersions', id);
}

extension FileQueryWhereSort on QueryBuilder<File, File, QWhere> {
  QueryBuilder<File, File, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FileQueryWhere on QueryBuilder<File, File, QWhereClause> {
  QueryBuilder<File, File, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<File, File, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<File, File, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<File, File, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<File, File, QAfterWhereClause> idBetween(
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

extension FileQueryFilter on QueryBuilder<File, File, QFilterCondition> {
  QueryBuilder<File, File, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<File, File, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<File, File, QAfterFilterCondition> idBetween(
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

  QueryBuilder<File, File, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> timeCreatedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> timeCreatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> timeCreatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> timeCreatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeCreated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FileQueryObject on QueryBuilder<File, File, QFilterCondition> {}

extension FileQueryLinks on QueryBuilder<File, File, QFilterCondition> {
  QueryBuilder<File, File, QAfterFilterCondition> parentCollection(
      FilterQuery<FilesCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'parentCollection');
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> parentCollectionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'parentCollection', 0, true, 0, true);
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> currentFileVersion(
      FilterQuery<FileVersion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'currentFileVersion');
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> currentFileVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'currentFileVersion', 0, true, 0, true);
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> allFileVersions(
      FilterQuery<FileVersion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'allFileVersions');
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> allFileVersionsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'allFileVersions', length, true, length, true);
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> allFileVersionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'allFileVersions', 0, true, 0, true);
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> allFileVersionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'allFileVersions', 0, false, 999999, true);
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> allFileVersionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'allFileVersions', 0, true, length, include);
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition>
      allFileVersionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'allFileVersions', length, include, 999999, true);
    });
  }

  QueryBuilder<File, File, QAfterFilterCondition> allFileVersionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'allFileVersions', lower, includeLower, upper, includeUpper);
    });
  }
}

extension FileQuerySortBy on QueryBuilder<File, File, QSortBy> {
  QueryBuilder<File, File, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<File, File, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<File, File, QAfterSortBy> sortByTimeCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeCreated', Sort.asc);
    });
  }

  QueryBuilder<File, File, QAfterSortBy> sortByTimeCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeCreated', Sort.desc);
    });
  }
}

extension FileQuerySortThenBy on QueryBuilder<File, File, QSortThenBy> {
  QueryBuilder<File, File, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<File, File, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<File, File, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<File, File, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<File, File, QAfterSortBy> thenByTimeCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeCreated', Sort.asc);
    });
  }

  QueryBuilder<File, File, QAfterSortBy> thenByTimeCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeCreated', Sort.desc);
    });
  }
}

extension FileQueryWhereDistinct on QueryBuilder<File, File, QDistinct> {
  QueryBuilder<File, File, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<File, File, QDistinct> distinctByTimeCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeCreated');
    });
  }
}

extension FileQueryProperty on QueryBuilder<File, File, QQueryProperty> {
  QueryBuilder<File, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<File, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<File, DateTime, QQueryOperations> timeCreatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeCreated');
    });
  }
}
