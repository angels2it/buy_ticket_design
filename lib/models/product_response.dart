class ProductResponse {
  final List<dynamic> items;
  final int totalCount;

  ProductResponse({this.items, this.totalCount});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      items: json['items'],
      totalCount: json['totalCount'],
    );
  }
}
