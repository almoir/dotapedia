class HeroModel {
  num? id;
  String? name;
  String? localizedName;
  String? primaryAttr;
  String? attackType;
  List<String>? roles;
  String? img;
  String? icon;
  num? baseHealth;
  num? baseHealthRegen;
  num? baseMana;
  num? baseManaRegen;
  num? baseArmor;
  num? baseMr;
  num? baseAttackMin;
  num? baseAttackMax;
  num? baseStr;
  num? baseAgi;
  num? baseInt;
  num? strGain;
  num? agiGain;
  num? intGain;
  num? attackRange;
  num? projectileSpeed;
  num? attackRate;
  num? baseAttackTime;
  num? attackPoint;
  num? moveSpeed;
  num? turnRate;
  bool? cmEnabled;
  num? legs;
  num? dayVision;
  num? nightVision;
  num? heroId;
  num? turboPicks;
  num? turboWins;
  num? proBan;
  num? proWin;
  num? proPick;
  num? i1Pick;
  num? i1Win;
  num? i2Pick;
  num? i2Win;
  num? i3Pick;
  num? i3Win;
  num? i4Pick;
  num? i4Win;
  num? i5Pick;
  num? i5Win;
  num? i6Pick;
  num? i6Win;
  num? i7Pick;
  num? i7Win;
  num? i8Pick;
  num? i8Win;
  num? nullPick;
  num? nullWin;

  HeroModel(
      {this.id,
      this.name,
      this.localizedName,
      this.primaryAttr,
      this.attackType,
      this.roles,
      this.img,
      this.icon,
      this.baseHealth,
      this.baseHealthRegen,
      this.baseMana,
      this.baseManaRegen,
      this.baseArmor,
      this.baseMr,
      this.baseAttackMin,
      this.baseAttackMax,
      this.baseStr,
      this.baseAgi,
      this.baseInt,
      this.strGain,
      this.agiGain,
      this.intGain,
      this.attackRange,
      this.projectileSpeed,
      this.attackRate,
      this.baseAttackTime,
      this.attackPoint,
      this.moveSpeed,
      this.turnRate,
      this.cmEnabled,
      this.legs,
      this.dayVision,
      this.nightVision,
      this.heroId,
      this.turboPicks,
      this.turboWins,
      this.proBan,
      this.proWin,
      this.proPick,
      this.i1Pick,
      this.i1Win,
      this.i2Pick,
      this.i2Win,
      this.i3Pick,
      this.i3Win,
      this.i4Pick,
      this.i4Win,
      this.i5Pick,
      this.i5Win,
      this.i6Pick,
      this.i6Win,
      this.i7Pick,
      this.i7Win,
      this.i8Pick,
      this.i8Win,
      this.nullPick,
      this.nullWin});

  HeroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    primaryAttr = json['primary_attr'];
    attackType = json['attack_type'];
    roles = json['roles'].cast<String>();
    img = json['img'];
    icon = json['icon'];
    baseHealth = json['base_health'];
    baseHealthRegen = json['base_health_regen'];
    baseMana = json['base_mana'];
    baseManaRegen = json['base_mana_regen'];
    baseArmor = json['base_armor'];
    baseMr = json['base_mr'];
    baseAttackMin = json['base_attack_min'];
    baseAttackMax = json['base_attack_max'];
    baseStr = json['base_str'];
    baseAgi = json['base_agi'];
    baseInt = json['base_int'];
    strGain = json['str_gain'];
    agiGain = json['agi_gain'];
    intGain = json['int_gain'];
    attackRange = json['attack_range'];
    projectileSpeed = json['projectile_speed'];
    attackRate = json['attack_rate'];
    baseAttackTime = json['base_attack_time'];
    attackPoint = json['attack_point'];
    moveSpeed = json['move_speed'];
    turnRate = json['turn_rate'];
    cmEnabled = json['cm_enabled'];
    legs = json['legs'];
    dayVision = json['day_vision'];
    nightVision = json['night_vision'];
    heroId = json['hero_id'];
    turboPicks = json['turbo_picks'];
    turboWins = json['turbo_wins'];
    proBan = json['pro_ban'];
    proWin = json['pro_win'];
    proPick = json['pro_pick'];
    i1Pick = json['1_pick'];
    i1Win = json['1_win'];
    i2Pick = json['2_pick'];
    i2Win = json['2_win'];
    i3Pick = json['3_pick'];
    i3Win = json['3_win'];
    i4Pick = json['4_pick'];
    i4Win = json['4_win'];
    i5Pick = json['5_pick'];
    i5Win = json['5_win'];
    i6Pick = json['6_pick'];
    i6Win = json['6_win'];
    i7Pick = json['7_pick'];
    i7Win = json['7_win'];
    i8Pick = json['8_pick'];
    i8Win = json['8_win'];
    nullPick = json['null_pick'];
    nullWin = json['null_win'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['localized_name'] = localizedName;
    data['primary_attr'] = primaryAttr;
    data['attack_type'] = attackType;
    data['roles'] = roles;
    data['img'] = img;
    data['icon'] = icon;
    data['base_health'] = baseHealth;
    data['base_health_regen'] = baseHealthRegen;
    data['base_mana'] = baseMana;
    data['base_mana_regen'] = baseManaRegen;
    data['base_armor'] = baseArmor;
    data['base_mr'] = baseMr;
    data['base_attack_min'] = baseAttackMin;
    data['base_attack_max'] = baseAttackMax;
    data['base_str'] = baseStr;
    data['base_agi'] = baseAgi;
    data['base_int'] = baseInt;
    data['str_gain'] = strGain;
    data['agi_gain'] = agiGain;
    data['int_gain'] = intGain;
    data['attack_range'] = attackRange;
    data['projectile_speed'] = projectileSpeed;
    data['attack_rate'] = attackRate;
    data['base_attack_time'] = baseAttackTime;
    data['attack_point'] = attackPoint;
    data['move_speed'] = moveSpeed;
    data['turn_rate'] = turnRate;
    data['cm_enabled'] = cmEnabled;
    data['legs'] = legs;
    data['day_vision'] = dayVision;
    data['night_vision'] = nightVision;
    data['hero_id'] = heroId;
    data['turbo_picks'] = turboPicks;
    data['turbo_wins'] = turboWins;
    data['pro_ban'] = proBan;
    data['pro_win'] = proWin;
    data['pro_pick'] = proPick;
    data['1_pick'] = i1Pick;
    data['1_win'] = i1Win;
    data['2_pick'] = i2Pick;
    data['2_win'] = i2Win;
    data['3_pick'] = i3Pick;
    data['3_win'] = i3Win;
    data['4_pick'] = i4Pick;
    data['4_win'] = i4Win;
    data['5_pick'] = i5Pick;
    data['5_win'] = i5Win;
    data['6_pick'] = i6Pick;
    data['6_win'] = i6Win;
    data['7_pick'] = i7Pick;
    data['7_win'] = i7Win;
    data['8_pick'] = i8Pick;
    data['8_win'] = i8Win;
    data['null_pick'] = nullPick;
    data['null_win'] = nullWin;
    return data;
  }
}
