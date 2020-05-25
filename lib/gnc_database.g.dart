// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnc_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Commodity extends DataClass implements Insertable<Commodity> {
  final String guid;
  final String namespace;
  final String mnemonic;
  final String fullname;
  final int fraction;
  Commodity(
      {@required this.guid,
      @required this.namespace,
      @required this.mnemonic,
      @required this.fullname,
      @required this.fraction});
  factory Commodity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Commodity(
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      namespace: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}namespace']),
      mnemonic: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mnemonic']),
      fullname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}fullname']),
      fraction:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}fraction']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || guid != null) {
      map['guid'] = Variable<String>(guid);
    }
    if (!nullToAbsent || namespace != null) {
      map['namespace'] = Variable<String>(namespace);
    }
    if (!nullToAbsent || mnemonic != null) {
      map['mnemonic'] = Variable<String>(mnemonic);
    }
    if (!nullToAbsent || fullname != null) {
      map['fullname'] = Variable<String>(fullname);
    }
    if (!nullToAbsent || fraction != null) {
      map['fraction'] = Variable<int>(fraction);
    }
    return map;
  }

  CommoditiesCompanion toCompanion(bool nullToAbsent) {
    return CommoditiesCompanion(
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      namespace: namespace == null && nullToAbsent
          ? const Value.absent()
          : Value(namespace),
      mnemonic: mnemonic == null && nullToAbsent
          ? const Value.absent()
          : Value(mnemonic),
      fullname: fullname == null && nullToAbsent
          ? const Value.absent()
          : Value(fullname),
      fraction: fraction == null && nullToAbsent
          ? const Value.absent()
          : Value(fraction),
    );
  }

  factory Commodity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Commodity(
      guid: serializer.fromJson<String>(json['guid']),
      namespace: serializer.fromJson<String>(json['namespace']),
      mnemonic: serializer.fromJson<String>(json['mnemonic']),
      fullname: serializer.fromJson<String>(json['fullname']),
      fraction: serializer.fromJson<int>(json['fraction']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guid': serializer.toJson<String>(guid),
      'namespace': serializer.toJson<String>(namespace),
      'mnemonic': serializer.toJson<String>(mnemonic),
      'fullname': serializer.toJson<String>(fullname),
      'fraction': serializer.toJson<int>(fraction),
    };
  }

  Commodity copyWith(
          {String guid,
          String namespace,
          String mnemonic,
          String fullname,
          int fraction}) =>
      Commodity(
        guid: guid ?? this.guid,
        namespace: namespace ?? this.namespace,
        mnemonic: mnemonic ?? this.mnemonic,
        fullname: fullname ?? this.fullname,
        fraction: fraction ?? this.fraction,
      );
  @override
  String toString() {
    return (StringBuffer('Commodity(')
          ..write('guid: $guid, ')
          ..write('namespace: $namespace, ')
          ..write('mnemonic: $mnemonic, ')
          ..write('fullname: $fullname, ')
          ..write('fraction: $fraction')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      guid.hashCode,
      $mrjc(
          namespace.hashCode,
          $mrjc(mnemonic.hashCode,
              $mrjc(fullname.hashCode, fraction.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Commodity &&
          other.guid == this.guid &&
          other.namespace == this.namespace &&
          other.mnemonic == this.mnemonic &&
          other.fullname == this.fullname &&
          other.fraction == this.fraction);
}

class CommoditiesCompanion extends UpdateCompanion<Commodity> {
  final Value<String> guid;
  final Value<String> namespace;
  final Value<String> mnemonic;
  final Value<String> fullname;
  final Value<int> fraction;
  const CommoditiesCompanion({
    this.guid = const Value.absent(),
    this.namespace = const Value.absent(),
    this.mnemonic = const Value.absent(),
    this.fullname = const Value.absent(),
    this.fraction = const Value.absent(),
  });
  CommoditiesCompanion.insert({
    @required String guid,
    @required String namespace,
    @required String mnemonic,
    @required String fullname,
    @required int fraction,
  })  : guid = Value(guid),
        namespace = Value(namespace),
        mnemonic = Value(mnemonic),
        fullname = Value(fullname),
        fraction = Value(fraction);
  static Insertable<Commodity> custom({
    Expression<String> guid,
    Expression<String> namespace,
    Expression<String> mnemonic,
    Expression<String> fullname,
    Expression<int> fraction,
  }) {
    return RawValuesInsertable({
      if (guid != null) 'guid': guid,
      if (namespace != null) 'namespace': namespace,
      if (mnemonic != null) 'mnemonic': mnemonic,
      if (fullname != null) 'fullname': fullname,
      if (fraction != null) 'fraction': fraction,
    });
  }

  CommoditiesCompanion copyWith(
      {Value<String> guid,
      Value<String> namespace,
      Value<String> mnemonic,
      Value<String> fullname,
      Value<int> fraction}) {
    return CommoditiesCompanion(
      guid: guid ?? this.guid,
      namespace: namespace ?? this.namespace,
      mnemonic: mnemonic ?? this.mnemonic,
      fullname: fullname ?? this.fullname,
      fraction: fraction ?? this.fraction,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (namespace.present) {
      map['namespace'] = Variable<String>(namespace.value);
    }
    if (mnemonic.present) {
      map['mnemonic'] = Variable<String>(mnemonic.value);
    }
    if (fullname.present) {
      map['fullname'] = Variable<String>(fullname.value);
    }
    if (fraction.present) {
      map['fraction'] = Variable<int>(fraction.value);
    }
    return map;
  }
}

class $CommoditiesTable extends Commodities
    with TableInfo<$CommoditiesTable, Commodity> {
  final GeneratedDatabase _db;
  final String _alias;
  $CommoditiesTable(this._db, [this._alias]);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  @override
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn('guid', $tableName, false, maxTextLength: 32);
  }

  final VerificationMeta _namespaceMeta = const VerificationMeta('namespace');
  GeneratedTextColumn _namespace;
  @override
  GeneratedTextColumn get namespace => _namespace ??= _constructNamespace();
  GeneratedTextColumn _constructNamespace() {
    return GeneratedTextColumn('namespace', $tableName, false,
        maxTextLength: 2048);
  }

  final VerificationMeta _mnemonicMeta = const VerificationMeta('mnemonic');
  GeneratedTextColumn _mnemonic;
  @override
  GeneratedTextColumn get mnemonic => _mnemonic ??= _constructMnemonic();
  GeneratedTextColumn _constructMnemonic() {
    return GeneratedTextColumn('mnemonic', $tableName, false,
        maxTextLength: 2048);
  }

  final VerificationMeta _fullnameMeta = const VerificationMeta('fullname');
  GeneratedTextColumn _fullname;
  @override
  GeneratedTextColumn get fullname => _fullname ??= _constructFullname();
  GeneratedTextColumn _constructFullname() {
    return GeneratedTextColumn('fullname', $tableName, false,
        maxTextLength: 2048);
  }

  final VerificationMeta _fractionMeta = const VerificationMeta('fraction');
  GeneratedIntColumn _fraction;
  @override
  GeneratedIntColumn get fraction => _fraction ??= _constructFraction();
  GeneratedIntColumn _constructFraction() {
    return GeneratedIntColumn(
      'fraction',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [guid, namespace, mnemonic, fullname, fraction];
  @override
  $CommoditiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'commodities';
  @override
  final String actualTableName = 'commodities';
  @override
  VerificationContext validateIntegrity(Insertable<Commodity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid'], _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('namespace')) {
      context.handle(_namespaceMeta,
          namespace.isAcceptableOrUnknown(data['namespace'], _namespaceMeta));
    } else if (isInserting) {
      context.missing(_namespaceMeta);
    }
    if (data.containsKey('mnemonic')) {
      context.handle(_mnemonicMeta,
          mnemonic.isAcceptableOrUnknown(data['mnemonic'], _mnemonicMeta));
    } else if (isInserting) {
      context.missing(_mnemonicMeta);
    }
    if (data.containsKey('fullname')) {
      context.handle(_fullnameMeta,
          fullname.isAcceptableOrUnknown(data['fullname'], _fullnameMeta));
    } else if (isInserting) {
      context.missing(_fullnameMeta);
    }
    if (data.containsKey('fraction')) {
      context.handle(_fractionMeta,
          fraction.isAcceptableOrUnknown(data['fraction'], _fractionMeta));
    } else if (isInserting) {
      context.missing(_fractionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guid};
  @override
  Commodity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Commodity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CommoditiesTable createAlias(String alias) {
    return $CommoditiesTable(_db, alias);
  }
}

class Price extends DataClass implements Insertable<Price> {
  final String guid;
  final String commodity_guid;
  final String currency_guid;
  final String date;
  final int value_num;
  final int value_denom;
  Price(
      {@required this.guid,
      @required this.commodity_guid,
      @required this.currency_guid,
      @required this.date,
      @required this.value_num,
      @required this.value_denom});
  factory Price.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Price(
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      commodity_guid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}commodity_guid']),
      currency_guid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}currency_guid']),
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      value_num:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}value_num']),
      value_denom: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}value_denom']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || guid != null) {
      map['guid'] = Variable<String>(guid);
    }
    if (!nullToAbsent || commodity_guid != null) {
      map['commodity_guid'] = Variable<String>(commodity_guid);
    }
    if (!nullToAbsent || currency_guid != null) {
      map['currency_guid'] = Variable<String>(currency_guid);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || value_num != null) {
      map['value_num'] = Variable<int>(value_num);
    }
    if (!nullToAbsent || value_denom != null) {
      map['value_denom'] = Variable<int>(value_denom);
    }
    return map;
  }

  PricesCompanion toCompanion(bool nullToAbsent) {
    return PricesCompanion(
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      commodity_guid: commodity_guid == null && nullToAbsent
          ? const Value.absent()
          : Value(commodity_guid),
      currency_guid: currency_guid == null && nullToAbsent
          ? const Value.absent()
          : Value(currency_guid),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      value_num: value_num == null && nullToAbsent
          ? const Value.absent()
          : Value(value_num),
      value_denom: value_denom == null && nullToAbsent
          ? const Value.absent()
          : Value(value_denom),
    );
  }

  factory Price.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Price(
      guid: serializer.fromJson<String>(json['guid']),
      commodity_guid: serializer.fromJson<String>(json['commodity_guid']),
      currency_guid: serializer.fromJson<String>(json['currency_guid']),
      date: serializer.fromJson<String>(json['date']),
      value_num: serializer.fromJson<int>(json['value_num']),
      value_denom: serializer.fromJson<int>(json['value_denom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guid': serializer.toJson<String>(guid),
      'commodity_guid': serializer.toJson<String>(commodity_guid),
      'currency_guid': serializer.toJson<String>(currency_guid),
      'date': serializer.toJson<String>(date),
      'value_num': serializer.toJson<int>(value_num),
      'value_denom': serializer.toJson<int>(value_denom),
    };
  }

  Price copyWith(
          {String guid,
          String commodity_guid,
          String currency_guid,
          String date,
          int value_num,
          int value_denom}) =>
      Price(
        guid: guid ?? this.guid,
        commodity_guid: commodity_guid ?? this.commodity_guid,
        currency_guid: currency_guid ?? this.currency_guid,
        date: date ?? this.date,
        value_num: value_num ?? this.value_num,
        value_denom: value_denom ?? this.value_denom,
      );
  @override
  String toString() {
    return (StringBuffer('Price(')
          ..write('guid: $guid, ')
          ..write('commodity_guid: $commodity_guid, ')
          ..write('currency_guid: $currency_guid, ')
          ..write('date: $date, ')
          ..write('value_num: $value_num, ')
          ..write('value_denom: $value_denom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      guid.hashCode,
      $mrjc(
          commodity_guid.hashCode,
          $mrjc(
              currency_guid.hashCode,
              $mrjc(date.hashCode,
                  $mrjc(value_num.hashCode, value_denom.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Price &&
          other.guid == this.guid &&
          other.commodity_guid == this.commodity_guid &&
          other.currency_guid == this.currency_guid &&
          other.date == this.date &&
          other.value_num == this.value_num &&
          other.value_denom == this.value_denom);
}

class PricesCompanion extends UpdateCompanion<Price> {
  final Value<String> guid;
  final Value<String> commodity_guid;
  final Value<String> currency_guid;
  final Value<String> date;
  final Value<int> value_num;
  final Value<int> value_denom;
  const PricesCompanion({
    this.guid = const Value.absent(),
    this.commodity_guid = const Value.absent(),
    this.currency_guid = const Value.absent(),
    this.date = const Value.absent(),
    this.value_num = const Value.absent(),
    this.value_denom = const Value.absent(),
  });
  PricesCompanion.insert({
    @required String guid,
    @required String commodity_guid,
    @required String currency_guid,
    @required String date,
    @required int value_num,
    @required int value_denom,
  })  : guid = Value(guid),
        commodity_guid = Value(commodity_guid),
        currency_guid = Value(currency_guid),
        date = Value(date),
        value_num = Value(value_num),
        value_denom = Value(value_denom);
  static Insertable<Price> custom({
    Expression<String> guid,
    Expression<String> commodity_guid,
    Expression<String> currency_guid,
    Expression<String> date,
    Expression<int> value_num,
    Expression<int> value_denom,
  }) {
    return RawValuesInsertable({
      if (guid != null) 'guid': guid,
      if (commodity_guid != null) 'commodity_guid': commodity_guid,
      if (currency_guid != null) 'currency_guid': currency_guid,
      if (date != null) 'date': date,
      if (value_num != null) 'value_num': value_num,
      if (value_denom != null) 'value_denom': value_denom,
    });
  }

  PricesCompanion copyWith(
      {Value<String> guid,
      Value<String> commodity_guid,
      Value<String> currency_guid,
      Value<String> date,
      Value<int> value_num,
      Value<int> value_denom}) {
    return PricesCompanion(
      guid: guid ?? this.guid,
      commodity_guid: commodity_guid ?? this.commodity_guid,
      currency_guid: currency_guid ?? this.currency_guid,
      date: date ?? this.date,
      value_num: value_num ?? this.value_num,
      value_denom: value_denom ?? this.value_denom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (commodity_guid.present) {
      map['commodity_guid'] = Variable<String>(commodity_guid.value);
    }
    if (currency_guid.present) {
      map['currency_guid'] = Variable<String>(currency_guid.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (value_num.present) {
      map['value_num'] = Variable<int>(value_num.value);
    }
    if (value_denom.present) {
      map['value_denom'] = Variable<int>(value_denom.value);
    }
    return map;
  }
}

class $PricesTable extends Prices with TableInfo<$PricesTable, Price> {
  final GeneratedDatabase _db;
  final String _alias;
  $PricesTable(this._db, [this._alias]);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  @override
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn('guid', $tableName, false, maxTextLength: 32);
  }

  final VerificationMeta _commodity_guidMeta =
      const VerificationMeta('commodity_guid');
  GeneratedTextColumn _commodity_guid;
  @override
  GeneratedTextColumn get commodity_guid =>
      _commodity_guid ??= _constructCommodityGuid();
  GeneratedTextColumn _constructCommodityGuid() {
    return GeneratedTextColumn('commodity_guid', $tableName, false,
        maxTextLength: 32);
  }

  final VerificationMeta _currency_guidMeta =
      const VerificationMeta('currency_guid');
  GeneratedTextColumn _currency_guid;
  @override
  GeneratedTextColumn get currency_guid =>
      _currency_guid ??= _constructCurrencyGuid();
  GeneratedTextColumn _constructCurrencyGuid() {
    return GeneratedTextColumn('currency_guid', $tableName, false,
        maxTextLength: 32);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn('date', $tableName, false, maxTextLength: 19);
  }

  final VerificationMeta _value_numMeta = const VerificationMeta('value_num');
  GeneratedIntColumn _value_num;
  @override
  GeneratedIntColumn get value_num => _value_num ??= _constructValueNum();
  GeneratedIntColumn _constructValueNum() {
    return GeneratedIntColumn(
      'value_num',
      $tableName,
      false,
    );
  }

  final VerificationMeta _value_denomMeta =
      const VerificationMeta('value_denom');
  GeneratedIntColumn _value_denom;
  @override
  GeneratedIntColumn get value_denom => _value_denom ??= _constructValueDenom();
  GeneratedIntColumn _constructValueDenom() {
    return GeneratedIntColumn(
      'value_denom',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [guid, commodity_guid, currency_guid, date, value_num, value_denom];
  @override
  $PricesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'prices';
  @override
  final String actualTableName = 'prices';
  @override
  VerificationContext validateIntegrity(Insertable<Price> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid'], _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('commodity_guid')) {
      context.handle(
          _commodity_guidMeta,
          commodity_guid.isAcceptableOrUnknown(
              data['commodity_guid'], _commodity_guidMeta));
    } else if (isInserting) {
      context.missing(_commodity_guidMeta);
    }
    if (data.containsKey('currency_guid')) {
      context.handle(
          _currency_guidMeta,
          currency_guid.isAcceptableOrUnknown(
              data['currency_guid'], _currency_guidMeta));
    } else if (isInserting) {
      context.missing(_currency_guidMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('value_num')) {
      context.handle(_value_numMeta,
          value_num.isAcceptableOrUnknown(data['value_num'], _value_numMeta));
    } else if (isInserting) {
      context.missing(_value_numMeta);
    }
    if (data.containsKey('value_denom')) {
      context.handle(
          _value_denomMeta,
          value_denom.isAcceptableOrUnknown(
              data['value_denom'], _value_denomMeta));
    } else if (isInserting) {
      context.missing(_value_denomMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guid};
  @override
  Price map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Price.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PricesTable createAlias(String alias) {
    return $PricesTable(_db, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final String guid;
  final String parent_guid;
  final String name;
  final String account_type;
  final String commodity_guid;
  final int commodity_scu;
  final int non_std_scu;
  Account(
      {@required this.guid,
      @required this.parent_guid,
      @required this.name,
      @required this.account_type,
      @required this.commodity_guid,
      @required this.commodity_scu,
      @required this.non_std_scu});
  factory Account.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Account(
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      parent_guid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_guid']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      account_type: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_type']),
      commodity_guid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}commodity_guid']),
      commodity_scu: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}commodity_scu']),
      non_std_scu: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}non_std_scu']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || guid != null) {
      map['guid'] = Variable<String>(guid);
    }
    if (!nullToAbsent || parent_guid != null) {
      map['parent_guid'] = Variable<String>(parent_guid);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || account_type != null) {
      map['account_type'] = Variable<String>(account_type);
    }
    if (!nullToAbsent || commodity_guid != null) {
      map['commodity_guid'] = Variable<String>(commodity_guid);
    }
    if (!nullToAbsent || commodity_scu != null) {
      map['commodity_scu'] = Variable<int>(commodity_scu);
    }
    if (!nullToAbsent || non_std_scu != null) {
      map['non_std_scu'] = Variable<int>(non_std_scu);
    }
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      parent_guid: parent_guid == null && nullToAbsent
          ? const Value.absent()
          : Value(parent_guid),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      account_type: account_type == null && nullToAbsent
          ? const Value.absent()
          : Value(account_type),
      commodity_guid: commodity_guid == null && nullToAbsent
          ? const Value.absent()
          : Value(commodity_guid),
      commodity_scu: commodity_scu == null && nullToAbsent
          ? const Value.absent()
          : Value(commodity_scu),
      non_std_scu: non_std_scu == null && nullToAbsent
          ? const Value.absent()
          : Value(non_std_scu),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Account(
      guid: serializer.fromJson<String>(json['guid']),
      parent_guid: serializer.fromJson<String>(json['parent_guid']),
      name: serializer.fromJson<String>(json['name']),
      account_type: serializer.fromJson<String>(json['account_type']),
      commodity_guid: serializer.fromJson<String>(json['commodity_guid']),
      commodity_scu: serializer.fromJson<int>(json['commodity_scu']),
      non_std_scu: serializer.fromJson<int>(json['non_std_scu']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guid': serializer.toJson<String>(guid),
      'parent_guid': serializer.toJson<String>(parent_guid),
      'name': serializer.toJson<String>(name),
      'account_type': serializer.toJson<String>(account_type),
      'commodity_guid': serializer.toJson<String>(commodity_guid),
      'commodity_scu': serializer.toJson<int>(commodity_scu),
      'non_std_scu': serializer.toJson<int>(non_std_scu),
    };
  }

  Account copyWith(
          {String guid,
          String parent_guid,
          String name,
          String account_type,
          String commodity_guid,
          int commodity_scu,
          int non_std_scu}) =>
      Account(
        guid: guid ?? this.guid,
        parent_guid: parent_guid ?? this.parent_guid,
        name: name ?? this.name,
        account_type: account_type ?? this.account_type,
        commodity_guid: commodity_guid ?? this.commodity_guid,
        commodity_scu: commodity_scu ?? this.commodity_scu,
        non_std_scu: non_std_scu ?? this.non_std_scu,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('guid: $guid, ')
          ..write('parent_guid: $parent_guid, ')
          ..write('name: $name, ')
          ..write('account_type: $account_type, ')
          ..write('commodity_guid: $commodity_guid, ')
          ..write('commodity_scu: $commodity_scu, ')
          ..write('non_std_scu: $non_std_scu')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      guid.hashCode,
      $mrjc(
          parent_guid.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  account_type.hashCode,
                  $mrjc(commodity_guid.hashCode,
                      $mrjc(commodity_scu.hashCode, non_std_scu.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Account &&
          other.guid == this.guid &&
          other.parent_guid == this.parent_guid &&
          other.name == this.name &&
          other.account_type == this.account_type &&
          other.commodity_guid == this.commodity_guid &&
          other.commodity_scu == this.commodity_scu &&
          other.non_std_scu == this.non_std_scu);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<String> guid;
  final Value<String> parent_guid;
  final Value<String> name;
  final Value<String> account_type;
  final Value<String> commodity_guid;
  final Value<int> commodity_scu;
  final Value<int> non_std_scu;
  const AccountsCompanion({
    this.guid = const Value.absent(),
    this.parent_guid = const Value.absent(),
    this.name = const Value.absent(),
    this.account_type = const Value.absent(),
    this.commodity_guid = const Value.absent(),
    this.commodity_scu = const Value.absent(),
    this.non_std_scu = const Value.absent(),
  });
  AccountsCompanion.insert({
    @required String guid,
    @required String parent_guid,
    @required String name,
    @required String account_type,
    @required String commodity_guid,
    @required int commodity_scu,
    @required int non_std_scu,
  })  : guid = Value(guid),
        parent_guid = Value(parent_guid),
        name = Value(name),
        account_type = Value(account_type),
        commodity_guid = Value(commodity_guid),
        commodity_scu = Value(commodity_scu),
        non_std_scu = Value(non_std_scu);
  static Insertable<Account> custom({
    Expression<String> guid,
    Expression<String> parent_guid,
    Expression<String> name,
    Expression<String> account_type,
    Expression<String> commodity_guid,
    Expression<int> commodity_scu,
    Expression<int> non_std_scu,
  }) {
    return RawValuesInsertable({
      if (guid != null) 'guid': guid,
      if (parent_guid != null) 'parent_guid': parent_guid,
      if (name != null) 'name': name,
      if (account_type != null) 'account_type': account_type,
      if (commodity_guid != null) 'commodity_guid': commodity_guid,
      if (commodity_scu != null) 'commodity_scu': commodity_scu,
      if (non_std_scu != null) 'non_std_scu': non_std_scu,
    });
  }

  AccountsCompanion copyWith(
      {Value<String> guid,
      Value<String> parent_guid,
      Value<String> name,
      Value<String> account_type,
      Value<String> commodity_guid,
      Value<int> commodity_scu,
      Value<int> non_std_scu}) {
    return AccountsCompanion(
      guid: guid ?? this.guid,
      parent_guid: parent_guid ?? this.parent_guid,
      name: name ?? this.name,
      account_type: account_type ?? this.account_type,
      commodity_guid: commodity_guid ?? this.commodity_guid,
      commodity_scu: commodity_scu ?? this.commodity_scu,
      non_std_scu: non_std_scu ?? this.non_std_scu,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (parent_guid.present) {
      map['parent_guid'] = Variable<String>(parent_guid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (account_type.present) {
      map['account_type'] = Variable<String>(account_type.value);
    }
    if (commodity_guid.present) {
      map['commodity_guid'] = Variable<String>(commodity_guid.value);
    }
    if (commodity_scu.present) {
      map['commodity_scu'] = Variable<int>(commodity_scu.value);
    }
    if (non_std_scu.present) {
      map['non_std_scu'] = Variable<int>(non_std_scu.value);
    }
    return map;
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  final GeneratedDatabase _db;
  final String _alias;
  $AccountsTable(this._db, [this._alias]);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  @override
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn('guid', $tableName, false, maxTextLength: 32);
  }

  final VerificationMeta _parent_guidMeta =
      const VerificationMeta('parent_guid');
  GeneratedTextColumn _parent_guid;
  @override
  GeneratedTextColumn get parent_guid =>
      _parent_guid ??= _constructParentGuid();
  GeneratedTextColumn _constructParentGuid() {
    return GeneratedTextColumn('parent_guid', $tableName, false,
        maxTextLength: 32);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, maxTextLength: 2048);
  }

  final VerificationMeta _account_typeMeta =
      const VerificationMeta('account_type');
  GeneratedTextColumn _account_type;
  @override
  GeneratedTextColumn get account_type =>
      _account_type ??= _constructAccountType();
  GeneratedTextColumn _constructAccountType() {
    return GeneratedTextColumn('account_type', $tableName, false,
        maxTextLength: 2048);
  }

  final VerificationMeta _commodity_guidMeta =
      const VerificationMeta('commodity_guid');
  GeneratedTextColumn _commodity_guid;
  @override
  GeneratedTextColumn get commodity_guid =>
      _commodity_guid ??= _constructCommodityGuid();
  GeneratedTextColumn _constructCommodityGuid() {
    return GeneratedTextColumn('commodity_guid', $tableName, false,
        maxTextLength: 32);
  }

  final VerificationMeta _commodity_scuMeta =
      const VerificationMeta('commodity_scu');
  GeneratedIntColumn _commodity_scu;
  @override
  GeneratedIntColumn get commodity_scu =>
      _commodity_scu ??= _constructCommodityScu();
  GeneratedIntColumn _constructCommodityScu() {
    return GeneratedIntColumn(
      'commodity_scu',
      $tableName,
      false,
    );
  }

  final VerificationMeta _non_std_scuMeta =
      const VerificationMeta('non_std_scu');
  GeneratedIntColumn _non_std_scu;
  @override
  GeneratedIntColumn get non_std_scu => _non_std_scu ??= _constructNonStdScu();
  GeneratedIntColumn _constructNonStdScu() {
    return GeneratedIntColumn(
      'non_std_scu',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        guid,
        parent_guid,
        name,
        account_type,
        commodity_guid,
        commodity_scu,
        non_std_scu
      ];
  @override
  $AccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'accounts';
  @override
  final String actualTableName = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid'], _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('parent_guid')) {
      context.handle(
          _parent_guidMeta,
          parent_guid.isAcceptableOrUnknown(
              data['parent_guid'], _parent_guidMeta));
    } else if (isInserting) {
      context.missing(_parent_guidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('account_type')) {
      context.handle(
          _account_typeMeta,
          account_type.isAcceptableOrUnknown(
              data['account_type'], _account_typeMeta));
    } else if (isInserting) {
      context.missing(_account_typeMeta);
    }
    if (data.containsKey('commodity_guid')) {
      context.handle(
          _commodity_guidMeta,
          commodity_guid.isAcceptableOrUnknown(
              data['commodity_guid'], _commodity_guidMeta));
    } else if (isInserting) {
      context.missing(_commodity_guidMeta);
    }
    if (data.containsKey('commodity_scu')) {
      context.handle(
          _commodity_scuMeta,
          commodity_scu.isAcceptableOrUnknown(
              data['commodity_scu'], _commodity_scuMeta));
    } else if (isInserting) {
      context.missing(_commodity_scuMeta);
    }
    if (data.containsKey('non_std_scu')) {
      context.handle(
          _non_std_scuMeta,
          non_std_scu.isAcceptableOrUnknown(
              data['non_std_scu'], _non_std_scuMeta));
    } else if (isInserting) {
      context.missing(_non_std_scuMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guid};
  @override
  Account map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Account.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(_db, alias);
  }
}

class Split extends DataClass implements Insertable<Split> {
  final String guid;
  final String tx_guid;
  final String account_guid;
  final String memo;
  final String action;
  final int value_num;
  final int value_denom;
  final int quantity_num;
  final int quantity_denom;
  Split(
      {@required this.guid,
      @required this.tx_guid,
      @required this.account_guid,
      @required this.memo,
      @required this.action,
      @required this.value_num,
      @required this.value_denom,
      @required this.quantity_num,
      @required this.quantity_denom});
  factory Split.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Split(
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      tx_guid:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tx_guid']),
      account_guid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_guid']),
      memo: stringType.mapFromDatabaseResponse(data['${effectivePrefix}memo']),
      action:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}action']),
      value_num:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}value_num']),
      value_denom: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}value_denom']),
      quantity_num: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity_num']),
      quantity_denom: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity_denom']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || guid != null) {
      map['guid'] = Variable<String>(guid);
    }
    if (!nullToAbsent || tx_guid != null) {
      map['tx_guid'] = Variable<String>(tx_guid);
    }
    if (!nullToAbsent || account_guid != null) {
      map['account_guid'] = Variable<String>(account_guid);
    }
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    if (!nullToAbsent || action != null) {
      map['action'] = Variable<String>(action);
    }
    if (!nullToAbsent || value_num != null) {
      map['value_num'] = Variable<int>(value_num);
    }
    if (!nullToAbsent || value_denom != null) {
      map['value_denom'] = Variable<int>(value_denom);
    }
    if (!nullToAbsent || quantity_num != null) {
      map['quantity_num'] = Variable<int>(quantity_num);
    }
    if (!nullToAbsent || quantity_denom != null) {
      map['quantity_denom'] = Variable<int>(quantity_denom);
    }
    return map;
  }

  SplitsCompanion toCompanion(bool nullToAbsent) {
    return SplitsCompanion(
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      tx_guid: tx_guid == null && nullToAbsent
          ? const Value.absent()
          : Value(tx_guid),
      account_guid: account_guid == null && nullToAbsent
          ? const Value.absent()
          : Value(account_guid),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      action:
          action == null && nullToAbsent ? const Value.absent() : Value(action),
      value_num: value_num == null && nullToAbsent
          ? const Value.absent()
          : Value(value_num),
      value_denom: value_denom == null && nullToAbsent
          ? const Value.absent()
          : Value(value_denom),
      quantity_num: quantity_num == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity_num),
      quantity_denom: quantity_denom == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity_denom),
    );
  }

  factory Split.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Split(
      guid: serializer.fromJson<String>(json['guid']),
      tx_guid: serializer.fromJson<String>(json['tx_guid']),
      account_guid: serializer.fromJson<String>(json['account_guid']),
      memo: serializer.fromJson<String>(json['memo']),
      action: serializer.fromJson<String>(json['action']),
      value_num: serializer.fromJson<int>(json['value_num']),
      value_denom: serializer.fromJson<int>(json['value_denom']),
      quantity_num: serializer.fromJson<int>(json['quantity_num']),
      quantity_denom: serializer.fromJson<int>(json['quantity_denom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guid': serializer.toJson<String>(guid),
      'tx_guid': serializer.toJson<String>(tx_guid),
      'account_guid': serializer.toJson<String>(account_guid),
      'memo': serializer.toJson<String>(memo),
      'action': serializer.toJson<String>(action),
      'value_num': serializer.toJson<int>(value_num),
      'value_denom': serializer.toJson<int>(value_denom),
      'quantity_num': serializer.toJson<int>(quantity_num),
      'quantity_denom': serializer.toJson<int>(quantity_denom),
    };
  }

  Split copyWith(
          {String guid,
          String tx_guid,
          String account_guid,
          String memo,
          String action,
          int value_num,
          int value_denom,
          int quantity_num,
          int quantity_denom}) =>
      Split(
        guid: guid ?? this.guid,
        tx_guid: tx_guid ?? this.tx_guid,
        account_guid: account_guid ?? this.account_guid,
        memo: memo ?? this.memo,
        action: action ?? this.action,
        value_num: value_num ?? this.value_num,
        value_denom: value_denom ?? this.value_denom,
        quantity_num: quantity_num ?? this.quantity_num,
        quantity_denom: quantity_denom ?? this.quantity_denom,
      );
  @override
  String toString() {
    return (StringBuffer('Split(')
          ..write('guid: $guid, ')
          ..write('tx_guid: $tx_guid, ')
          ..write('account_guid: $account_guid, ')
          ..write('memo: $memo, ')
          ..write('action: $action, ')
          ..write('value_num: $value_num, ')
          ..write('value_denom: $value_denom, ')
          ..write('quantity_num: $quantity_num, ')
          ..write('quantity_denom: $quantity_denom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      guid.hashCode,
      $mrjc(
          tx_guid.hashCode,
          $mrjc(
              account_guid.hashCode,
              $mrjc(
                  memo.hashCode,
                  $mrjc(
                      action.hashCode,
                      $mrjc(
                          value_num.hashCode,
                          $mrjc(
                              value_denom.hashCode,
                              $mrjc(quantity_num.hashCode,
                                  quantity_denom.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Split &&
          other.guid == this.guid &&
          other.tx_guid == this.tx_guid &&
          other.account_guid == this.account_guid &&
          other.memo == this.memo &&
          other.action == this.action &&
          other.value_num == this.value_num &&
          other.value_denom == this.value_denom &&
          other.quantity_num == this.quantity_num &&
          other.quantity_denom == this.quantity_denom);
}

class SplitsCompanion extends UpdateCompanion<Split> {
  final Value<String> guid;
  final Value<String> tx_guid;
  final Value<String> account_guid;
  final Value<String> memo;
  final Value<String> action;
  final Value<int> value_num;
  final Value<int> value_denom;
  final Value<int> quantity_num;
  final Value<int> quantity_denom;
  const SplitsCompanion({
    this.guid = const Value.absent(),
    this.tx_guid = const Value.absent(),
    this.account_guid = const Value.absent(),
    this.memo = const Value.absent(),
    this.action = const Value.absent(),
    this.value_num = const Value.absent(),
    this.value_denom = const Value.absent(),
    this.quantity_num = const Value.absent(),
    this.quantity_denom = const Value.absent(),
  });
  SplitsCompanion.insert({
    @required String guid,
    @required String tx_guid,
    @required String account_guid,
    @required String memo,
    @required String action,
    @required int value_num,
    @required int value_denom,
    @required int quantity_num,
    @required int quantity_denom,
  })  : guid = Value(guid),
        tx_guid = Value(tx_guid),
        account_guid = Value(account_guid),
        memo = Value(memo),
        action = Value(action),
        value_num = Value(value_num),
        value_denom = Value(value_denom),
        quantity_num = Value(quantity_num),
        quantity_denom = Value(quantity_denom);
  static Insertable<Split> custom({
    Expression<String> guid,
    Expression<String> tx_guid,
    Expression<String> account_guid,
    Expression<String> memo,
    Expression<String> action,
    Expression<int> value_num,
    Expression<int> value_denom,
    Expression<int> quantity_num,
    Expression<int> quantity_denom,
  }) {
    return RawValuesInsertable({
      if (guid != null) 'guid': guid,
      if (tx_guid != null) 'tx_guid': tx_guid,
      if (account_guid != null) 'account_guid': account_guid,
      if (memo != null) 'memo': memo,
      if (action != null) 'action': action,
      if (value_num != null) 'value_num': value_num,
      if (value_denom != null) 'value_denom': value_denom,
      if (quantity_num != null) 'quantity_num': quantity_num,
      if (quantity_denom != null) 'quantity_denom': quantity_denom,
    });
  }

  SplitsCompanion copyWith(
      {Value<String> guid,
      Value<String> tx_guid,
      Value<String> account_guid,
      Value<String> memo,
      Value<String> action,
      Value<int> value_num,
      Value<int> value_denom,
      Value<int> quantity_num,
      Value<int> quantity_denom}) {
    return SplitsCompanion(
      guid: guid ?? this.guid,
      tx_guid: tx_guid ?? this.tx_guid,
      account_guid: account_guid ?? this.account_guid,
      memo: memo ?? this.memo,
      action: action ?? this.action,
      value_num: value_num ?? this.value_num,
      value_denom: value_denom ?? this.value_denom,
      quantity_num: quantity_num ?? this.quantity_num,
      quantity_denom: quantity_denom ?? this.quantity_denom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (tx_guid.present) {
      map['tx_guid'] = Variable<String>(tx_guid.value);
    }
    if (account_guid.present) {
      map['account_guid'] = Variable<String>(account_guid.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (value_num.present) {
      map['value_num'] = Variable<int>(value_num.value);
    }
    if (value_denom.present) {
      map['value_denom'] = Variable<int>(value_denom.value);
    }
    if (quantity_num.present) {
      map['quantity_num'] = Variable<int>(quantity_num.value);
    }
    if (quantity_denom.present) {
      map['quantity_denom'] = Variable<int>(quantity_denom.value);
    }
    return map;
  }
}

class $SplitsTable extends Splits with TableInfo<$SplitsTable, Split> {
  final GeneratedDatabase _db;
  final String _alias;
  $SplitsTable(this._db, [this._alias]);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  @override
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn('guid', $tableName, false, maxTextLength: 32);
  }

  final VerificationMeta _tx_guidMeta = const VerificationMeta('tx_guid');
  GeneratedTextColumn _tx_guid;
  @override
  GeneratedTextColumn get tx_guid => _tx_guid ??= _constructTxGuid();
  GeneratedTextColumn _constructTxGuid() {
    return GeneratedTextColumn('tx_guid', $tableName, false, maxTextLength: 32);
  }

  final VerificationMeta _account_guidMeta =
      const VerificationMeta('account_guid');
  GeneratedTextColumn _account_guid;
  @override
  GeneratedTextColumn get account_guid =>
      _account_guid ??= _constructAccountGuid();
  GeneratedTextColumn _constructAccountGuid() {
    return GeneratedTextColumn('account_guid', $tableName, false,
        maxTextLength: 32);
  }

  final VerificationMeta _memoMeta = const VerificationMeta('memo');
  GeneratedTextColumn _memo;
  @override
  GeneratedTextColumn get memo => _memo ??= _constructMemo();
  GeneratedTextColumn _constructMemo() {
    return GeneratedTextColumn('memo', $tableName, false, maxTextLength: 2048);
  }

  final VerificationMeta _actionMeta = const VerificationMeta('action');
  GeneratedTextColumn _action;
  @override
  GeneratedTextColumn get action => _action ??= _constructAction();
  GeneratedTextColumn _constructAction() {
    return GeneratedTextColumn('action', $tableName, false,
        maxTextLength: 2048);
  }

  final VerificationMeta _value_numMeta = const VerificationMeta('value_num');
  GeneratedIntColumn _value_num;
  @override
  GeneratedIntColumn get value_num => _value_num ??= _constructValueNum();
  GeneratedIntColumn _constructValueNum() {
    return GeneratedIntColumn(
      'value_num',
      $tableName,
      false,
    );
  }

  final VerificationMeta _value_denomMeta =
      const VerificationMeta('value_denom');
  GeneratedIntColumn _value_denom;
  @override
  GeneratedIntColumn get value_denom => _value_denom ??= _constructValueDenom();
  GeneratedIntColumn _constructValueDenom() {
    return GeneratedIntColumn(
      'value_denom',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantity_numMeta =
      const VerificationMeta('quantity_num');
  GeneratedIntColumn _quantity_num;
  @override
  GeneratedIntColumn get quantity_num =>
      _quantity_num ??= _constructQuantityNum();
  GeneratedIntColumn _constructQuantityNum() {
    return GeneratedIntColumn(
      'quantity_num',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantity_denomMeta =
      const VerificationMeta('quantity_denom');
  GeneratedIntColumn _quantity_denom;
  @override
  GeneratedIntColumn get quantity_denom =>
      _quantity_denom ??= _constructQuantityDenom();
  GeneratedIntColumn _constructQuantityDenom() {
    return GeneratedIntColumn(
      'quantity_denom',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        guid,
        tx_guid,
        account_guid,
        memo,
        action,
        value_num,
        value_denom,
        quantity_num,
        quantity_denom
      ];
  @override
  $SplitsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'splits';
  @override
  final String actualTableName = 'splits';
  @override
  VerificationContext validateIntegrity(Insertable<Split> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid'], _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('tx_guid')) {
      context.handle(_tx_guidMeta,
          tx_guid.isAcceptableOrUnknown(data['tx_guid'], _tx_guidMeta));
    } else if (isInserting) {
      context.missing(_tx_guidMeta);
    }
    if (data.containsKey('account_guid')) {
      context.handle(
          _account_guidMeta,
          account_guid.isAcceptableOrUnknown(
              data['account_guid'], _account_guidMeta));
    } else if (isInserting) {
      context.missing(_account_guidMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo'], _memoMeta));
    } else if (isInserting) {
      context.missing(_memoMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action'], _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('value_num')) {
      context.handle(_value_numMeta,
          value_num.isAcceptableOrUnknown(data['value_num'], _value_numMeta));
    } else if (isInserting) {
      context.missing(_value_numMeta);
    }
    if (data.containsKey('value_denom')) {
      context.handle(
          _value_denomMeta,
          value_denom.isAcceptableOrUnknown(
              data['value_denom'], _value_denomMeta));
    } else if (isInserting) {
      context.missing(_value_denomMeta);
    }
    if (data.containsKey('quantity_num')) {
      context.handle(
          _quantity_numMeta,
          quantity_num.isAcceptableOrUnknown(
              data['quantity_num'], _quantity_numMeta));
    } else if (isInserting) {
      context.missing(_quantity_numMeta);
    }
    if (data.containsKey('quantity_denom')) {
      context.handle(
          _quantity_denomMeta,
          quantity_denom.isAcceptableOrUnknown(
              data['quantity_denom'], _quantity_denomMeta));
    } else if (isInserting) {
      context.missing(_quantity_denomMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guid};
  @override
  Split map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Split.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SplitsTable createAlias(String alias) {
    return $SplitsTable(_db, alias);
  }
}

abstract class _$GncDatabase extends GeneratedDatabase {
  _$GncDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CommoditiesTable _commodities;
  $CommoditiesTable get commodities => _commodities ??= $CommoditiesTable(this);
  $PricesTable _prices;
  $PricesTable get prices => _prices ??= $PricesTable(this);
  $AccountsTable _accounts;
  $AccountsTable get accounts => _accounts ??= $AccountsTable(this);
  $SplitsTable _splits;
  $SplitsTable get splits => _splits ??= $SplitsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [commodities, prices, accounts, splits];
}
