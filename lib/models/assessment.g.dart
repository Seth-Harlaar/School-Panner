// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAssessmentCollection on Isar {
  IsarCollection<Assessment> get assessments => this.collection();
}

const AssessmentSchema = CollectionSchema(
  name: r'Assessment',
  id: -7365692047566751431,
  properties: {
    r'assessmentStatus': PropertySchema(
      id: 0,
      name: r'assessmentStatus',
      type: IsarType.byte,
      enumMap: _AssessmentassessmentStatusEnumValueMap,
    ),
    r'assessmentType': PropertySchema(
      id: 1,
      name: r'assessmentType',
      type: IsarType.byte,
      enumMap: _AssessmentassessmentTypeEnumValueMap,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 3,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'finalGrade': PropertySchema(
      id: 4,
      name: r'finalGrade',
      type: IsarType.double,
    ),
    r'graded': PropertySchema(
      id: 5,
      name: r'graded',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 6,
      name: r'title',
      type: IsarType.string,
    ),
    r'weight': PropertySchema(
      id: 7,
      name: r'weight',
      type: IsarType.long,
    )
  },
  estimateSize: _assessmentEstimateSize,
  serialize: _assessmentSerialize,
  deserialize: _assessmentDeserialize,
  deserializeProp: _assessmentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _assessmentGetId,
  getLinks: _assessmentGetLinks,
  attach: _assessmentAttach,
  version: '3.0.5',
);

int _assessmentEstimateSize(
  Assessment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _assessmentSerialize(
  Assessment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.assessmentStatus.index);
  writer.writeByte(offsets[1], object.assessmentType.index);
  writer.writeString(offsets[2], object.description);
  writer.writeDateTime(offsets[3], object.dueDate);
  writer.writeDouble(offsets[4], object.finalGrade);
  writer.writeBool(offsets[5], object.graded);
  writer.writeString(offsets[6], object.title);
  writer.writeLong(offsets[7], object.weight);
}

Assessment _assessmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Assessment(
    assessmentStatus: _AssessmentassessmentStatusValueEnumMap[
            reader.readByteOrNull(offsets[0])] ??
        AssessmentStatus.notStarted,
    assessmentType: _AssessmentassessmentTypeValueEnumMap[
            reader.readByteOrNull(offsets[1])] ??
        AssessmentType.lab,
    description: reader.readString(offsets[2]),
    dueDate: reader.readDateTimeOrNull(offsets[3]),
    finalGrade: reader.readDoubleOrNull(offsets[4]) ?? 0,
    graded: reader.readBoolOrNull(offsets[5]) ?? false,
    title: reader.readString(offsets[6]),
    weight: reader.readLong(offsets[7]),
  );
  object.id = id;
  return object;
}

P _assessmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_AssessmentassessmentStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AssessmentStatus.notStarted) as P;
    case 1:
      return (_AssessmentassessmentTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AssessmentType.lab) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset) ?? 0) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AssessmentassessmentStatusEnumValueMap = {
  'notStarted': 0,
  'workingOn': 1,
  'almostDone': 2,
  'finished': 3,
};
const _AssessmentassessmentStatusValueEnumMap = {
  0: AssessmentStatus.notStarted,
  1: AssessmentStatus.workingOn,
  2: AssessmentStatus.almostDone,
  3: AssessmentStatus.finished,
};
const _AssessmentassessmentTypeEnumValueMap = {
  'lab': 0,
  'test': 1,
  'assignment': 2,
};
const _AssessmentassessmentTypeValueEnumMap = {
  0: AssessmentType.lab,
  1: AssessmentType.test,
  2: AssessmentType.assignment,
};

Id _assessmentGetId(Assessment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _assessmentGetLinks(Assessment object) {
  return [];
}

void _assessmentAttach(IsarCollection<dynamic> col, Id id, Assessment object) {
  object.id = id;
}

extension AssessmentQueryWhereSort
    on QueryBuilder<Assessment, Assessment, QWhere> {
  QueryBuilder<Assessment, Assessment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AssessmentQueryWhere
    on QueryBuilder<Assessment, Assessment, QWhereClause> {
  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idBetween(
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

extension AssessmentQueryFilter
    on QueryBuilder<Assessment, Assessment, QFilterCondition> {
  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentStatusEqualTo(AssessmentStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assessmentStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentStatusGreaterThan(
    AssessmentStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assessmentStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentStatusLessThan(
    AssessmentStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assessmentStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentStatusBetween(
    AssessmentStatus lower,
    AssessmentStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assessmentStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentTypeEqualTo(AssessmentType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assessmentType',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentTypeGreaterThan(
    AssessmentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assessmentType',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentTypeLessThan(
    AssessmentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assessmentType',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentTypeBetween(
    AssessmentType lower,
    AssessmentType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assessmentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> dueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      dueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> dueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> dueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> finalGradeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalGrade',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      finalGradeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalGrade',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      finalGradeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalGrade',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> finalGradeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalGrade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> gradedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'graded',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> weightEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> weightGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> weightLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> weightBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AssessmentQueryObject
    on QueryBuilder<Assessment, Assessment, QFilterCondition> {}

extension AssessmentQueryLinks
    on QueryBuilder<Assessment, Assessment, QFilterCondition> {}

extension AssessmentQuerySortBy
    on QueryBuilder<Assessment, Assessment, QSortBy> {
  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByAssessmentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentStatus', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      sortByAssessmentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentStatus', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByAssessmentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentType', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      sortByAssessmentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentType', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByFinalGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalGrade', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByFinalGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalGrade', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByGraded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'graded', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByGradedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'graded', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension AssessmentQuerySortThenBy
    on QueryBuilder<Assessment, Assessment, QSortThenBy> {
  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByAssessmentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentStatus', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      thenByAssessmentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentStatus', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByAssessmentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentType', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      thenByAssessmentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentType', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByFinalGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalGrade', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByFinalGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalGrade', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByGraded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'graded', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByGradedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'graded', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension AssessmentQueryWhereDistinct
    on QueryBuilder<Assessment, Assessment, QDistinct> {
  QueryBuilder<Assessment, Assessment, QDistinct> distinctByAssessmentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assessmentStatus');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByAssessmentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assessmentType');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByFinalGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalGrade');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByGraded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'graded');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }
}

extension AssessmentQueryProperty
    on QueryBuilder<Assessment, Assessment, QQueryProperty> {
  QueryBuilder<Assessment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Assessment, AssessmentStatus, QQueryOperations>
      assessmentStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assessmentStatus');
    });
  }

  QueryBuilder<Assessment, AssessmentType, QQueryOperations>
      assessmentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assessmentType');
    });
  }

  QueryBuilder<Assessment, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Assessment, DateTime?, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<Assessment, double, QQueryOperations> finalGradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalGrade');
    });
  }

  QueryBuilder<Assessment, bool, QQueryOperations> gradedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'graded');
    });
  }

  QueryBuilder<Assessment, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Assessment, int, QQueryOperations> weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }
}
