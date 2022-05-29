import 'package:flutter/material.dart';
import 'package:retro/custom/borderbox.dart';
import 'package:retro/custom/optionbutton.dart';
import 'package:retro/sample_data.dart';
import 'package:retro/utils/constants.dart';
import 'package:retro/utils/custom_functions.dart';
import 'package:retro/utils/widget_functions.dart';

class landing extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    final ThemeData themeData=Theme.of(context);
    final double padding=25.0;
    final sidepadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea( child :Scaffold(
      body: Container(
        
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(padding),

            Padding(padding: sidepadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BorderBox(
                  padding: EdgeInsets.all(10.0), 
                width: 50.0,
                 height: 50.0,
                  child: Icon(Icons.menu,color: COLOR_BLACK,),
                  ),
                   BorderBox(
                     padding: EdgeInsets.all(10.0),
                width: 50.0,
                 height: 50.0,
                  child: Icon(Icons.settings,color: COLOR_BLACK,),
                  ),
              ],
            )
            ),
            addVerticalSpace(padding),
            Padding(padding:sidepadding,
             child:Text("CITY",style: themeData.textTheme.bodyText2)),

             addVerticalSpace(padding),
             Padding(padding:sidepadding,
             child:Text("DELHI",
             style: themeData.textTheme.headline1)
             ),
             Padding(
               padding:sidepadding ,
             child: Divider(color: COLOR_GREY,
             height: padding,)),
              
              addVerticalSpace(10),

             SingleChildScrollView(
               physics: BouncingScrollPhysics(),
               scrollDirection: Axis.horizontal,
               child: Row(children: [
                "<\$2000","For-Sale","3-4 Beds",">1000Sqft"
               ].map((filter)=>ChoiceOption(text: filter)).toList(),),
             ), 
             addVerticalSpace(10),
             Expanded(
               child: ListView.builder(
                 physics: BouncingScrollPhysics(),
                 itemCount: RE_DATA.length,
                 itemBuilder: ((context, index) {
                   return RealEstateItem(itemData: RE_DATA[index]);
                 })
                  ),
             ) 
        ],
        ),
        Positioned(bottom: 10,
        left: (size.width/3),
        child: optionbutton(
          icon: Icons.texture_rounded,
        text: "Map view",
        width: size.width*0.35,
        
        ))
          ],
        )
)));
  }
  
}

class ChoiceOption extends StatelessWidget{
  final String text;

  const ChoiceOption({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData =  Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal:20,vertical:13),
        margin: const EdgeInsets.only(left: 25.0),
        child :Text(text,style: themeData.textTheme.headline5)
    );
  }
}

class RealEstateItem extends StatelessWidget{
  final dynamic itemData;

  const RealEstateItem({super.key, required this.itemData});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData=Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left:25,right:25),
      margin: EdgeInsets.symmetric(vertical:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
            child :Image.asset(itemData["image"])),
            Positioned(
              top: 15,
              right: 15,
              child: BorderBox(
              child:Icon(
                Icons.favorite_border,color: Colors.black ,),
              padding: EdgeInsets.all(0),
              width: 50,
              height: 50,)),
              addVerticalSpace(20)
        ],
        ),
        addVerticalSpace(15),
        Row(children: [
          Text(("${formatCurrency(itemData["amount"])}"),
          style: themeData.textTheme.headline2,),
          addHorizontalSpace(10),
          Text(("${itemData["address"]}"),
          style: themeData.textTheme.bodyText2,),
          
        ],
        ),
        addVerticalSpace(20),
        Text("${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms/ ${itemData["area"]}sqft",
          style: themeData.textTheme.headline5,)
      ]),
    );
  }
  
}