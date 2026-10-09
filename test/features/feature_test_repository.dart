import 'dart:async';

import 'package:jasa_dekat/features/booking/domain/booking_request.dart';
import 'package:jasa_dekat/features/services/data/service_repository.dart';
import 'package:jasa_dekat/features/services/domain/service_item.dart';

class FeatureTestRepository implements ServiceRepository {
  FeatureTestRepository({
    required this.services,
    this.failFirstFetch = false,
    Future<void> Function(BookingRequest request)? submit,
  }) : _submit = submit;

  final List<ServiceItem> services;
  final bool failFirstFetch;
  final Future<void> Function(BookingRequest request)? _submit;
  final List<BookingRequest> bookings = [];
  int fetchCount = 0;

  @override
  Future<List<ServiceItem>> fetchServices() async {
    fetchCount++;
    if (failFirstFetch && fetchCount == 1) throw Exception('offline');
    return services;
  }

  @override
  Future<void> createBooking(BookingRequest request) async {
    bookings.add(request);
    await _submit?.call(request);
  }
}
