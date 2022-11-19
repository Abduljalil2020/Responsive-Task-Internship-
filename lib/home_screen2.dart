
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_task/model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'data_screen.dart';

class HomeScreen2 extends StatelessWidget {
   HomeScreen2({Key? key}) : super(key: key);
  final CarouselController carouselController = CarouselController();
// list of images
  List<DataModel> model =[

    const DataModel(icon: Icons.home, title: "Home"),
    const DataModel(icon: Icons.favorite, title: "Favourite"),
    const DataModel(icon: Icons.add_task, title: "Order"),
    const DataModel(icon: Icons.contact_page, title: "Contact"),
    const DataModel(icon: Icons.home, title: "Home"),
    const DataModel(icon: Icons.favorite, title: "Favourite"),
    const DataModel(icon: Icons.add_task, title: "Order"),
    const DataModel(icon: Icons.contact_page, title: "Contact"),
    const DataModel(icon: Icons.contact_page, title: "Contact"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              sliderBuilder(BuildContext, context),
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8),
          //     child: SizedBox(
          //       height: 500,
          //       child: OrientationBuilder(builder: (BuildContext context, Orientation orientation){
          //         return  GridView.custom(
          //           padding: const EdgeInsets.only(
          //             bottom: 16,
          //             left: 16,
          //             right: 16,
          //           ),
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3
          //           ),
          //           childrenDelegate: SliverChildBuilderDelegate((context, index) {
          //             return buildItem(BuildContext,context,index);
          //           },
          //               childCount: model.length
          //           ),
          //           controller: ,
          //         );
          //       }
          //   ),
          //     ),
          // ),
          // ),
              SizedBox(
                height: 500,
                child: OrientationBuilder(builder: (BuildContext context, Orientation orientation)
                  {
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: orientation == Orientation.portrait ? 2 : 4,

                      itemCount: model.length,
                      itemBuilder: (BuildContext context, int index) =>
                          buildItem(BuildContext, context, index),
                          staggeredTileBuilder: (int index) =>
                           StaggeredTile.count(

                             index == model.length-1? 4 : 1
                               , 1,
                          )

                    );
                  }
                ) ,
              )



            ],

          ),
        ),
    );
  }
  Widget buildImagesSliderItem(BuildContext, context, String image) => Stack(
    children: [
      Container(
          margin: const EdgeInsets.all(8),
          color: Colors.grey,
          child: Image.network(
            image,
            fit: BoxFit.cover,
            height: 800,
          )),
    ],
  );
  Widget buildItem(BuildContext,context,index)=> Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
           height: 20,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:Border.all(
              color: Colors.blue,
              width: 3
          ),
      ),
      child: CircleAvatar(
        backgroundColor:  Colors.transparent ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(color:Colors.blue,size:40,model[index].icon),
            Text(
                model[index].title,style: const TextStyle(
              color: Colors.black
            ),
            ),
          ],
        ),
      ),
    ),
  );
  Widget sliderBuilder(BuildContext, context)=>CarouselSlider.builder(
    itemCount: imagesList.length,
    itemBuilder: ( context, int index, int realIndex) {
      // final imageList = imagesListAssest[index];
      return buildImagesSliderItem(
          BuildContext, context, imagesList[index]);
    },
    carouselController: carouselController,
    options: CarouselOptions(
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration:
        const Duration(milliseconds: 800),
        viewportFraction: 0.8,
        height: 300,
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        onPageChanged: (index, reason) =>
            changeSliderPhotos(index)),
  );
}
