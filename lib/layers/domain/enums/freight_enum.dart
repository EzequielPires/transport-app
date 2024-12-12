enum FreightEvent {
  outro,
  paradaPlanejada,
  paneMecanica,
  acidente,
  furtoOuRoubo,
  atrasoTransito,
  condicoesClimaticasAdversas,
  chegadaPontoControle,
  mudancaRota,
  danosCarga,
  vazamentoProdutos,
  perdaParcialOuTotalCarga,
  descarregamentoNaoAutorizado,
  localEntregaFechado,
  responsavelCargaAusente,
  entregaConcluida,
  rejeicaoCarga,
  zonaDeRisco,
  solicitacaoAjuda,
  relatorioCombustivel,
  interacaoComAutoridades,
}

extension FreightEventExtension on FreightEvent {
  String get displayName {
    switch (this) {
      case FreightEvent.outro:
        return 'Outro tipo de evento';
      case FreightEvent.paradaPlanejada:
        return 'Parada planejada';
      case FreightEvent.paneMecanica:
        return 'Pane mecânica';
      case FreightEvent.acidente:
        return 'Acidente';
      case FreightEvent.furtoOuRoubo:
        return 'Furto ou roubo';
      case FreightEvent.atrasoTransito:
        return 'Atraso devido ao trânsito';
      case FreightEvent.condicoesClimaticasAdversas:
        return 'Condições climáticas adversas';
      case FreightEvent.chegadaPontoControle:
        return 'Chegada em ponto de controle';
      case FreightEvent.mudancaRota:
        return 'Mudança de rota';
      case FreightEvent.danosCarga:
        return 'Danos à carga';
      case FreightEvent.vazamentoProdutos:
        return 'Vazamento de produtos';
      case FreightEvent.perdaParcialOuTotalCarga:
        return 'Perda parcial ou total da carga';
      case FreightEvent.descarregamentoNaoAutorizado:
        return 'Descarregamento não autorizado';
      case FreightEvent.localEntregaFechado:
        return 'Local de entrega fechado';
      case FreightEvent.responsavelCargaAusente:
        return 'Responsável pela carga ausente';
      case FreightEvent.entregaConcluida:
        return 'Entrega concluída';
      case FreightEvent.rejeicaoCarga:
        return 'Rejeição da carga';
      case FreightEvent.zonaDeRisco:
        return 'Zona de risco';
      case FreightEvent.solicitacaoAjuda:
        return 'Solicitação de ajuda';
      case FreightEvent.relatorioCombustivel:
        return 'Relatório de combustível';
      case FreightEvent.interacaoComAutoridades:
        return 'Interação com autoridades';
    }
  }
}
