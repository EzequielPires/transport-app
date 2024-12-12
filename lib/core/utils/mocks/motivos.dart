class Reason {
  String label;
  int value;

  Reason({required this.label, required this.value});
}

List<Reason> reasons = [
  Reason(value: 1, label: "Cliente não encontrado"),
  Reason(value: 1, label: "Cliente recusou receber"),
  Reason(value: 1, label: "Endereço não encontrado"),
  Reason(value: 1, label: "Falha mecânica do veículo"),
  Reason(value: 1, label: "Impossibilidade do pagamento"),
  Reason(value: 1, label: "Cancelado na origem da coleta"),
  Reason(value: 1, label: "Outros motivos"),
];
