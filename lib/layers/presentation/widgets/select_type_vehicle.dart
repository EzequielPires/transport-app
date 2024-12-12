import 'package:app/layers/domain/enums/vehicle_enum.dart';
import 'package:flutter/material.dart';

class SelectTypeVehicle extends StatefulWidget {
  final VehicleType? value;
  final Function(VehicleType? type)? onChange;
  const SelectTypeVehicle({super.key, this.onChange, this.value});

  @override
  State<SelectTypeVehicle> createState() => _SelectTypeVehicleState();
}

class _SelectTypeVehicleState extends State<SelectTypeVehicle> {
  VehicleType? _vehicleType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tipo de veículo',
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
                    vehicleType: _vehicleType,
                    onChange: (vehicleType) {
                      setState(() {
                        _vehicleType = vehicleType;
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
                  _vehicleType != null
                      ? Text(
                          _vehicleType!.displayName,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      : Text(
                          'Selecione o tipo de veículo',
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
  final VehicleType? vehicleType;
  final Function(VehicleType? type) onChange;
  const SelectValue({super.key, required this.onChange, this.vehicleType});

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
      body: Column(
        children: VehicleType.values
            .map(
              (type) => RadioListTile<VehicleType>(
                title: Text(type.displayName),
                value: type,
                groupValue: widget.vehicleType,
                onChanged: (v) {
                  widget.onChange(v);
                  Navigator.pop(context);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
