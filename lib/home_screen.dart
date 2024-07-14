import 'package:flutter/material.dart';
import 'package:foodapp/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivering to',
              style: TextStyle(color: Colors.black45, fontSize: 16),
            ),
            InkWell(
              onTap: () {
                print('clicked');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Current location',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30)),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text('Search Food'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.filter_center_focus)),
              ],
            ),
            //cards
            SizedBox(
              height: 20,
            ),
            Text(
              'Category',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Container(
              height: 115,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listCards.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(
                                top: 5, bottom: 2, right: 5, left: 8),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(30)),
                            child: Image.asset(listCards[index].imageUrl)),
                        Text(
                          listCards[index].title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    );
                  }),
            ),
            Text(
              'Popular',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            for (int i = 0; i < bannersList.length; i++) ...{
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      // spreadRadius: 5,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(bannersList[i]),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Food name",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 3),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                          Text(" (128 rating)"),
                          Spacer(),
                          Text("Cafe Western Food"),
                          Text("\$5")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            }
          ],
        ),
      )),
    );
  }
}

class CategoryModel {
  final String imageUrl;
  final String title;
  final String? remoteUrl;

  CategoryModel(this.imageUrl, this.title, {this.remoteUrl});
}

List<CategoryModel> listCards = [
  CategoryModel("images/foods/drink.png", "drink"),
  CategoryModel("images/foods/hamburger.png", "burger"),
  CategoryModel("images/foods/pizza.png", "pizza"),
  CategoryModel("images/foods/ramen.png", "ramen"),
  CategoryModel("images/foods/drink.png", "drink"),
];

class PopularItemModel {
  String? imageUrl;
  String? foodName;
  String? HotelName;
  double? rating;
  double? amount;
  int? ratingCount;


  PopularItemModel({
    @required this.imageUrl,
    @required this.foodName,
    @required this.HotelName,
    @required this.rating,
    @required this.amount,
    @required this.ratingCount,
  });
}

List<String> bannersList = [
    "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg",
    "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];
