import 'package:app/layers/domain/enums/vehicle_enum.dart';
import 'package:flutter/material.dart';

class SelectTrackerVehicle extends StatefulWidget {
  final VehicleTracker? value;
  final Function(VehicleTracker? type)? onChange;
  const SelectTrackerVehicle({super.key, this.onChange, this.value});

  @override
  State<SelectTrackerVehicle> createState() => _SelectTrackerVehicleState();
}

class _SelectTrackerVehicleState extends State<SelectTrackerVehicle> {
  VehicleTracker? _vehicleTracker;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rastreador',
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
                    vehicleTracker: _vehicleTracker,
                    onChange: (vehicleType) {
                      setState(() {
                        _vehicleTracker = vehicleType;
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
                  _vehicleTracker != null
                      ? Text(
                          _vehicleTracker!.displayName,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      : Text(
                          'Informe se o veículo possui rastreador',
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
  final VehicleTracker? vehicleTracker;
  final Function(VehicleTracker? type) onChange;
  const SelectValue({super.key, required this.onChange, this.vehicleTracker});

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
        children: VehicleTracker.values
            .map(
              (tracker) => RadioListTile<VehicleTracker>(
                title: Text(tracker.displayName),
                value: tracker,
                groupValue: widget.vehicleTracker,
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
