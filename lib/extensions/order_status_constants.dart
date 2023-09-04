import 'package:flutter_demo/extensions/label_type_ext.dart';

enum OrderStatusEnum {
  shipped('shipped', 'Bàn giao vận chuyển', LabelType.success),
  deliveryPicking(
      'deliveryPicking', 'Vận chuyển đang lấy hàng', LabelType.infor),
  missed('missed', 'Thất lạc hàng hóa', LabelType.error),
  lacked('lacked', 'Đơn thiếu hàng', LabelType.warning);

  const OrderStatusEnum(this.status, this.text, this.labelType);

  final String status;
  final String text;
  final LabelType labelType;

  static OrderStatusEnum? getEnumByStatus(String status) =>
      OrderStatusEnum.values
          .firstWhereOrNull((activity) => activity.status == status);
}

extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) condition) {
    for (final element in this) {
      if (condition(element)) return element;
    }
    return null;
  }
}
