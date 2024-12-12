class FreightEvent {
  final String type;
  final String obs;
  final DateTime createdAt;

  FreightEvent(
      {required this.type, required this.obs, required this.createdAt});
}

List<FreightEvent> events = [
  FreightEvent(
    type: "Atraso no trânsito",
    obs: "Houve um engarrafamento na estrada principal.",
    createdAt: DateTime.now().subtract(Duration(hours: 2)),
  ),
  FreightEvent(
    type: "Pane mecânica",
    obs: "O veículo parou devido a problemas no motor.",
    createdAt: DateTime.now().subtract(Duration(days: 1)),
  ),
  FreightEvent(
    type: "Acidente",
    obs: "Houve uma colisão na rodovia.",
    createdAt: DateTime.now().subtract(Duration(days: 3)),
  ),
];
