import 'package:collection/collection.dart';

class OrderHistoryApi {
  String? orderId;
  String? productId;
  String? productName;
  String? orderStatus;
  String? deliveryCharges;
  String? tax;
  String? newPrice;
  String? netAmount;
  String? totalAmount;
  String? deliveryTime;
  String? productDetail;
  String? customerName;
  String? customerAddress;
  String? orderQuantity;
  String? productImage1;
  String? orderAmount;
  String? date;

  OrderHistoryApi({
    this.orderId,
    this.productId,
    this.productName,
    this.orderStatus,
    this.deliveryCharges,
    this.tax,
    this.newPrice,
    this.netAmount,
    this.totalAmount,
    this.deliveryTime,
    this.productDetail,
    this.customerName,
    this.customerAddress,
    this.orderQuantity,
    this.productImage1,
    this.orderAmount,
    this.date,
  });

  factory OrderHistoryApi.fromJson(Map<dynamic, dynamic> json) {
    return OrderHistoryApi(
      orderId: json['order_id'] as String?,
      productId: json['product_id'] as String?,
      productName: json['product_name'] as String?,
      orderStatus: json['order_status'] as String?,
      deliveryCharges: json['delivery_charges'] as String?,
      tax: json['tax'] as String?,
      newPrice: json['new_price'] as String?,
      netAmount: json['net_amount'] as String?,
      totalAmount: json['total_amount'] as String?,
      deliveryTime: json['delivery_time'] as String?,
      productDetail: json['product_detail'] as String?,
      customerName: json['customer_name'] as String?,
      customerAddress: json['customer_address'] as String?,
      orderQuantity: json['order_quantity'] as String?,
      productImage1: json['product_image1'] as String?,
      orderAmount: json['order_amount'] as String?,
      date: json['date'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'product_id': productId,
        'product_name': productName,
        'order_status': orderStatus,
        'delivery_charges': deliveryCharges,
        'tax': tax,
        'new_price': newPrice,
        'net_amount': netAmount,
        'total_amount': totalAmount,
        'delivery_time': deliveryTime,
        'product_detail': productDetail,
        'customer_name': customerName,
        'customer_address': customerAddress,
        'order_quantity': orderQuantity,
        'product_image1': productImage1,
        'order_amount': orderAmount,
        'date': date,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! OrderHistoryApi) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      orderId.hashCode ^
      productId.hashCode ^
      productName.hashCode ^
      orderStatus.hashCode ^
      deliveryCharges.hashCode ^
      tax.hashCode ^
      newPrice.hashCode ^
      netAmount.hashCode ^
      totalAmount.hashCode ^
      deliveryTime.hashCode ^
      productDetail.hashCode ^
      customerName.hashCode ^
      customerAddress.hashCode ^
      orderQuantity.hashCode ^
      productImage1.hashCode ^
      orderAmount.hashCode ^
      date.hashCode;
}
