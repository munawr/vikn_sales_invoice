class Data {
  int? index;
  String? id;
  String? voucherNo;
  String? date;
  String? ledgerName;
  double? totalGrossAmtRounded;
  //int? totalTaxRounded;
  double? grandTotalRounded;
  String? customerName;
  double? totalTax;
  String? status;
  double? grandTotal;
  bool? isBillwised;
  String? billwiseStatus;
  //double? totalGrossAmtRounded;
  double? totalTaxRounded;
  //double? grandTotalRounded;
  Data({
    this.index,
    this.id,
    this.voucherNo,
    this.date,
    this.ledgerName,
    this.totalGrossAmtRounded,
    this.totalTaxRounded,
    this.grandTotalRounded,
    this.customerName,
    this.totalTax,
    this.status,
    this.grandTotal,
    this.isBillwised,
    this.billwiseStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      index: json['index'],
      id: json['id'],
      voucherNo: json['VoucherNo'],
      date: json['Date'],
      ledgerName: json['LedgerName'],
      totalGrossAmtRounded: json['TotalGrossAmt_rounded']?.toDouble(),
      totalTaxRounded: json['TotalTax_rounded']?.toDouble(),
      grandTotalRounded: json['GrandTotal_Rounded']?.toDouble(),
      customerName: json['CustomerName'],
      totalTax: json['TotalTax'].toDouble(),
      status: json['Status'],
      grandTotal: json['GrandTotal'],
      isBillwised: json['is_billwised'],
      billwiseStatus: json['billwise_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'id': id,
      'VoucherNo': voucherNo,
      'Date': date,
      'LedgerName': ledgerName,
      'TotalGrossAmt_rounded': totalGrossAmtRounded,
      'TotalTax_rounded': totalTaxRounded,
      'GrandTotal_Rounded': grandTotalRounded,
      'CustomerName': customerName,
      'TotalTax': totalTax,
      'Status': status,
      'GrandTotal': grandTotal,
      'is_billwised': isBillwised,
      'billwise_status': billwiseStatus,
    };
  }
}
