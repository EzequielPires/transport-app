import 'address.dart';
import 'user.dart';

class Freight {
  final int id;
  final String? freightCost;
  final String? discount;
  final String? freightType;
  final String? status;
  final DateTime? estimatedArrivalDate;
  final DateTime? departureDate;
  final DateTime? deliveryDate;
  final Address origin;
  final Address destination;
  final String? trackingNumber;
  final bool isInsured;
  final String? insuranceValue;
  final String? specialInstructions;
  final User? sender;
  final User? receiver;
  final User? deliveryMan;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? canceledAt;
  final bool isCancelled;

  Freight({
    required this.id,
    required this.freightCost,
    required this.discount,
    required this.freightType,
    required this.status,
    this.estimatedArrivalDate,
    this.departureDate,
    this.deliveryDate,
    required this.origin,
    required this.destination,
    this.trackingNumber,
    required this.isInsured,
    this.insuranceValue,
    this.specialInstructions,
    this.sender,
    this.receiver,
    this.deliveryMan,
    required this.createdAt,
    required this.updatedAt,
    this.canceledAt,
    required this.isCancelled,
  });

  factory Freight.fromJson(Map<String, dynamic> json) {
    return Freight(
      id: json['id'],
      freightCost: json['freightCost'],
      discount: json['discount'],
      freightType: json['freightType'],
      status: json['status'],
      estimatedArrivalDate: json['estimatedArrivalDate'] != null
          ? DateTime.parse(json['estimatedArrivalDate'])
          : null,
      departureDate: json['departureDate'] != null
          ? DateTime.parse(json['departureDate'])
          : null,
      deliveryDate: json['deliveryDate'] != null
          ? DateTime.parse(json['deliveryDate'])
          : null,
      origin: Address.fromJson(json['origin']),
      destination: Address.fromJson(json['destination']),
      trackingNumber: json['trackingNumber'],
      isInsured: json['isInsured'],
      insuranceValue: json['insuranceValue'],
      specialInstructions: json['specialInstructions'],
      sender: json['sender'] != null ? User.fromJson(json['sender']) : null,
      receiver:
          json['receiver'] != null ? User.fromJson(json['receiver']) : null,
      deliveryMan: json['deliveryMan'] != null
          ? User.fromJson(json['deliveryMan'])
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      canceledAt: json['canceledAt'] != null
          ? DateTime.parse(json['canceledAt'])
          : null,
      isCancelled: json['isCancelled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'freightCost': freightCost,
      'discount': discount,
      'freightType': freightType,
      'status': status,
      'estimatedArrivalDate': estimatedArrivalDate?.toIso8601String(),
      'departureDate': departureDate?.toIso8601String(),
      'deliveryDate': deliveryDate?.toIso8601String(),
      'origin': origin.toJson(),
      'destination': destination.toJson(),
      'trackingNumber': trackingNumber,
      'isInsured': isInsured,
      'insuranceValue': insuranceValue,
      'specialInstructions': specialInstructions,
      'sender': sender?.toJson(),
      'receiver': receiver?.toJson(),
      'deliveryMan': deliveryMan?.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'canceledAt': canceledAt?.toIso8601String(),
      'isCancelled': isCancelled,
    };
  }
}
