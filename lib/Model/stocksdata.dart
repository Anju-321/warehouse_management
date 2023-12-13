



class StocksData {
  final List<Stock> data;
  final String message;

  StocksData({
    required this.data,
    required this.message,
  });

  factory StocksData.fromJson(Map<String, dynamic> json) {
    return StocksData(
      data: List<Stock>.from(json['data'].map((x) => Stock.fromJson(x))),
      message: json['message'] ?? '', // Extract the global message
    );
  }
}

class Stock {
  final String id;
  final int totalStock;
  final String warehouse;

  Stock({
    required this.id,
    required this.totalStock,
    required this.warehouse,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      id: json['_id'],
      totalStock: json['totalStock'],
      warehouse: json['warehouse'],
    );
  }
}
