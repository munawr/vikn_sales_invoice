import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/sales_controller.dart';

class SalesEstimate extends StatefulWidget {
  const SalesEstimate({Key? key}) : super(key: key);

  @override
  _SalesEstimateState createState() => _SalesEstimateState();
}

class _SalesEstimateState extends State<SalesEstimate> {
  final SalesController salesController = Get.find();

  @override
  void initState() {
    super.initState();
    salesController.getSalesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Estimate"),
      ),
      body: Obx(
        () {
          if (salesController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: salesController.salesData.length,
              itemBuilder: (context, index) {
                var sale = salesController.salesData[index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Invoice No: ${sale.voucherNo}'),
                      Text('Customer Name: ${sale.customerName}'),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${sale.date}'),
                      Text('Status: ${sale.status}'),
                      Text(
                          'Total Amount: SAR ${sale.grandTotalRounded.toString()}'),
                    ],
                  ),
                  // onTap: () {
                  // },
                );
              },
            );
          }
        },
      ),
    );
  }
}
