class BookingRequest {
  const BookingRequest({
    required this.serviceId,
    required this.customerName,
    required this.scheduledAt,
    required this.note,
  });

  final String serviceId;
  final String customerName;
  final DateTime scheduledAt;
  final String note;
}
