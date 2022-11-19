
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_task/model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'data_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final CarouselController carouselController = CarouselController();
// list of images
  List<DataModel> model =[

    const DataModel(icon: Icons.home, title: "طلب مقابلة"),
    const DataModel(icon: Icons.celebration, title: "نماذج"),
    const DataModel(icon: Icons.web, title: "طلب توظيف"),
    const DataModel(icon: Icons.call_end_rounded, title: "تواصل معنا"),
    const DataModel(icon: Icons.person, title: "طلب توظيف"),
    const DataModel(icon: Icons.call_end_rounded, title: "تواصل معنا"),
    const DataModel(icon: Icons.call_end_rounded, title: "last"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            CarouselSlider.builder(
              itemCount: imagesList.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
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
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
                return
                  Center(
                    child: GridView.builder(
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3
                      ),
                      itemCount: model.length,
                      itemBuilder: (context,index){

                        return buildItem(BuildContext,context,index);
                      },



                    ),
                  );
              },

              ),
            ),

          ],

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
                model[index].title,style: TextStyle(
              color: Colors.black
            ),
            ),
          ],
        ),
      ),
    ),
  );
}
