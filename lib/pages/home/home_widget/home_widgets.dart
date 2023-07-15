import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// search Button
Widget searchButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Search Anything")));
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Colors.brown.shade50, Colors.grey.shade100],
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search_rounded,
            size: 28,
            color: Colors.black45,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              "Search Products....",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.comfortaa(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Spacer()
        ],
      ),
    ),
  );
}

Widget shimmerTab(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics:
        const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    child: Row(
      children: [
        ...List.generate(
            6,
            (index) => Container(
                  height: 50,
                  width: 120,
                  margin: EdgeInsets.only(left: index == 0 ? 0 : 5, right: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200),
                ))
      ],
    ),
  );
}

// Show Products
class ProductContainer extends StatelessWidget {
  final String imgUrl;
  final String productName;
  final String price;
  const ProductContainer(
      {Key? key,
      required this.imgUrl,
      required this.productName,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 1,
            blurStyle: BlurStyle.outer)
      ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(height: 150, image: NetworkImage(imgUrl)),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.comfortaa(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "\u{20B9}$price",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                        elevation: MaterialStateProperty.all(0.0)),
                    onPressed: () {},
                    child: const Center(
                        child: Text(
                      "Add To Cart",
                      textAlign: TextAlign.center,
                    ))),
              ),
              const Spacer(),
              FaIcon(
                FontAwesomeIcons.heart,
                color: black,
              )
            ],
          ),
        ],
      ),
    );
  }
}


// Tab Shimmer effect
