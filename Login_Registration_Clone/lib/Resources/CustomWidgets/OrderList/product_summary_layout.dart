import 'package:flutter/material.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_summary_view_model.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';
import '../custom_widgets.dart';

class ProductSummary extends StatefulWidget {
  const ProductSummary({super.key});

  @override
  State<ProductSummary> createState() => _ProductSummaryState();
}

class _ProductSummaryState extends State<ProductSummary> {
  @override
  Widget build(BuildContext context) {
    final orderSummaryViewModel = Provider.of<OrderSummaryViewModel>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomWidgets.customText(text: 'Product', fontWeight: FontWeight.bold),
            CustomWidgets.customText(text: 'MRP', fontWeight: FontWeight.bold),
            CustomWidgets.customText(text: 'Price', fontWeight: FontWeight.bold),
            CustomWidgets.customText(text: 'Qty', fontWeight: FontWeight.bold),
            CustomWidgets.customText(text: 'Canc.\nQty', fontWeight: FontWeight.bold),
            CustomWidgets.customText(text: 'Total', fontWeight: FontWeight.bold),
          ],
        ),
        const Divider(thickness: 1),
        ListView.builder(
            shrinkWrap: true,
            itemCount: orderSummaryViewModel.foundProductSummary.length,
            itemBuilder: (context, index){
              //orderDetailsProvider.InitializeQuantity(productSummary[index].productQuantity);
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(orderSummaryViewModel.foundProductSummary[index].productName, style: const TextStyle(color: AppColor.propsColor, fontWeight: FontWeight.bold, fontSize: 14),),
                    Text('${orderSummaryViewModel.foundProductSummary[index].productPrice}', style: const TextStyle(color: AppColor.propsColor, fontWeight: FontWeight.bold, fontSize: 14),),
                    Text('${orderSummaryViewModel.foundProductSummary[index].productPrice}', style: const TextStyle(color: AppColor.propsColor, fontWeight: FontWeight.bold, fontSize: 14),),
                    Text('${orderSummaryViewModel.foundProductSummary[index].productQuantity}', style: const TextStyle(color: AppColor.propsColor, fontWeight: FontWeight.bold, fontSize: 14),),
                    Text('${orderSummaryViewModel.foundProductSummary[index].cancelQuantity}', style: const TextStyle(color: AppColor.propsColor, fontWeight: FontWeight.bold, fontSize: 14),),
                    Text('${orderSummaryViewModel.foundProductSummary[index].totalProductPrice}', style: const TextStyle(color: AppColor.propsColor, fontWeight: FontWeight.bold, fontSize: 14),),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Selector<OrderSummaryViewModel, bool>(
                      selector: (_, orderDetailsProvider) => orderDetailsProvider.showWidget,
                      builder: (context, value, child) {
                        return value ? Row(
                          children: [
                            IconButton(
                                onPressed: (){
                                  orderSummaryViewModel.increaseProduct(index);
                                },
                                icon: const Icon(Icons.arrow_circle_up, size: 24,),
                                color: AppColor.propsColor),
                            IconButton(
                                onPressed: (){

                                  orderSummaryViewModel.decreaseProduct(index);

                                },
                                icon: const Icon(Icons.arrow_circle_down, size: 24,), color: AppColor.propsColor),
                            IconButton(
                              onPressed: (){
                                orderSummaryViewModel.toggleWidget();
                                orderSummaryViewModel.updateSummary(index);
                              },
                              icon: const Icon(Icons.check_circle_outline, size: 24,), color: AppColor.greenColor,),
                            IconButton(
                                onPressed: (){
                                  orderSummaryViewModel.toggleWidget();
                                  orderSummaryViewModel.goToDefault(index);
                                },
                                icon: const Icon(Icons.cancel_outlined), color: AppColor.redColor)
                          ],
                        ): Container();
                      },),
                  ],
                ) ,
              );
            }),
      ],
    );
  }
}
