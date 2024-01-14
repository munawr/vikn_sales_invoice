import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controllers/sales_controller.dart';

class SalesEstimate extends StatefulWidget {
  const SalesEstimate({Key? key}) : super(key: key);

  @override
  _SalesEstimateState createState() => _SalesEstimateState();
}

class _SalesEstimateState extends State<SalesEstimate> {
  final SalesController salesController = Get.find();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    salesController.getSalesData();
    salesController.filterSales('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: SvgPicture.asset(
              'assets/icons/arrowback.svg',
              height: 16,
              width: 16,
            ),
          ),
          onTap: () {
            salesController.clearAccessToken();
            Get.back();}
        ),
        actions: [
          InkWell(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
              child: SvgPicture.asset('assets/icons/blueadd.svg'),
            ),
            onTap: () {},
          )
        ],
        title: Text(
          "Sales Estimate",
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            //height: 1.5,
            letterSpacing: 0.0,
          ),
        ),
      ),
      body: Obx(
        () {
          if (salesController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (salesController.salesData.isEmpty) {
            return const Center(child: Text("Enter a query"));
          }
          else {
            return Column(
              children: [
                TextField(
                  controller: searchController,
                  onChanged: (query) {
                    salesController.filterSales(query);
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: const TextStyle(
                      color: Color(0xFFA5A5A5),
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      //height: 1.5,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFFBFBFB), // Light gray color
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SvgPicture.asset(
                        'assets/icons/searchgrey.svg',
                        height: 16,
                        width: 16,
                        color: const Color(0xffb4b4b4),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0x00E8E8E8), // Transparent at the start
                        Color(0xFFE8E8E8), // Gradient color
                        Color(0x00E8E8E8), // Transparent at the end
                      ],
                      stops: [0.0, 0.4844, 1.0],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: salesController.filteredSales.length,
                    itemBuilder: (context, index) {
                      var sale = salesController.filteredSales[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: '#',
                                              style: TextStyle(
                                                color: Color(
                                                    0xFF7D7D7D),
                                                fontFamily: 'Poppins',
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400,
                                                height: 1.54,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${sale.voucherNo}',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Poppins',
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '${sale.customerName}',
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5,
                                          color: Colors
                                              .black, // Use the specified color
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${sale.status}',
                                        style: const TextStyle(
                                          color: Color(
                                              0xFF1C60E2),
                                          fontFamily: 'Poppins',
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'SAR. ',
                                              style: TextStyle(
                                                color: Color(0xFF888888),
                                                fontFamily: 'Poppins',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  sale.grandTotalRounded.toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Poppins',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1.0,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0x00E8E8E8),
                                  Color(0xFFE8E8E8),
                                  Color(0x00E8E8E8),
                                ],
                                stops: [0.0, 0.4844, 1.0],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
