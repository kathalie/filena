// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFilesCollectionCollection on Isar {
  IsarCollection<FilesCollection> get filesCollections => this.collection();
}

const FilesCollectionSchema = CollectionSchema(
  name: r'FilesCollection',
  id: -2094009713461123324,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _filesCollectionEstimateSize,
  serialize: _filesCollectionSerialize,
  deserialize: _filesCollectionDeserialize,
  deserializeProp: _filesCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'childCollections': LinkSchema(
      id: -4939138167489396545,
      name: r'childCollections',
      target: r'FilesCollection',
      single: false,
    ),
    r'files': LinkSchema(
      id: -2188057443979530597,
      name: r'files',
      target: r'File',
      single: false,
      linkName: r'parentCollection',
    )
  },
  embeddedSchemas: {},
  getId: _filesCollectionGetId,
  getLinks: _filesCollectionGetLinks,
  attach: _filesCollectionAttach,
  version: '3.1.0+1',
);

int _filesCollectionEstimateSize(
  FilesCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _filesCollectionSerialize(
  FilesCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

FilesCollection _filesCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FilesCollection();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _filesCollectionDeserializeProp<P>(
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

Id _filesCollectionGetId(FilesCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _filesCollectionGetLinks(FilesCollection object) {
  return [object.childCollections, object.files];
}

void _filesCollectionAttach(
    IsarCollection<dynamic> col, Id id, FilesCollection object) {
  object.id = id;
  object.childCollections.attach(
      col, col.isar.collection<FilesCollection>(), r'childCollections', id);
  object.files.attach(col, col.isar.collection<File>(), r'files', id);
}

extension FilesCollectionQueryWhereSort
    on QueryBuilder<FilesCollection, FilesCollection, QWhere> {
  QueryBuilder<FilesCollection, FilesCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FilesCollectionQueryWhere
    on QueryBuilder<FilesCollection, FilesCollection, QWhereClause> {
  QueryBuilder<FilesCollection, FilesCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterWhereClause> idBetween(
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

extension FilesCollectionQueryFilter
    on QueryBuilder<FilesCollection, FilesCollection, QFilterCondition> {
  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension FilesCollectionQueryObject
    on QueryBuilder<FilesCollection, FilesCollection, QFilterCondition> {}

extension FilesCollectionQueryLinks
    on QueryBuilder<FilesCollection, FilesCollection, QFilterCondition> {
  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      childCollections(FilterQuery<FilesCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'childCollections');
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      childCollectionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'childCollections', length, true, length, true);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      childCollectionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'childCollections', 0, true, 0, true);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      childCollectionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'childCollections', 0, false, 999999, true);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      childCollectionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'childCollections', 0, true, length, include);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      childCollectionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'childCollections', length, include, 999999, true);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition> files(
      FilterQuery<File> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'files');
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      filesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', length, true, length, true);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      filesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', 0, true, 0, true);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      filesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', 0, false, 999999, true);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      filesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', 0, true, length, include);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
      filesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'files', length, include, 999999, true);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterFilterCondition>
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

extension FilesCollectionQuerySortBy
    on QueryBuilder<FilesCollection, FilesCollection, QSortBy> {
  QueryBuilder<FilesCollection, FilesCollection, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FilesCollectionQuerySortThenBy
    on QueryBuilder<FilesCollection, FilesCollection, QSortThenBy> {
  QueryBuilder<FilesCollection, FilesCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FilesCollection, FilesCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FilesCollectionQueryWhereDistinct
    on QueryBuilder<FilesCollection, FilesCollection, QDistinct> {
  QueryBuilder<FilesCollection, FilesCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension FilesCollectionQueryProperty
    on QueryBuilder<FilesCollection, FilesCollection, QQueryProperty> {
  QueryBuilder<FilesCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FilesCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
