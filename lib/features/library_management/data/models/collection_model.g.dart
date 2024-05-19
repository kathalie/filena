// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFileCollectionCollection on Isar {
  IsarCollection<FileCollection> get fileCollections => this.collection();
}

const FileCollectionSchema = CollectionSchema(
  name: r'FileCollection',
  id: 1118519841098160946,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _fileCollectionEstimateSize,
  serialize: _fileCollectionSerialize,
  deserialize: _fileCollectionDeserialize,
  deserializeProp: _fileCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'childCollections': LinkSchema(
      id: -7029777194374328870,
      name: r'childCollections',
      target: r'FileCollection',
      single: false,
    ),
    r'files': LinkSchema(
      id: -2106773748840709605,
      name: r'files',
      target: r'File',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _fileCollectionGetId,
  getLinks: _fileCollectionGetLinks,
  attach: _fileCollectionAttach,
  version: '3.1.0+1',
);

int _fileCollectionEstimateSize(
  FileCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _fileCollectionSerialize(
  FileCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

FileCollection _fileCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FileCollection();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _fileCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fileCollectionGetId(FileCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fileCollectionGetLinks(FileCollection object) {
  return [object.childCollections, object.files];
}

void _fileCollectionAttach(
    IsarCollection<dynamic> col, Id id, FileCollection object) {
  object.id = id;
  object.childCollections.attach(
      col, col.isar.collection<FileCollection>(), r'childCollections', id);
  object.files.attach(col, col.isar.collection<File>(), r'files', id);
}

extension FileCollectionQueryWhereSort
    on QueryBuilder<FileCollection, FileCollection, QWhere> {
  QueryBuilder<FileCollection, FileCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FileCollectionQueryWhere
    on QueryBuilder<FileCollection, FileCollection, QWhereClause> {
  QueryBuilder<FileCollection, FileCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<FileCollection, FileCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterWhereClause> idBetween(
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

extension FileCollectionQueryFilter
    on QueryBuilder<FileCollection, FileCollection, QFilterCondition> {
  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension FileCollectionQueryObject
    on QueryBuilder<FileCollection, FileCollection, QFilterCondition> {}

extension FileCollectionQueryLinks
    on QueryBuilder<FileCollection, FileCollection, QFilterCondition> {
  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      childCollections(FilterQuery<FileCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'childCollections');
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      childCollectionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'childCollections', length, true, length, true);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      childCollectionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'childCollections', 0, true, 0, true);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      childCollectionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'childCollections', 0, false, 999999, true);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      childCollectionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'childCollections', 0, true, length, include);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      childCollectionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'childCollections', length, include, 999999, true);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      childCollectionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'childCollections', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition> files(
      FilterQuery<File> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'files');
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      filesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', length, true, length, true);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      filesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', 0, true, 0, true);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      filesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', 0, false, 999999, true);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      filesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', 0, true, length, include);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      filesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', length, include, 999999, true);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterFilterCondition>
      filesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'files', lower, includeLower, upper, includeUpper);
    });
  }
}

extension FileCollectionQuerySortBy
    on QueryBuilder<FileCollection, FileCollection, QSortBy> {
  QueryBuilder<FileCollection, FileCollection, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FileCollectionQuerySortThenBy
    on QueryBuilder<FileCollection, FileCollection, QSortThenBy> {
  QueryBuilder<FileCollection, FileCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FileCollection, FileCollection, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FileCollectionQueryWhereDistinct
    on QueryBuilder<FileCollection, FileCollection, QDistinct> {
  QueryBuilder<FileCollection, FileCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension FileCollectionQueryProperty
    on QueryBuilder<FileCollection, FileCollection, QQueryProperty> {
  QueryBuilder<FileCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FileCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
