import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

import '../../consts/lists.dart';
import '../../widgets_common/bg_widget.dart';
import 'components/details_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return bgWidget(
        child: Scaffold(
          body: SafeArea(child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(imgStripe,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.fontFamily(semibold).white.make(),
                        5.heightBox,
                        "customer@example.com".text.white.make(),
                      ],
                    )),
                    OutlinedButton(onPressed: (){}, child: logout.text.fontFamily(semibold).white.make(),
                    )
                  ],
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detailsCard(count:"00",title: "in your cart",width: context.screenWidth/3.4),
                    detailsCard(count:"32",title: "in your wishlist",width: context.screenWidth/3.4),
                    detailsCard(count:"44",title: "in your orders",width: context.screenWidth/3.4),
                  ],
                ),
                100.heightBox,
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context,index)
                    {
                      return const Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profileButtonList.length,
                    itemBuilder: (BuildContext context,int index)
                    {
                      return ListTile(
                        leading: Image.asset(profileButtonsIcon[index],width:22 ,),
                        title: profileButtonList[index].text.make(),

                      );
                    }
                ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make(),


              ],
            ),

            )),
        )
    );
  }
}
