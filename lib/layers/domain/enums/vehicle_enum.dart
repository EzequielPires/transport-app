enum VehicleType {
  bitrem,
  carreta,
  carretaLS,
  rodotrem,
  vanderleia,
  bitruck,
  truck,
  tresPorQuatro,
  fiorino,
  toco,
  vlc,
}

extension VehicleTypeExtension on VehicleType {
  String get displayName {
    switch (this) {
      case VehicleType.bitrem:
        return 'Bitrem';
      case VehicleType.carreta:
        return 'Carreta';
      case VehicleType.carretaLS:
        return 'Carreta LS';
      case VehicleType.rodotrem:
        return 'Rodotrem';
      case VehicleType.vanderleia:
        return 'Vanderléia';
      case VehicleType.bitruck:
        return 'Bitruck';
      case VehicleType.truck:
        return 'Truck';
      case VehicleType.tresPorQuatro:
        return '3/4';
      case VehicleType.fiorino:
        return 'Fiorino';
      case VehicleType.toco:
        return 'Toco';
      case VehicleType.vlc:
        return 'VLC';
    }
  }
}

enum VehicleBodywork {
  bau,
  bauFrigorifico,
  bauRefrigerado,
  sider,
  cacamba,
  gradeBaixa,
  graneleiro,
  plataforma,
  prancha,
  apenasCavalo,
  bugPortaContainer,
  cavaqueira,
  cegonheiro,
  gaiola,
  hopper,
  munck,
  silo,
  tanque,
}

extension VehicleBodyworkExtension on VehicleBodywork {
  String get displayName {
    switch (this) {
      case VehicleBodywork.bau:
        return 'Baú';
      case VehicleBodywork.bauFrigorifico:
        return 'Baú Frigorífico';
      case VehicleBodywork.bauRefrigerado:
        return 'Baú Refrigerado';
      case VehicleBodywork.sider:
        return 'Sider';
      case VehicleBodywork.cacamba:
        return 'Caçamba';
      case VehicleBodywork.gradeBaixa:
        return 'Grade Baixa';
      case VehicleBodywork.graneleiro:
        return 'Graneleiro';
      case VehicleBodywork.plataforma:
        return 'Plataforma';
      case VehicleBodywork.prancha:
        return 'Prancha';
      case VehicleBodywork.apenasCavalo:
        return 'Apenas Cavalo';
      case VehicleBodywork.bugPortaContainer:
        return 'Bug Porta Container';
      case VehicleBodywork.cavaqueira:
        return 'Cavaqueira';
      case VehicleBodywork.cegonheiro:
        return 'Cegonheiro';
      case VehicleBodywork.gaiola:
        return 'Gaiola';
      case VehicleBodywork.hopper:
        return 'Hopper';
      case VehicleBodywork.munck:
        return 'Munck';
      case VehicleBodywork.silo:
        return 'Silo';
      case VehicleBodywork.tanque:
        return 'Tanque';
    }
  }
}

enum VehicleTracker {
  naoTemRastreador,
  temMasNaoSeiAMarca,
  autotrac,
  omnilink,
  onixSat,
  positron,
  sascar,
  portoSeguro,
}

extension VehicleTrackerExtension on VehicleTracker {
  String get displayName {
    switch (this) {
      case VehicleTracker.naoTemRastreador:
        return 'Não tem rastreador';
      case VehicleTracker.temMasNaoSeiAMarca:
        return 'Tem, mas não sei a marca';
      case VehicleTracker.autotrac:
        return 'Autotrac';
      case VehicleTracker.omnilink:
        return 'Omnilink';
      case VehicleTracker.onixSat:
        return 'Onix Sat';
      case VehicleTracker.positron:
        return 'Positron';
      case VehicleTracker.sascar:
        return 'Sascar';
      case VehicleTracker.portoSeguro:
        return 'Porto Seguro';
    }
  }
}
