import 'package:app/layers/domain/enums/freight_enum.dart';
import 'package:app/layers/domain/enums/vehicle_enum.dart';
import 'package:flutter/material.dart';

class SelectEvent extends StatefulWidget {
  final FreightEvent? value;
  final Function(FreightEvent? type)? onChange;
  const SelectEvent({super.key, this.onChange, this.value});

  @override
  State<SelectEvent> createState() => _SelectEventState();
}

class _SelectEventState extends State<SelectEvent> {
  FreightEvent? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tipo de evento',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectValue(
                    value: value,
                    onChange: (v) {
                      setState(() {
                        value = v;
                      });
                    },
                  ),
                )),
            child: Container(
              height: 58,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  value != null
                      ? Text(
                          value!.displayName,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      : Text(
                          'Selecione o tipo de evento',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black54),
                        ),
                  Icon(Icons.expand_more_outlined)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectValue extends StatefulWidget {
  final FreightEvent? value;
  final Function(FreightEvent? v) onChange;
  const SelectValue({super.key, required this.onChange, this.value});

  @override
  State<SelectValue> createState() => _SelectValueState();
}

class _SelectValueState extends State<SelectValue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Selecione o tipo de veículo',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: FreightEvent.values
              .map(
                (type) => RadioListTile<FreightEvent>(
                  title: Text(type.displayName),
                  value: type,
                  groupValue: widget.value,
                  onChanged: (v) {
                    widget.onChange(v);
                    Navigator.pop(context);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
