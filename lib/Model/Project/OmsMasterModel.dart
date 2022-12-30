class OmsMasterModel {
  int? omsId;
  int? areaId;
  int? distributaryId;
  int? brokerId;
  int? gateWayId;
  String? uID;
  String? mACAddress;
  String? publishTopic;
  dynamic lastResponseTime;
  String? deviceTime;
  String? chakNo;
  dynamic chakArea;
  int? chakLeaderId;
  String? khasaraNo;
  String? villageName;
  String? coordinates;
  int? subChakQty;
  dynamic batteryType;
  double? batteryLevel;
  dynamic batteryCurrent;
  dynamic loadVoltage;
  dynamic loadCurrent;
  dynamic solarVoltage;
  dynamic solarCurrent;
  String? deviceType;
  String? packetType;
  dynamic aI1;
  dynamic aI2;
  dynamic aI3;
  dynamic aI4;
  dynamic temperature;
  dynamic door1;
  dynamic door2;
  dynamic door3;
  dynamic dI4;
  dynamic dI5;
  dynamic dI6;
  dynamic pTFail;
  dynamic posFail;
  dynamic highTemp;
  dynamic motion;
  dynamic filterChoke;
  dynamic lowBat;
  dynamic commBat;
  dynamic commSlave1;
  dynamic commSlave2;
  dynamic commSlave3;
  dynamic firmwareVersion;
  dynamic duty;
  dynamic availableResidualHead;
  dynamic iRT;
  dynamic pT2Valve1;
  dynamic posValve1;
  dynamic flowValve1;
  dynamic volValve1;
  dynamic highPressValve1;
  dynamic lowPressValve1;
  dynamic modeValve1;
  dynamic smodeValve1;
  dynamic runTimeValve1;
  dynamic pT2Valve2;
  dynamic posValve2;
  dynamic flowValve2;
  dynamic volValve2;
  dynamic lowPressValve2;
  dynamic highPressValve2;
  dynamic modeValve2;
  dynamic smodeValve2;
  dynamic runTimeValve2;
  dynamic pT2Valve3;
  dynamic posValve3;
  dynamic flowValve3;
  dynamic volValve3;
  dynamic highPressValve3;
  dynamic lowPressValve3;
  dynamic modeValve3;
  dynamic smodeValve3;
  dynamic runTimeValve3;
  dynamic pT2Valve4;
  dynamic posValve4;
  dynamic flowValve4;
  dynamic volValve4;
  dynamic highPressValve4;
  dynamic lowPressValve4;
  dynamic modeValve4;
  dynamic smodeValve4;
  dynamic runTimeValve4;
  dynamic pT2Valve5;
  dynamic posValve5;
  dynamic flowValve5;
  dynamic volValve5;
  dynamic highPressValve5;
  dynamic lowPressValve5;
  dynamic modeValve5;
  dynamic smodeValve5;
  dynamic runTimeValve5;
  dynamic pT2Valve6;
  dynamic posValve6;
  dynamic flowValve6;
  dynamic volValve6;
  dynamic highPressValve6;
  dynamic lowPressValve6;
  dynamic modeValve6;
  dynamic smodeValve6;
  dynamic runTimeValve6;
  dynamic updateFreq;
  dynamic flowSetPt1;
  dynamic sustPress1;
  dynamic redPress1;
  dynamic posSetPt1;
  dynamic flowSetPt2;
  dynamic sustPress2;
  dynamic redPress2;
  dynamic posSetPt2;
  dynamic flowSetPt3;
  dynamic sustPress3;
  dynamic redPress3;
  dynamic posSetPt3;
  dynamic flowSetPt4;
  dynamic sustPress4;
  dynamic redPress4;
  dynamic posSetPt4;
  dynamic flowSetPt5;
  dynamic sustPress5;
  dynamic redPress5;
  dynamic posSetPt5;
  dynamic flowSetPt6;
  dynamic sustPress6;
  dynamic redPress6;
  dynamic posSetPt6;
  dynamic manualOnOff1;
  dynamic manualOnOff2;
  dynamic manualOnOff3;
  dynamic manualOnOff4;
  dynamic manualOnOff5;
  dynamic manualOnOff6;
  dynamic testMin1;
  dynamic testMin2;
  dynamic testMin3;
  dynamic testMin4;
  dynamic testMin5;
  dynamic testMin6;
  dynamic sIRR1;
  dynamic sIRR2;
  dynamic sIRR3;
  dynamic sIRR4;
  dynamic sIRR5;
  dynamic sIRR6;
  dynamic emStop;
  dynamic subChakLeaderId1;
  dynamic subChakLeaderId2;
  dynamic subChakLeaderId3;
  dynamic subChakLeaderId4;
  dynamic subChakLeaderId5;
  dynamic subChakLeaderId6;
  dynamic subChakArea1;
  dynamic subChakArea2;
  dynamic subChakArea3;
  dynamic subChakArea4;
  dynamic subChakArea5;
  dynamic subChakArea6;
  dynamic manualValve1;
  dynamic manualValve2;
  dynamic manualValve3;
  dynamic manualValve4;
  dynamic manualValve5;
  dynamic manualValve6;
  dynamic desiredHeadReduction1;
  dynamic desiredHeadReduction2;
  dynamic desiredHeadReduction3;
  dynamic desiredHeadReduction4;
  dynamic desiredHeadReduction5;
  dynamic desiredHeadReduction6;
  dynamic calculatedVolume;
  dynamic typeId;
  dynamic downlinkId;
  dynamic batConstantReadingCount;
  dynamic updateBatDateTime;
  String? distributaryName;
  String? areaName;
  int? activeAlarm;
  String? chakNo1;
  String? lastResponseTime1;
  double? batteryLevel1;
  dynamic totalDamage;
  String? oNLINE;
  String? schedule;

  OmsMasterModel(
      {this.omsId,
      this.areaId,
      this.distributaryId,
      this.brokerId,
      this.gateWayId,
      this.uID,
      this.mACAddress,
      this.publishTopic,
      this.lastResponseTime,
      this.deviceTime,
      this.chakNo,
      this.chakArea,
      this.chakLeaderId,
      this.khasaraNo,
      this.villageName,
      this.coordinates,
      this.subChakQty,
      this.batteryType,
      this.batteryLevel,
      this.batteryCurrent,
      this.loadVoltage,
      this.loadCurrent,
      this.solarVoltage,
      this.solarCurrent,
      this.deviceType,
      this.packetType,
      this.aI1,
      this.aI2,
      this.aI3,
      this.aI4,
      this.temperature,
      this.door1,
      this.door2,
      this.door3,
      this.dI4,
      this.dI5,
      this.dI6,
      this.pTFail,
      this.posFail,
      this.highTemp,
      this.motion,
      this.filterChoke,
      this.lowBat,
      this.commBat,
      this.commSlave1,
      this.commSlave2,
      this.commSlave3,
      this.firmwareVersion,
      this.duty,
      this.availableResidualHead,
      this.iRT,
      this.pT2Valve1,
      this.posValve1,
      this.flowValve1,
      this.volValve1,
      this.highPressValve1,
      this.lowPressValve1,
      this.modeValve1,
      this.smodeValve1,
      this.runTimeValve1,
      this.pT2Valve2,
      this.posValve2,
      this.flowValve2,
      this.volValve2,
      this.highPressValve2,
      this.lowPressValve2,
      this.modeValve2,
      this.smodeValve2,
      this.runTimeValve2,
      this.pT2Valve3,
      this.posValve3,
      this.flowValve3,
      this.volValve3,
      this.highPressValve3,
      this.lowPressValve3,
      this.modeValve3,
      this.smodeValve3,
      this.runTimeValve3,
      this.pT2Valve4,
      this.posValve4,
      this.flowValve4,
      this.volValve4,
      this.highPressValve4,
      this.lowPressValve4,
      this.modeValve4,
      this.smodeValve4,
      this.runTimeValve4,
      this.pT2Valve5,
      this.posValve5,
      this.flowValve5,
      this.volValve5,
      this.highPressValve5,
      this.lowPressValve5,
      this.modeValve5,
      this.smodeValve5,
      this.runTimeValve5,
      this.pT2Valve6,
      this.posValve6,
      this.flowValve6,
      this.volValve6,
      this.highPressValve6,
      this.lowPressValve6,
      this.modeValve6,
      this.smodeValve6,
      this.runTimeValve6,
      this.updateFreq,
      this.flowSetPt1,
      this.sustPress1,
      this.redPress1,
      this.posSetPt1,
      this.flowSetPt2,
      this.sustPress2,
      this.redPress2,
      this.posSetPt2,
      this.flowSetPt3,
      this.sustPress3,
      this.redPress3,
      this.posSetPt3,
      this.flowSetPt4,
      this.sustPress4,
      this.redPress4,
      this.posSetPt4,
      this.flowSetPt5,
      this.sustPress5,
      this.redPress5,
      this.posSetPt5,
      this.flowSetPt6,
      this.sustPress6,
      this.redPress6,
      this.posSetPt6,
      this.manualOnOff1,
      this.manualOnOff2,
      this.manualOnOff3,
      this.manualOnOff4,
      this.manualOnOff5,
      this.manualOnOff6,
      this.testMin1,
      this.testMin2,
      this.testMin3,
      this.testMin4,
      this.testMin5,
      this.testMin6,
      this.sIRR1,
      this.sIRR2,
      this.sIRR3,
      this.sIRR4,
      this.sIRR5,
      this.sIRR6,
      this.emStop,
      this.subChakLeaderId1,
      this.subChakLeaderId2,
      this.subChakLeaderId3,
      this.subChakLeaderId4,
      this.subChakLeaderId5,
      this.subChakLeaderId6,
      this.subChakArea1,
      this.subChakArea2,
      this.subChakArea3,
      this.subChakArea4,
      this.subChakArea5,
      this.subChakArea6,
      this.manualValve1,
      this.manualValve2,
      this.manualValve3,
      this.manualValve4,
      this.manualValve5,
      this.manualValve6,
      this.desiredHeadReduction1,
      this.desiredHeadReduction2,
      this.desiredHeadReduction3,
      this.desiredHeadReduction4,
      this.desiredHeadReduction5,
      this.desiredHeadReduction6,
      this.calculatedVolume,
      this.typeId,
      this.downlinkId,
      this.batConstantReadingCount,
      this.updateBatDateTime,
      this.distributaryName,
      this.areaName,
      this.activeAlarm,
      this.chakNo1,
      this.lastResponseTime1,
      this.batteryLevel1,
      this.totalDamage,
      this.oNLINE,
      this.schedule});

  OmsMasterModel.fromJson(Map<String, dynamic> json) {
    omsId = json['OmsId'];
    areaId = json['AreaId'];
    distributaryId = json['DistributaryId'];
    brokerId = json['BrokerId'];
    gateWayId = json['GateWayId'];
    uID = json['UID'];
    mACAddress = json['MACAddress'];
    publishTopic = json['PublishTopic'];
    lastResponseTime = json['LastResponseTime'];
    deviceTime = json['DeviceTime'];
    chakNo = json['ChakNo'];
    chakArea = json['ChakArea'];
    chakLeaderId = json['ChakLeaderId'];
    khasaraNo = json['KhasaraNo'];
    villageName = json['VillageName'];
    coordinates = json['Coordinates'];
    subChakQty = json['SubChakQty'];
    batteryType = json['BatteryType'];
    batteryLevel = json['BatteryLevel'];
    batteryCurrent = json['BatteryCurrent'] ?? 0.0;
    loadVoltage = json['LoadVoltage'];
    loadCurrent = json['LoadCurrent'];
    solarVoltage = json['SolarVoltage'] ?? 0.0;
    solarCurrent = json['SolarCurrent'] ?? 0.0;
    deviceType = json['DeviceType'];
    packetType = json['PacketType'];
    aI1 = json['AI1'];
    aI2 = json['AI2'];
    aI3 = json['AI3'];
    aI4 = json['AI4'];
    temperature = json['Temperature'] ?? 0.0;
    door1 = json['Door1'] ?? 0;
    door2 = json['Door2'] ?? 0;
    door3 = json['Door3'] ?? 0;
    dI4 = json['DI4'];
    dI5 = json['DI5'];
    dI6 = json['DI6'];
    pTFail = json['PT_Fail'];
    posFail = json['Pos_Fail'];
    highTemp = json['High_Temp'];
    motion = json['Motion'];
    filterChoke = json['Filter_Choke'];
    lowBat = json['Low_Bat'];
    commBat = json['Comm_Bat'];
    commSlave1 = json['Comm_Slave1'];
    commSlave2 = json['Comm_Slave2'];
    commSlave3 = json['Comm_Slave3'];
    firmwareVersion = json['FirmwareVersion'];
    duty = json['Duty'];
    availableResidualHead = json['AvailableResidualHead'];
    iRT = json['IRT'];
    pT2Valve1 = json['PT2Valve1'];
    posValve1 = json['PosValve1'];
    flowValve1 = json['FlowValve1'];
    volValve1 = json['VolValve1'];
    highPressValve1 = json['HighPressValve1'];
    lowPressValve1 = json['LowPressValve1'];
    modeValve1 = json['ModeValve1'];
    smodeValve1 = json['SmodeValve1'];
    runTimeValve1 = json['RunTimeValve1'];
    pT2Valve2 = json['PT2Valve2'];
    posValve2 = json['PosValve2'];
    flowValve2 = json['FlowValve2'];
    volValve2 = json['VolValve2'];
    highPressValve2 = json['HighPressValve2'];
    lowPressValve2 = json['LowPressValve2'];
    modeValve2 = json['ModeValve2'];
    smodeValve2 = json['SmodeValve2'];
    runTimeValve2 = json['RunTimeValve2'];
    pT2Valve3 = json['PT2Valve3'];
    posValve3 = json['PosValve3'];
    flowValve3 = json['FlowValve3'];
    volValve3 = json['VolValve3'];
    highPressValve3 = json['HighPressValve3'];
    lowPressValve3 = json['LowPressValve3'];
    modeValve3 = json['ModeValve3'];
    smodeValve3 = json['SmodeValve3'];
    runTimeValve3 = json['RunTimeValve3'];
    pT2Valve4 = json['PT2Valve4'];
    posValve4 = json['PosValve4'];
    flowValve4 = json['FlowValve4'];
    volValve4 = json['VolValve4'];
    highPressValve4 = json['HighPressValve4'];
    lowPressValve4 = json['LowPressValve4'];
    modeValve4 = json['ModeValve4'];
    smodeValve4 = json['SmodeValve4'];
    runTimeValve4 = json['RunTimeValve4'];
    pT2Valve5 = json['PT2Valve5'];
    posValve5 = json['PosValve5'];
    flowValve5 = json['FlowValve5'];
    volValve5 = json['VolValve5'];
    highPressValve5 = json['HighPressValve5'];
    lowPressValve5 = json['LowPressValve5'];
    modeValve5 = json['ModeValve5'];
    smodeValve5 = json['SmodeValve5'];
    runTimeValve5 = json['RunTimeValve5'];
    pT2Valve6 = json['PT2Valve6'];
    posValve6 = json['PosValve6'];
    flowValve6 = json['FlowValve6'];
    volValve6 = json['VolValve6'];
    highPressValve6 = json['HighPressValve6'];
    lowPressValve6 = json['LowPressValve6'];
    modeValve6 = json['ModeValve6'];
    smodeValve6 = json['SmodeValve6'];
    runTimeValve6 = json['RunTimeValve6'];
    updateFreq = json['UpdateFreq'];
    flowSetPt1 = json['FlowSetPt1'];
    sustPress1 = json['sustPress1'];
    redPress1 = json['redPress1'];
    posSetPt1 = json['PosSetPt1'];
    flowSetPt2 = json['FlowSetPt2'];
    sustPress2 = json['sustPress2'];
    redPress2 = json['redPress2'];
    posSetPt2 = json['PosSetPt2'];
    flowSetPt3 = json['FlowSetPt3'];
    sustPress3 = json['sustPress3'];
    redPress3 = json['redPress3'];
    posSetPt3 = json['PosSetPt3'];
    flowSetPt4 = json['FlowSetPt4'];
    sustPress4 = json['sustPress4'];
    redPress4 = json['redPress4'];
    posSetPt4 = json['PosSetPt4'];
    flowSetPt5 = json['FlowSetPt5'];
    sustPress5 = json['sustPress5'];
    redPress5 = json['redPress5'];
    posSetPt5 = json['PosSetPt5'];
    flowSetPt6 = json['FlowSetPt6'];
    sustPress6 = json['sustPress6'];
    redPress6 = json['redPress6'];
    posSetPt6 = json['PosSetPt6'];
    manualOnOff1 = json['ManualOnOff1'];
    manualOnOff2 = json['ManualOnOff2'];
    manualOnOff3 = json['ManualOnOff3'];
    manualOnOff4 = json['ManualOnOff4'];
    manualOnOff5 = json['ManualOnOff5'];
    manualOnOff6 = json['ManualOnOff6'];
    testMin1 = json['TestMin1'];
    testMin2 = json['TestMin2'];
    testMin3 = json['TestMin3'];
    testMin4 = json['TestMin4'];
    testMin5 = json['TestMin5'];
    testMin6 = json['TestMin6'];
    sIRR1 = json['SIRR1'];
    sIRR2 = json['SIRR2'];
    sIRR3 = json['SIRR3'];
    sIRR4 = json['SIRR4'];
    sIRR5 = json['SIRR5'];
    sIRR6 = json['SIRR6'];
    emStop = json['EmStop'];
    subChakLeaderId1 = json['SubChakLeaderId1'];
    subChakLeaderId2 = json['SubChakLeaderId2'];
    subChakLeaderId3 = json['SubChakLeaderId3'];
    subChakLeaderId4 = json['SubChakLeaderId4'];
    subChakLeaderId5 = json['SubChakLeaderId5'];
    subChakLeaderId6 = json['SubChakLeaderId6'];
    subChakArea1 = json['SubChakArea1'];
    subChakArea2 = json['SubChakArea2'];
    subChakArea3 = json['SubChakArea3'];
    subChakArea4 = json['SubChakArea4'];
    subChakArea5 = json['SubChakArea5'];
    subChakArea6 = json['SubChakArea6'];
    manualValve1 = json['ManualValve1'];
    manualValve2 = json['ManualValve2'];
    manualValve3 = json['ManualValve3'];
    manualValve4 = json['ManualValve4'];
    manualValve5 = json['ManualValve5'];
    manualValve6 = json['ManualValve6'];
    desiredHeadReduction1 = json['DesiredHeadReduction1'];
    desiredHeadReduction2 = json['DesiredHeadReduction2'];
    desiredHeadReduction3 = json['DesiredHeadReduction3'];
    desiredHeadReduction4 = json['DesiredHeadReduction4'];
    desiredHeadReduction5 = json['DesiredHeadReduction5'];
    desiredHeadReduction6 = json['DesiredHeadReduction6'];
    calculatedVolume = json['CalculatedVolume'];
    typeId = json['TypeId'];
    downlinkId = json['DownlinkId'];
    batConstantReadingCount = json['BatConstantReadingCount'];
    updateBatDateTime = json['UpdateBatDateTime'];
    distributaryName = json['DistributaryName'];
    areaName = json['AreaName'];
    activeAlarm = json['ActiveAlarm'];
    chakNo1 = json['ChakNo1'];
    lastResponseTime1 = json['LastResponseTime1'];
    batteryLevel1 = json['BatteryLevel1'];
    totalDamage = json['TotalDamage'] ?? 0;
    oNLINE = json['ONLINE'];
    schedule = json['Schedule'];
  }
}
  //Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['OmsId'] = this.omsId;
//     data['AreaId'] = this.areaId;
//     data['DistributaryId'] = this.distributaryId;
//     data['BrokerId'] = this.brokerId;
//     data['GateWayId'] = this.gateWayId;
//     data['UID'] = this.uID;
//     data['MACAddress'] = this.mACAddress;
//     data['PublishTopic'] = this.publishTopic;
//     data['LastResponseTime'] = this.lastResponseTime;
//     data['DeviceTime'] = this.deviceTime;
//     data['ChakNo'] = this.chakNo;
//     data['ChakArea'] = this.chakArea;
//     data['ChakLeaderId'] = this.chakLeaderId;
//     data['KhasaraNo'] = this.khasaraNo;
//     data['VillageName'] = this.villageName;
//     data['Coordinates'] = this.coordinates;
//     data['SubChakQty'] = this.subChakQty;
//     data['BatteryType'] = this.batteryType;
//     data['BatteryLevel'] = this.batteryLevel;
//     data['BatteryCurrent'] = this.batteryCurrent;
//     data['LoadVoltage'] = this.loadVoltage;
//     data['LoadCurrent'] = this.loadCurrent;
//     data['SolarVoltage'] = this.solarVoltage;
//     data['SolarCurrent'] = this.solarCurrent;
//     data['DeviceType'] = this.deviceType;
//     data['PacketType'] = this.packetType;
//     data['AI1'] = this.aI1;
//     data['AI2'] = this.aI2;
//     data['AI3'] = this.aI3;
//     data['AI4'] = this.aI4;
//     data['Temperature'] = this.temperature;
//     data['Door1'] = this.door1;
//     data['Door2'] = this.door2;
//     data['Door3'] = this.door3;
//     data['DI4'] = this.dI4;
//     data['DI5'] = this.dI5;
//     data['DI6'] = this.dI6;
//     data['PT_Fail'] = this.pTFail;
//     data['Pos_Fail'] = this.posFail;
//     data['High_Temp'] = this.highTemp;
//     data['Motion'] = this.motion;
//     data['Filter_Choke'] = this.filterChoke;
//     data['Low_Bat'] = this.lowBat;
//     data['Comm_Bat'] = this.commBat;
//     data['Comm_Slave1'] = this.commSlave1;
//     data['Comm_Slave2'] = this.commSlave2;
//     data['Comm_Slave3'] = this.commSlave3;
//     data['FirmwareVersion'] = this.firmwareVersion;
//     data['Duty'] = this.duty;
//     data['AvailableResidualHead'] = this.availableResidualHead;
//     data['IRT'] = this.iRT;
//     data['PT2Valve1'] = this.pT2Valve1;
//     data['PosValve1'] = this.posValve1;
//     data['FlowValve1'] = this.flowValve1;
//     data['VolValve1'] = this.volValve1;
//     data['HighPressValve1'] = this.highPressValve1;
//     data['LowPressValve1'] = this.lowPressValve1;
//     data['ModeValve1'] = this.modeValve1;
//     data['SmodeValve1'] = this.smodeValve1;
//     data['RunTimeValve1'] = this.runTimeValve1;
//     data['PT2Valve2'] = this.pT2Valve2;
//     data['PosValve2'] = this.posValve2;
//     data['FlowValve2'] = this.flowValve2;
//     data['VolValve2'] = this.volValve2;
//     data['HighPressValve2'] = this.highPressValve2;
//     data['LowPressValve2'] = this.lowPressValve2;
//     data['ModeValve2'] = this.modeValve2;
//     data['SmodeValve2'] = this.smodeValve2;
//     data['RunTimeValve2'] = this.runTimeValve2;
//     data['PT2Valve3'] = this.pT2Valve3;
//     data['PosValve3'] = this.posValve3;
//     data['FlowValve3'] = this.flowValve3;
//     data['VolValve3'] = this.volValve3;
//     data['HighPressValve3'] = this.highPressValve3;
//     data['LowPressValve3'] = this.lowPressValve3;
//     data['ModeValve3'] = this.modeValve3;
//     data['SmodeValve3'] = this.smodeValve3;
//     data['RunTimeValve3'] = this.runTimeValve3;
//     data['PT2Valve4'] = this.pT2Valve4;
//     data['PosValve4'] = this.posValve4;
//     data['FlowValve4'] = this.flowValve4;
//     data['VolValve4'] = this.volValve4;
//     data['HighPressValve4'] = this.highPressValve4;
//     data['LowPressValve4'] = this.lowPressValve4;
//     data['ModeValve4'] = this.modeValve4;
//     data['SmodeValve4'] = this.smodeValve4;
//     data['RunTimeValve4'] = this.runTimeValve4;
//     data['PT2Valve5'] = this.pT2Valve5;
//     data['PosValve5'] = this.posValve5;
//     data['FlowValve5'] = this.flowValve5;
//     data['VolValve5'] = this.volValve5;
//     data['HighPressValve5'] = this.highPressValve5;
//     data['LowPressValve5'] = this.lowPressValve5;
//     data['ModeValve5'] = this.modeValve5;
//     data['SmodeValve5'] = this.smodeValve5;
//     data['RunTimeValve5'] = this.runTimeValve5;
//     data['PT2Valve6'] = this.pT2Valve6;
//     data['PosValve6'] = this.posValve6;
//     data['FlowValve6'] = this.flowValve6;
//     data['VolValve6'] = this.volValve6;
//     data['HighPressValve6'] = this.highPressValve6;
//     data['LowPressValve6'] = this.lowPressValve6;
//     data['ModeValve6'] = this.modeValve6;
//     data['SmodeValve6'] = this.smodeValve6;
//     data['RunTimeValve6'] = this.runTimeValve6;
//     data['UpdateFreq'] = this.updateFreq;
//     data['FlowSetPt1'] = this.flowSetPt1;
//     data['sustPress1'] = this.sustPress1;
//     data['redPress1'] = this.redPress1;
//     data['PosSetPt1'] = this.posSetPt1;
//     data['FlowSetPt2'] = this.flowSetPt2;
//     data['sustPress2'] = this.sustPress2;
//     data['redPress2'] = this.redPress2;
//     data['PosSetPt2'] = this.posSetPt2;
//     data['FlowSetPt3'] = this.flowSetPt3;
//     data['sustPress3'] = this.sustPress3;
//     data['redPress3'] = this.redPress3;
//     data['PosSetPt3'] = this.posSetPt3;
//     data['FlowSetPt4'] = this.flowSetPt4;
//     data['sustPress4'] = this.sustPress4;
//     data['redPress4'] = this.redPress4;
//     data['PosSetPt4'] = this.posSetPt4;
//     data['FlowSetPt5'] = this.flowSetPt5;
//     data['sustPress5'] = this.sustPress5;
//     data['redPress5'] = this.redPress5;
//     data['PosSetPt5'] = this.posSetPt5;
//     data['FlowSetPt6'] = this.flowSetPt6;
//     data['sustPress6'] = this.sustPress6;
//     data['redPress6'] = this.redPress6;
//     data['PosSetPt6'] = this.posSetPt6;
//     data['ManualOnOff1'] = this.manualOnOff1;
//     data['ManualOnOff2'] = this.manualOnOff2;
//     data['ManualOnOff3'] = this.manualOnOff3;
//     data['ManualOnOff4'] = this.manualOnOff4;
//     data['ManualOnOff5'] = this.manualOnOff5;
//     data['ManualOnOff6'] = this.manualOnOff6;
//     data['TestMin1'] = this.testMin1;
//     data['TestMin2'] = this.testMin2;
//     data['TestMin3'] = this.testMin3;
//     data['TestMin4'] = this.testMin4;
//     data['TestMin5'] = this.testMin5;
//     data['TestMin6'] = this.testMin6;
//     data['SIRR1'] = this.sIRR1;
//     data['SIRR2'] = this.sIRR2;
//     data['SIRR3'] = this.sIRR3;
//     data['SIRR4'] = this.sIRR4;
//     data['SIRR5'] = this.sIRR5;
//     data['SIRR6'] = this.sIRR6;
//     data['EmStop'] = this.emStop;
//     data['SubChakLeaderId1'] = this.subChakLeaderId1;
//     data['SubChakLeaderId2'] = this.subChakLeaderId2;
//     data['SubChakLeaderId3'] = this.subChakLeaderId3;
//     data['SubChakLeaderId4'] = this.subChakLeaderId4;
//     data['SubChakLeaderId5'] = this.subChakLeaderId5;
//     data['SubChakLeaderId6'] = this.subChakLeaderId6;
//     data['SubChakArea1'] = this.subChakArea1;
//     data['SubChakArea2'] = this.subChakArea2;
//     data['SubChakArea3'] = this.subChakArea3;
//     data['SubChakArea4'] = this.subChakArea4;
//     data['SubChakArea5'] = this.subChakArea5;
//     data['SubChakArea6'] = this.subChakArea6;
//     data['ManualValve1'] = this.manualValve1;
//     data['ManualValve2'] = this.manualValve2;
//     data['ManualValve3'] = this.manualValve3;
//     data['ManualValve4'] = this.manualValve4;
//     data['ManualValve5'] = this.manualValve5;
//     data['ManualValve6'] = this.manualValve6;
//     data['DesiredHeadReduction1'] = this.desiredHeadReduction1;
//     data['DesiredHeadReduction2'] = this.desiredHeadReduction2;
//     data['DesiredHeadReduction3'] = this.desiredHeadReduction3;
//     data['DesiredHeadReduction4'] = this.desiredHeadReduction4;
//     data['DesiredHeadReduction5'] = this.desiredHeadReduction5;
//     data['DesiredHeadReduction6'] = this.desiredHeadReduction6;
//     data['CalculatedVolume'] = this.calculatedVolume;
//     data['TypeId'] = this.typeId;
//     data['DownlinkId'] = this.downlinkId;
//     data['BatConstantReadingCount'] = this.batConstantReadingCount;
//     data['UpdateBatDateTime'] = this.updateBatDateTime;
//     data['DistributaryName'] = this.distributaryName;
//     data['AreaName'] = this.areaName;
//     data['ActiveAlarm'] = this.activeAlarm;
//     data['ChakNo1'] = this.chakNo1;
//     data['LastResponseTime1'] = this.lastResponseTime1;
//     data['BatteryLevel1'] = this.batteryLevel1;
//     data['TotalDamage'] = this.totalDamage;
//     data['ONLINE'] = this.oNLINE;
//     return data;
//   }
// }

// class OmsMasterModel {
//   int? omsId;
//   int? areaId;
//   int? distributaryId;
//   int? brokerId;
//   int? gateWayId;
//   String? uID;
//   String? mACAddress;
//   String? publishTopic;
//   String? lastResponseTime;
//   String? deviceTime;
//   String? chakNo;
//   double? chakArea;
//   int? chakLeaderId;
//   String? khasaraNo;
//   String? villageName;
//   String? coordinates;
//   int? subChakQty;
//   int? batteryType;
//   double? batteryLevel;
//   double? batteryCurrent;
//   double? loadVoltage;
//   double? loadCurrent;
//   double? solarVoltage;
//   double? solarCurrent;
//   String? deviceType;
//   String? packetType;
//   int? aI1;
//   int? aI2;
//   int? aI3;
//   int? aI4;
//   double? temperature;
//   int? door1;
//   int? door2;
//   int? door3;
//   int? dI4;
//   Null? dI5;
//   Null? dI6;
//   int? pTFail;
//   int? posFail;
//   int? highTemp;
//   int? motion;
//   int? filterChoke;
//   int? lowBat;
//   Null? commBat;
//   Null? commSlave1;
//   Null? commSlave2;
//   Null? commSlave3;
//   double? firmwareVersion;
//   double? duty;
//   double? availableResidualHead;
//   Null? iRT;
//   int? pT2Valve1;
//   double? posValve1;
//   int? flowValve1;
//   int? volValve1;
//   int? highPressValve1;
//   int? lowPressValve1;
//   int? modeValve1;
//   int? smodeValve1;
//   int? runTimeValve1;
//   int? pT2Valve2;
//   double? posValve2;
//   int? flowValve2;
//   int? volValve2;
//   int? highPressValve2;
//   int? lowPressValve2;
//   int? modeValve2;
//   int? smodeValve2;
//   int? runTimeValve2;
//   double? pT2Valve3;
//   double? posValve3;
//   int? flowValve3;
//   int? volValve3;
//   int? highPressValve3;
//   int? lowPressValve3;
//   int? modeValve3;
//   int? smodeValve3;
//   int? runTimeValve3;
//   int? pT2Valve4;
//   double? posValve4;
//   int? flowValve4;
//   int? volValve4;
//   int? highPressValve4;
//   int? lowPressValve4;
//   int? modeValve4;
//   int? smodeValve4;
//   int? runTimeValve4;
//   double? pT2Valve5;
//   double? posValve5;
//   int? flowValve5;
//   int? volValve5;
//   int? highPressValve5;
//   int? lowPressValve5;
//   int? modeValve5;
//   int? smodeValve5;
//   int? runTimeValve5;
//   int? pT2Valve6;
//   double? posValve6;
//   int? flowValve6;
//   int? volValve6;
//   int? highPressValve6;
//   int? lowPressValve6;
//   int? modeValve6;
//   int? smodeValve6;
//   int? runTimeValve6;
//   Null? updateFreq;
//   double? flowSetPt1;
//   double? sustPress1;
//   double? redPress1;
//   Null? posSetPt1;
//   int? flowSetPt2;
//   double? sustPress2;
//   double? redPress2;
//   Null? posSetPt2;
//   double? flowSetPt3;
//   double? sustPress3;
//   double? redPress3;
//   Null? posSetPt3;
//   double? flowSetPt4;
//   double? sustPress4;
//   double? redPress4;
//   Null? posSetPt4;
//   double? flowSetPt5;
//   double? sustPress5;
//   double? redPress5;
//   Null? posSetPt5;
//   double? flowSetPt6;
//   double? sustPress6;
//   double? redPress6;
//   Null? posSetPt6;
//   int? manualOnOff1;
//   int? manualOnOff2;
//   int? manualOnOff3;
//   int? manualOnOff4;
//   int? manualOnOff5;
//   int? manualOnOff6;
//   Null? testMin1;
//   Null? testMin2;
//   Null? testMin3;
//   Null? testMin4;
//   Null? testMin5;
//   Null? testMin6;
//   int? sIRR1;
//   int? sIRR2;
//   int? sIRR3;
//   int? sIRR4;
//   int? sIRR5;
//   int? sIRR6;
//   int? emStop;
//   int? subChakLeaderId1;
//   int? subChakLeaderId2;
//   int? subChakLeaderId3;
//   int? subChakLeaderId4;
//   int? subChakLeaderId5;
//   int? subChakLeaderId6;
//   double? subChakArea1;
//   double? subChakArea2;
//   double? subChakArea3;
//   double? subChakArea4;
//   double? subChakArea5;
//   double? subChakArea6;
//   int? manualValve1;
//   int? manualValve2;
//   int? manualValve3;
//   int? manualValve4;
//   int? manualValve5;
//   int? manualValve6;
//   int? desiredHeadReduction1;
//   int? desiredHeadReduction2;
//   int? desiredHeadReduction3;
//   double? desiredHeadReduction4;
//   double? desiredHeadReduction5;
//   int? desiredHeadReduction6;
//   Null? calculatedVolume;
//   int? typeId;
//   int? downlinkId;
//   Null? batConstantReadingCount;
//   Null? updateBatDateTime;
//   String? distributaryName;
//   String? areaName;
//   int? activeAlarm;
//   String? chakNo1;
//   String? lastResponseTime1;
//   int? batteryLevel1;
//   int? totalDamage;
//   String? oNLINE;

//   OmsMasterModel(
//       {this.omsId,
//       this.areaId,
//       this.distributaryId,
//       this.brokerId,
//       this.gateWayId,
//       this.uID,
//       this.mACAddress,
//       this.publishTopic,
//       this.lastResponseTime,
//       this.deviceTime,
//       this.chakNo,
//       this.chakArea,
//       this.chakLeaderId,
//       this.khasaraNo,
//       this.villageName,
//       this.coordinates,
//       this.subChakQty,
//       this.batteryType,
//       this.batteryLevel,
//       this.batteryCurrent,
//       this.loadVoltage,
//       this.loadCurrent,
//       this.solarVoltage,
//       this.solarCurrent,
//       this.deviceType,
//       this.packetType,
//       this.aI1,
//       this.aI2,
//       this.aI3,
//       this.aI4,
//       this.temperature,
//       this.door1,
//       this.door2,
//       this.door3,
//       this.dI4,
//       this.dI5,
//       this.dI6,
//       this.pTFail,
//       this.posFail,
//       this.highTemp,
//       this.motion,
//       this.filterChoke,
//       this.lowBat,
//       this.commBat,
//       this.commSlave1,
//       this.commSlave2,
//       this.commSlave3,
//       this.firmwareVersion,
//       this.duty,
//       this.availableResidualHead,
//       this.iRT,
//       this.pT2Valve1,
//       this.posValve1,
//       this.flowValve1,
//       this.volValve1,
//       this.highPressValve1,
//       this.lowPressValve1,
//       this.modeValve1,
//       this.smodeValve1,
//       this.runTimeValve1,
//       this.pT2Valve2,
//       this.posValve2,
//       this.flowValve2,
//       this.volValve2,
//       this.highPressValve2,
//       this.lowPressValve2,
//       this.modeValve2,
//       this.smodeValve2,
//       this.runTimeValve2,
//       this.pT2Valve3,
//       this.posValve3,
//       this.flowValve3,
//       this.volValve3,
//       this.highPressValve3,
//       this.lowPressValve3,
//       this.modeValve3,
//       this.smodeValve3,
//       this.runTimeValve3,
//       this.pT2Valve4,
//       this.posValve4,
//       this.flowValve4,
//       this.volValve4,
//       this.highPressValve4,
//       this.lowPressValve4,
//       this.modeValve4,
//       this.smodeValve4,
//       this.runTimeValve4,
//       this.pT2Valve5,
//       this.posValve5,
//       this.flowValve5,
//       this.volValve5,
//       this.highPressValve5,
//       this.lowPressValve5,
//       this.modeValve5,
//       this.smodeValve5,
//       this.runTimeValve5,
//       this.pT2Valve6,
//       this.posValve6,
//       this.flowValve6,
//       this.volValve6,
//       this.highPressValve6,
//       this.lowPressValve6,
//       this.modeValve6,
//       this.smodeValve6,
//       this.runTimeValve6,
//       this.updateFreq,
//       this.flowSetPt1,
//       this.sustPress1,
//       this.redPress1,
//       this.posSetPt1,
//       this.flowSetPt2,
//       this.sustPress2,
//       this.redPress2,
//       this.posSetPt2,
//       this.flowSetPt3,
//       this.sustPress3,
//       this.redPress3,
//       this.posSetPt3,
//       this.flowSetPt4,
//       this.sustPress4,
//       this.redPress4,
//       this.posSetPt4,
//       this.flowSetPt5,
//       this.sustPress5,
//       this.redPress5,
//       this.posSetPt5,
//       this.flowSetPt6,
//       this.sustPress6,
//       this.redPress6,
//       this.posSetPt6,
//       this.manualOnOff1,
//       this.manualOnOff2,
//       this.manualOnOff3,
//       this.manualOnOff4,
//       this.manualOnOff5,
//       this.manualOnOff6,
//       this.testMin1,
//       this.testMin2,
//       this.testMin3,
//       this.testMin4,
//       this.testMin5,
//       this.testMin6,
//       this.sIRR1,
//       this.sIRR2,
//       this.sIRR3,
//       this.sIRR4,
//       this.sIRR5,
//       this.sIRR6,
//       this.emStop,
//       this.subChakLeaderId1,
//       this.subChakLeaderId2,
//       this.subChakLeaderId3,
//       this.subChakLeaderId4,
//       this.subChakLeaderId5,
//       this.subChakLeaderId6,
//       this.subChakArea1,
//       this.subChakArea2,
//       this.subChakArea3,
//       this.subChakArea4,
//       this.subChakArea5,
//       this.subChakArea6,
//       this.manualValve1,
//       this.manualValve2,
//       this.manualValve3,
//       this.manualValve4,
//       this.manualValve5,
//       this.manualValve6,
//       this.desiredHeadReduction1,
//       this.desiredHeadReduction2,
//       this.desiredHeadReduction3,
//       this.desiredHeadReduction4,
//       this.desiredHeadReduction5,
//       this.desiredHeadReduction6,
//       this.calculatedVolume,
//       this.typeId,
//       this.downlinkId,
//       this.batConstantReadingCount,
//       this.updateBatDateTime,
//       this.distributaryName,
//       this.areaName,
//       this.activeAlarm,
//       this.chakNo1,
//       this.lastResponseTime1,
//       this.batteryLevel1,
//       this.totalDamage,
//       this.oNLINE});

//   OmsMasterModel.fromJson(Map<String, dynamic> json) {
//     omsId = json['OmsId'];
//     areaId = json['AreaId'];
//     distributaryId = json['DistributaryId'];
//     brokerId = json['BrokerId'];
//     gateWayId = json['GateWayId'];
//     uID = json['UID'];
//     mACAddress = json['MACAddress'];
//     publishTopic = json['PublishTopic'];
//     lastResponseTime = json['LastResponseTime'];
//     deviceTime = json['DeviceTime'];
//     chakNo = json['ChakNo'];
//     chakArea = json['ChakArea'];
//     chakLeaderId = json['ChakLeaderId'];
//     khasaraNo = json['KhasaraNo'];
//     villageName = json['VillageName'];
//     coordinates = json['Coordinates'];
//     subChakQty = json['SubChakQty'];
//     batteryType = json['BatteryType'];
//     batteryLevel = json['BatteryLevel'];
//     batteryCurrent = json['BatteryCurrent'];
//     loadVoltage = json['LoadVoltage'];
//     loadCurrent = json['LoadCurrent'];
//     solarVoltage = json['SolarVoltage'];
//     solarCurrent = json['SolarCurrent'];
//     deviceType = json['DeviceType'];
//     packetType = json['PacketType'];
//     aI1 = json['AI1'];
//     aI2 = json['AI2'];
//     aI3 = json['AI3'];
//     aI4 = json['AI4'];
//     temperature = json['Temperature'];
//     door1 = json['Door1'];
//     door2 = json['Door2'];
//     door3 = json['Door3'];
//     dI4 = json['DI4'];
//     dI5 = json['DI5'];
//     dI6 = json['DI6'];
//     pTFail = json['PT_Fail'];
//     posFail = json['Pos_Fail'];
//     highTemp = json['High_Temp'];
//     motion = json['Motion'];
//     filterChoke = json['Filter_Choke'];
//     lowBat = json['Low_Bat'];
//     commBat = json['Comm_Bat'];
//     commSlave1 = json['Comm_Slave1'];
//     commSlave2 = json['Comm_Slave2'];
//     commSlave3 = json['Comm_Slave3'];
//     firmwareVersion = json['FirmwareVersion'];
//     duty = json['Duty'];
//     availableResidualHead = json['AvailableResidualHead'];
//     iRT = json['IRT'];
//     pT2Valve1 = json['PT2Valve1'];
//     posValve1 = json['PosValve1'];
//     flowValve1 = json['FlowValve1'];
//     volValve1 = json['VolValve1'];
//     highPressValve1 = json['HighPressValve1'];
//     lowPressValve1 = json['LowPressValve1'];
//     modeValve1 = json['ModeValve1'];
//     smodeValve1 = json['SmodeValve1'];
//     runTimeValve1 = json['RunTimeValve1'];
//     pT2Valve2 = json['PT2Valve2'];
//     posValve2 = json['PosValve2'];
//     flowValve2 = json['FlowValve2'];
//     volValve2 = json['VolValve2'];
//     highPressValve2 = json['HighPressValve2'];
//     lowPressValve2 = json['LowPressValve2'];
//     modeValve2 = json['ModeValve2'];
//     smodeValve2 = json['SmodeValve2'];
//     runTimeValve2 = json['RunTimeValve2'];
//     pT2Valve3 = json['PT2Valve3'];
//     posValve3 = json['PosValve3'];
//     flowValve3 = json['FlowValve3'];
//     volValve3 = json['VolValve3'];
//     highPressValve3 = json['HighPressValve3'];
//     lowPressValve3 = json['LowPressValve3'];
//     modeValve3 = json['ModeValve3'];
//     smodeValve3 = json['SmodeValve3'];
//     runTimeValve3 = json['RunTimeValve3'];
//     pT2Valve4 = json['PT2Valve4'];
//     posValve4 = json['PosValve4'];
//     flowValve4 = json['FlowValve4'];
//     volValve4 = json['VolValve4'];
//     highPressValve4 = json['HighPressValve4'];
//     lowPressValve4 = json['LowPressValve4'];
//     modeValve4 = json['ModeValve4'];
//     smodeValve4 = json['SmodeValve4'];
//     runTimeValve4 = json['RunTimeValve4'];
//     pT2Valve5 = json['PT2Valve5'];
//     posValve5 = json['PosValve5'];
//     flowValve5 = json['FlowValve5'];
//     volValve5 = json['VolValve5'];
//     highPressValve5 = json['HighPressValve5'];
//     lowPressValve5 = json['LowPressValve5'];
//     modeValve5 = json['ModeValve5'];
//     smodeValve5 = json['SmodeValve5'];
//     runTimeValve5 = json['RunTimeValve5'];
//     pT2Valve6 = json['PT2Valve6'];
//     posValve6 = json['PosValve6'];
//     flowValve6 = json['FlowValve6'];
//     volValve6 = json['VolValve6'];
//     highPressValve6 = json['HighPressValve6'];
//     lowPressValve6 = json['LowPressValve6'];
//     modeValve6 = json['ModeValve6'];
//     smodeValve6 = json['SmodeValve6'];
//     runTimeValve6 = json['RunTimeValve6'];
//     updateFreq = json['UpdateFreq'];
//     flowSetPt1 = json['FlowSetPt1'];
//     sustPress1 = json['sustPress1'];
//     redPress1 = json['redPress1'];
//     posSetPt1 = json['PosSetPt1'];
//     flowSetPt2 = json['FlowSetPt2'];
//     sustPress2 = json['sustPress2'];
//     redPress2 = json['redPress2'];
//     posSetPt2 = json['PosSetPt2'];
//     flowSetPt3 = json['FlowSetPt3'];
//     sustPress3 = json['sustPress3'];
//     redPress3 = json['redPress3'];
//     posSetPt3 = json['PosSetPt3'];
//     flowSetPt4 = json['FlowSetPt4'];
//     sustPress4 = json['sustPress4'];
//     redPress4 = json['redPress4'];
//     posSetPt4 = json['PosSetPt4'];
//     flowSetPt5 = json['FlowSetPt5'];
//     sustPress5 = json['sustPress5'];
//     redPress5 = json['redPress5'];
//     posSetPt5 = json['PosSetPt5'];
//     flowSetPt6 = json['FlowSetPt6'];
//     sustPress6 = json['sustPress6'];
//     redPress6 = json['redPress6'];
//     posSetPt6 = json['PosSetPt6'];
//     manualOnOff1 = json['ManualOnOff1'];
//     manualOnOff2 = json['ManualOnOff2'];
//     manualOnOff3 = json['ManualOnOff3'];
//     manualOnOff4 = json['ManualOnOff4'];
//     manualOnOff5 = json['ManualOnOff5'];
//     manualOnOff6 = json['ManualOnOff6'];
//     testMin1 = json['TestMin1'];
//     testMin2 = json['TestMin2'];
//     testMin3 = json['TestMin3'];
//     testMin4 = json['TestMin4'];
//     testMin5 = json['TestMin5'];
//     testMin6 = json['TestMin6'];
//     sIRR1 = json['SIRR1'];
//     sIRR2 = json['SIRR2'];
//     sIRR3 = json['SIRR3'];
//     sIRR4 = json['SIRR4'];
//     sIRR5 = json['SIRR5'];
//     sIRR6 = json['SIRR6'];
//     emStop = json['EmStop'];
//     subChakLeaderId1 = json['SubChakLeaderId1'];
//     subChakLeaderId2 = json['SubChakLeaderId2'];
//     subChakLeaderId3 = json['SubChakLeaderId3'];
//     subChakLeaderId4 = json['SubChakLeaderId4'];
//     subChakLeaderId5 = json['SubChakLeaderId5'];
//     subChakLeaderId6 = json['SubChakLeaderId6'];
//     subChakArea1 = json['SubChakArea1'];
//     subChakArea2 = json['SubChakArea2'];
//     subChakArea3 = json['SubChakArea3'];
//     subChakArea4 = json['SubChakArea4'];
//     subChakArea5 = json['SubChakArea5'];
//     subChakArea6 = json['SubChakArea6'];
//     manualValve1 = json['ManualValve1'];
//     manualValve2 = json['ManualValve2'];
//     manualValve3 = json['ManualValve3'];
//     manualValve4 = json['ManualValve4'];
//     manualValve5 = json['ManualValve5'];
//     manualValve6 = json['ManualValve6'];
//     desiredHeadReduction1 = json['DesiredHeadReduction1'];
//     desiredHeadReduction2 = json['DesiredHeadReduction2'];
//     desiredHeadReduction3 = json['DesiredHeadReduction3'];
//     desiredHeadReduction4 = json['DesiredHeadReduction4'];
//     desiredHeadReduction5 = json['DesiredHeadReduction5'];
//     desiredHeadReduction6 = json['DesiredHeadReduction6'];
//     calculatedVolume = json['CalculatedVolume'];
//     typeId = json['TypeId'];
//     downlinkId = json['DownlinkId'];
//     batConstantReadingCount = json['BatConstantReadingCount'];
//     updateBatDateTime = json['UpdateBatDateTime'];
//     distributaryName = json['DistributaryName'];
//     areaName = json['AreaName'];
//     activeAlarm = json['ActiveAlarm'];
//     chakNo1 = json['ChakNo1'];
//     lastResponseTime1 = json['LastResponseTime1'];
//     batteryLevel1 = json['BatteryLevel1'];
//     totalDamage = json['TotalDamage'];
//     oNLINE = json['ONLINE'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['OmsId'] = this.omsId;
//     data['AreaId'] = this.areaId;
//     data['DistributaryId'] = this.distributaryId;
//     data['BrokerId'] = this.brokerId;
//     data['GateWayId'] = this.gateWayId;
//     data['UID'] = this.uID;
//     data['MACAddress'] = this.mACAddress;
//     data['PublishTopic'] = this.publishTopic;
//     data['LastResponseTime'] = this.lastResponseTime;
//     data['DeviceTime'] = this.deviceTime;
//     data['ChakNo'] = this.chakNo;
//     data['ChakArea'] = this.chakArea;
//     data['ChakLeaderId'] = this.chakLeaderId;
//     data['KhasaraNo'] = this.khasaraNo;
//     data['VillageName'] = this.villageName;
//     data['Coordinates'] = this.coordinates;
//     data['SubChakQty'] = this.subChakQty;
//     data['BatteryType'] = this.batteryType;
//     data['BatteryLevel'] = this.batteryLevel;
//     data['BatteryCurrent'] = this.batteryCurrent;
//     data['LoadVoltage'] = this.loadVoltage;
//     data['LoadCurrent'] = this.loadCurrent;
//     data['SolarVoltage'] = this.solarVoltage;
//     data['SolarCurrent'] = this.solarCurrent;
//     data['DeviceType'] = this.deviceType;
//     data['PacketType'] = this.packetType;
//     data['AI1'] = this.aI1;
//     data['AI2'] = this.aI2;
//     data['AI3'] = this.aI3;
//     data['AI4'] = this.aI4;
//     data['Temperature'] = this.temperature;
//     data['Door1'] = this.door1;
//     data['Door2'] = this.door2;
//     data['Door3'] = this.door3;
//     data['DI4'] = this.dI4;
//     data['DI5'] = this.dI5;
//     data['DI6'] = this.dI6;
//     data['PT_Fail'] = this.pTFail;
//     data['Pos_Fail'] = this.posFail;
//     data['High_Temp'] = this.highTemp;
//     data['Motion'] = this.motion;
//     data['Filter_Choke'] = this.filterChoke;
//     data['Low_Bat'] = this.lowBat;
//     data['Comm_Bat'] = this.commBat;
//     data['Comm_Slave1'] = this.commSlave1;
//     data['Comm_Slave2'] = this.commSlave2;
//     data['Comm_Slave3'] = this.commSlave3;
//     data['FirmwareVersion'] = this.firmwareVersion;
//     data['Duty'] = this.duty;
//     data['AvailableResidualHead'] = this.availableResidualHead;
//     data['IRT'] = this.iRT;
//     data['PT2Valve1'] = this.pT2Valve1;
//     data['PosValve1'] = this.posValve1;
//     data['FlowValve1'] = this.flowValve1;
//     data['VolValve1'] = this.volValve1;
//     data['HighPressValve1'] = this.highPressValve1;
//     data['LowPressValve1'] = this.lowPressValve1;
//     data['ModeValve1'] = this.modeValve1;
//     data['SmodeValve1'] = this.smodeValve1;
//     data['RunTimeValve1'] = this.runTimeValve1;
//     data['PT2Valve2'] = this.pT2Valve2;
//     data['PosValve2'] = this.posValve2;
//     data['FlowValve2'] = this.flowValve2;
//     data['VolValve2'] = this.volValve2;
//     data['HighPressValve2'] = this.highPressValve2;
//     data['LowPressValve2'] = this.lowPressValve2;
//     data['ModeValve2'] = this.modeValve2;
//     data['SmodeValve2'] = this.smodeValve2;
//     data['RunTimeValve2'] = this.runTimeValve2;
//     data['PT2Valve3'] = this.pT2Valve3;
//     data['PosValve3'] = this.posValve3;
//     data['FlowValve3'] = this.flowValve3;
//     data['VolValve3'] = this.volValve3;
//     data['HighPressValve3'] = this.highPressValve3;
//     data['LowPressValve3'] = this.lowPressValve3;
//     data['ModeValve3'] = this.modeValve3;
//     data['SmodeValve3'] = this.smodeValve3;
//     data['RunTimeValve3'] = this.runTimeValve3;
//     data['PT2Valve4'] = this.pT2Valve4;
//     data['PosValve4'] = this.posValve4;
//     data['FlowValve4'] = this.flowValve4;
//     data['VolValve4'] = this.volValve4;
//     data['HighPressValve4'] = this.highPressValve4;
//     data['LowPressValve4'] = this.lowPressValve4;
//     data['ModeValve4'] = this.modeValve4;
//     data['SmodeValve4'] = this.smodeValve4;
//     data['RunTimeValve4'] = this.runTimeValve4;
//     data['PT2Valve5'] = this.pT2Valve5;
//     data['PosValve5'] = this.posValve5;
//     data['FlowValve5'] = this.flowValve5;
//     data['VolValve5'] = this.volValve5;
//     data['HighPressValve5'] = this.highPressValve5;
//     data['LowPressValve5'] = this.lowPressValve5;
//     data['ModeValve5'] = this.modeValve5;
//     data['SmodeValve5'] = this.smodeValve5;
//     data['RunTimeValve5'] = this.runTimeValve5;
//     data['PT2Valve6'] = this.pT2Valve6;
//     data['PosValve6'] = this.posValve6;
//     data['FlowValve6'] = this.flowValve6;
//     data['VolValve6'] = this.volValve6;
//     data['HighPressValve6'] = this.highPressValve6;
//     data['LowPressValve6'] = this.lowPressValve6;
//     data['ModeValve6'] = this.modeValve6;
//     data['SmodeValve6'] = this.smodeValve6;
//     data['RunTimeValve6'] = this.runTimeValve6;
//     data['UpdateFreq'] = this.updateFreq;
//     data['FlowSetPt1'] = this.flowSetPt1;
//     data['sustPress1'] = this.sustPress1;
//     data['redPress1'] = this.redPress1;
//     data['PosSetPt1'] = this.posSetPt1;
//     data['FlowSetPt2'] = this.flowSetPt2;
//     data['sustPress2'] = this.sustPress2;
//     data['redPress2'] = this.redPress2;
//     data['PosSetPt2'] = this.posSetPt2;
//     data['FlowSetPt3'] = this.flowSetPt3;
//     data['sustPress3'] = this.sustPress3;
//     data['redPress3'] = this.redPress3;
//     data['PosSetPt3'] = this.posSetPt3;
//     data['FlowSetPt4'] = this.flowSetPt4;
//     data['sustPress4'] = this.sustPress4;
//     data['redPress4'] = this.redPress4;
//     data['PosSetPt4'] = this.posSetPt4;
//     data['FlowSetPt5'] = this.flowSetPt5;
//     data['sustPress5'] = this.sustPress5;
//     data['redPress5'] = this.redPress5;
//     data['PosSetPt5'] = this.posSetPt5;
//     data['FlowSetPt6'] = this.flowSetPt6;
//     data['sustPress6'] = this.sustPress6;
//     data['redPress6'] = this.redPress6;
//     data['PosSetPt6'] = this.posSetPt6;
//     data['ManualOnOff1'] = this.manualOnOff1;
//     data['ManualOnOff2'] = this.manualOnOff2;
//     data['ManualOnOff3'] = this.manualOnOff3;
//     data['ManualOnOff4'] = this.manualOnOff4;
//     data['ManualOnOff5'] = this.manualOnOff5;
//     data['ManualOnOff6'] = this.manualOnOff6;
//     data['TestMin1'] = this.testMin1;
//     data['TestMin2'] = this.testMin2;
//     data['TestMin3'] = this.testMin3;
//     data['TestMin4'] = this.testMin4;
//     data['TestMin5'] = this.testMin5;
//     data['TestMin6'] = this.testMin6;
//     data['SIRR1'] = this.sIRR1;
//     data['SIRR2'] = this.sIRR2;
//     data['SIRR3'] = this.sIRR3;
//     data['SIRR4'] = this.sIRR4;
//     data['SIRR5'] = this.sIRR5;
//     data['SIRR6'] = this.sIRR6;
//     data['EmStop'] = this.emStop;
//     data['SubChakLeaderId1'] = this.subChakLeaderId1;
//     data['SubChakLeaderId2'] = this.subChakLeaderId2;
//     data['SubChakLeaderId3'] = this.subChakLeaderId3;
//     data['SubChakLeaderId4'] = this.subChakLeaderId4;
//     data['SubChakLeaderId5'] = this.subChakLeaderId5;
//     data['SubChakLeaderId6'] = this.subChakLeaderId6;
//     data['SubChakArea1'] = this.subChakArea1;
//     data['SubChakArea2'] = this.subChakArea2;
//     data['SubChakArea3'] = this.subChakArea3;
//     data['SubChakArea4'] = this.subChakArea4;
//     data['SubChakArea5'] = this.subChakArea5;
//     data['SubChakArea6'] = this.subChakArea6;
//     data['ManualValve1'] = this.manualValve1;
//     data['ManualValve2'] = this.manualValve2;
//     data['ManualValve3'] = this.manualValve3;
//     data['ManualValve4'] = this.manualValve4;
//     data['ManualValve5'] = this.manualValve5;
//     data['ManualValve6'] = this.manualValve6;
//     data['DesiredHeadReduction1'] = this.desiredHeadReduction1;
//     data['DesiredHeadReduction2'] = this.desiredHeadReduction2;
//     data['DesiredHeadReduction3'] = this.desiredHeadReduction3;
//     data['DesiredHeadReduction4'] = this.desiredHeadReduction4;
//     data['DesiredHeadReduction5'] = this.desiredHeadReduction5;
//     data['DesiredHeadReduction6'] = this.desiredHeadReduction6;
//     data['CalculatedVolume'] = this.calculatedVolume;
//     data['TypeId'] = this.typeId;
//     data['DownlinkId'] = this.downlinkId;
//     data['BatConstantReadingCount'] = this.batConstantReadingCount;
//     data['UpdateBatDateTime'] = this.updateBatDateTime;
//     data['DistributaryName'] = this.distributaryName;
//     data['AreaName'] = this.areaName;
//     data['ActiveAlarm'] = this.activeAlarm;
//     data['ChakNo1'] = this.chakNo1;
//     data['LastResponseTime1'] = this.lastResponseTime1;
//     data['BatteryLevel1'] = this.batteryLevel1;
//     data['TotalDamage'] = this.totalDamage;
//     data['ONLINE'] = this.oNLINE;
//     return data;
//   }
// }
