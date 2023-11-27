import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

import 'Item_Details.dart';

class CategoryDetails extends StatelessWidget {
  final String?title;
  const CategoryDetails({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) => "Baby Clothing".text.size(12).fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.rounded.size(160,60).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                ),
              ),

              15.heightBox,


              Expanded(child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 7,mainAxisExtent: 250),
                  itemBuilder: (context,index){
                    return  Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(imgP5,height:150,width: 200,fit: BoxFit.cover,),

                        10.heightBox,
                        " Hp Laptop 8GB/16GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                        10.heightBox,
                        "\₹45000".text.color(redColor).fontFamily(bold).size(16).make(),
                      ],

                    ).box.white.roundedSM.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.outerShadow.padding(const EdgeInsets.all(8)).make().onTap(() {
                      Get.to(()=>ItemDetails(title: "Demo Title"));
                    });
                  }))
            ],
          ),
        )
      )
    );
  }
}
