import 'package:app/layers/domain/enums/vehicle_enum.dart';
import 'package:flutter/material.dart';

class SelectBodyworkVehicle extends StatefulWidget {
  final VehicleBodywork? value;
  final Function(VehicleBodywork? type)? onChange;
  const SelectBodyworkVehicle({super.key, this.onChange, this.value});

  @override
  State<SelectBodyworkVehicle> createState() => _SelectBodyworkVehicleState();
}

class _SelectBodyworkVehicleState extends State<SelectBodyworkVehicle> {
  VehicleBodywork? _vehicleBodywork;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tipo de carroceria',
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
                    vehicleBodywork: _vehicleBodywork,
                    onChange: (vehicleBodywork) {
                      setState(() {
                        _vehicleBodywork = vehicleBodywork;
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
                  _vehicleBodywork != null
                      ? Text(
                          _vehicleBodywork!.displayName,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      : Text(
                          'Selecione o tipo de carroceria',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black54,
                          ),
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
  final VehicleBodywork? vehicleBodywork;
  final Function(VehicleBodywork? type) onChange;
  const SelectValue({super.key, required this.onChange, this.vehicleBodywork});

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
          'Selecione o tipo de carroceria',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: VehicleBodywork.values
              .map(
                (type) => RadioListTile<VehicleBodywork>(
                  title: Text(type.displayName),
                  value: type,
                  groupValue: widget.vehicleBodywork,
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
