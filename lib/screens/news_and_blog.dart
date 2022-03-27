import 'package:flutter/material.dart';
import 'package:onproperty/components/news_and_blog_components.dart';
import 'package:onproperty/utils/colorscheme.dart';

import 'news_and_blog_details.dart';

class NewsAndBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NewsAndBlogBody(),
      ),
    );
  }
}

class NewsAndBlogBody extends StatefulWidget {
  @override
  _NewsAndBlogBodyState createState() => _NewsAndBlogBodyState();
}

class _NewsAndBlogBodyState extends State<NewsAndBlogBody> {
  List<bool> saved = [false, false, false, false, false, false];
  List<String> newsTitle = [
    'News',
    'Blog/Articles',
    'News',
    'News',
    'News',
    'Blog/Articles'
  ];
  List<String> newsDesc = [
    'LA Heights\' unmatchable location piques investor interest',
    'ABAD allowed to construct high-rise building in 5 major cities',
    'DHA signs Mou for construction of villas',
    'Best DIY Tips to decor a house',
    'Perks of Oening property in Islamabad',
    'Checklist for Buying Commercial Real Estate in Pakistan '
  ];
  List<String> urlImages = [
    'assets/images/la_height.jpg',
    'assets/images/abad.jpg',
    'assets/images/dha.jpg',
    'assets/images/decor.jpg',
    'assets/images/islamabad.jpg',
    'assets/images/checklist.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          bannerForNewsAndBlog(context),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: newsTitle.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular((10.0))),
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NewsAndBlogDetails(
                                                      newsDesc[index])));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(10.0)),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  urlImages[index]))),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          newsTitle[index],
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          newsDesc[index],
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              'Post on: 9 hours',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Icon(
                                              Icons.share,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  saved[index] = !saved[index];
                                                });
                                              },
                                              child: saved[index]
                                                  ? Icon(
                                                      Icons.bookmark,
                                                      color: primaryColor,
                                                      size: 20,
                                                    )
                                                  : Icon(
                                                      Icons.bookmark_border,
                                                      color: primaryColor,
                                                      size: 20,
                                                    ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
