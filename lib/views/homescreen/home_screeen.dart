import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/homebuttons.dart';

import '../../consts/lists.dart';
import 'Components/featured_button.dart';

class HomScreen extends StatelessWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
        color: lightGrey,
        width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(55)
                ),
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: whiteColor,
                hintText: searchAnything,
                  hintStyle: TextStyle(color:textfieldGrey),
              ),
            ),

          ),
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VxSwiper.builder(
                      aspectRatio: 10/9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,

                      itemCount: sliderList.length,
                      itemBuilder:(context,index){
                        return Container(
                          child: Image.asset(
                            sliderList[index],
                            fit:BoxFit.fill,
                          ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 3)).make(),
                        );
                      }
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                    children: List.generate(2, (index) => homeButton(
                      height: context.screenHeight*0.15,
                      width: context.screenWidth/2.5,
                      icon: index==0?icTodaysDeal:icFlashDeal,
                      title: index==0?todayDeal:flashsale,
                    )),
                  ),
                  10.heightBox,
                  //2 Slider Box
                  VxSwiper.builder(
                      aspectRatio: 10/9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,

                      itemCount: secondSliderList.length,
                      itemBuilder:(context,index){
                        return Container(
                          child: Image.asset(
                            secondSliderList[index],
                            fit:BoxFit.fill,
                          ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 3)).make(),
                        );
                      }
                  ),
                  //Categories Buttons
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) => homeButton(
                      height: context.screenHeight*0.15,
                      width: context.screenWidth/3.5,
                      icon: index==0?icTopCategories:index==1?icBrands:icTopSeller,
                      title: index==0?topCategories:index==1?brand:topSeller,
                    )),
                  ),
                  //Features Categories
                  10.heightBox,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: featureCategories.text.color(darkFontGrey).size(15).fontFamily(semibold).make()),

                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(3, (index) => Column(
                        children: [
                          featuredButton(icon: featuredImages1[index],title: featuredTitle1[index]),
                          10.heightBox,
                          featuredButton(icon: featuredImages2[index],title: featuredTitle2[index]),

                        ],
                      ))
                    ),
                  ),
                  //featured Products

                  20.heightBox,
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(color: redColor),
                    child: Column(
                      children: [
                        FeaturedProduct.text.white.fontFamily(bold).size(18).make(),
                        10.heightBox,
                        
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(6, (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(imgP1,width: 150,fit: BoxFit.cover,),

                              10.heightBox,
                              " Hp Laptop 8GB/16GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                10.heightBox,
                                "\₹45000".text.color(redColor).fontFamily(bold).size(16).make(),
                              ],

                            ).box.white.rounded.margin(EdgeInsets.symmetric(horizontal: 4)).padding(const EdgeInsets.all(8)).make()),
                          ),
                        ),

                      ],
                    ),
                  ),
                  //ThirdSwiper
                  10.heightBox,
                  //2 Slider Box
                  VxSwiper.builder(
                      aspectRatio: 10/9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,

                      itemCount: secondSliderList.length,
                      itemBuilder:(context,index){
                        return Container(
                          child: Image.asset(
                            secondSliderList[index],
                            fit:BoxFit.fill,
                          ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 3)).make(),
                        );
                      }
                  ),
                  //AllProduct Details
                  20.heightBox,
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing:8,crossAxisSpacing: 8,mainAxisExtent: 300 ),
                      itemBuilder: (context,index){
                        return  Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(imgP5,height:200,width: 200,fit: BoxFit.cover,),

                            10.heightBox,
                            " Hp Laptop 8GB/16GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "\₹45000".text.color(redColor).fontFamily(bold).size(16).make(),
                          ],

                        ).box.white.roundedSM.margin(EdgeInsets.symmetric(horizontal: 4)).padding(const EdgeInsets.all(8)).make();

                      }
                  )



                ],
              ),
            ),
          )



        ],
      )),



    );
  }
}
