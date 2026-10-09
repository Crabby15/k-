import '../../booking/domain/booking_request.dart';
import '../domain/service_item.dart';

abstract interface class ServiceRepository {
  Future<List<ServiceItem>> fetchServices();
  Future<void> createBooking(BookingRequest request);
}

/// Local demo repository. Replace with Supabase implementation when configured.
class DemoServiceRepository implements ServiceRepository {
  DemoServiceRepository({List<ServiceItem>? services})
      : _services = services ?? demoServices;

  final List<ServiceItem> _services;
  final List<BookingRequest> bookings = [];

  @override
  Future<List<ServiceItem>> fetchServices() async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    return List.unmodifiable(_services);
  }

  @override
  Future<void> createBooking(BookingRequest request) async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    bookings.add(request);
  }
}

const demoServices = <ServiceItem>[
  ServiceItem(
    id: 'service-laptop',
    category: 'Teknologi',
    title: 'Servis laptop',
    priceLabel: 'Mulai Rp50.000',
    rating: 4.9,
    distance: '2.1 km',
  ),
  ServiceItem(
    id: 'service-tutor',
    category: 'Pendidikan',
    title: 'Guru les privat',
    priceLabel: 'Mulai Rp75.000',
    rating: 4.8,
    distance: '1.4 km',
  ),
  ServiceItem(
    id: 'service-design',
    category: 'Desain',
    title: 'Desain grafis',
    priceLabel: 'Mulai Rp100.000',
    rating: 5.0,
    distance: '3.0 km',
  ),
];
