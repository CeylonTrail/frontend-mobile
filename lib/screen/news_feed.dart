import 'package:ceylontrailapp/widgets/newsfeed_post.dart';
import 'package:flutter/material.dart';

import '../widgets/social_media_post.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SocialMediaPost(),
          NewsfeedPost(
            username: 'Leonardo DiCaprio',
            date: DateTime(2019, 5, 21, 17, 31),
            postText: 'Just Relaxing',
            imageUrls: [
              'https://cdn.britannica.com/65/227665-050-D74A477E/American-actor-Leonardo-DiCaprio-2016.jpg',
              'https://media.vogue.fr/photos/5c2f607ef73dacd6ece1793f/1:1/w_1865,h_1865,c_limit/gettyimages_97205874_jpg_3153.jpg',
              'https://media.vogue.fr/photos/5c2f608429d88016b1e83c2e/2:3/w_2560%2Cc_limit/gettyimages_168603098_jpg_3575.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOPlIqxzdbgCg0v-IoE7sncWGOTv9zSCo6fw&s',
            ],
            likes: 999,
            comments: 5000,
            shares: 10,
          ),
          NewsfeedPost(
            username: 'Leonardo DiCaprio',
            date: DateTime(2019, 5, 21, 17, 31),
            postText: 'Just Relaxing',
            imageUrls: [
              'https://cdn.britannica.com/65/227665-050-D74A477E/American-actor-Leonardo-DiCaprio-2016.jpg',
              'https://media.vogue.fr/photos/5c2f607ef73dacd6ece1793f/1:1/w_1865,h_1865,c_limit/gettyimages_97205874_jpg_3153.jpg',
              'https://media.vogue.fr/photos/5c2f608429d88016b1e83c2e/2:3/w_2560%2Cc_limit/gettyimages_168603098_jpg_3575.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOPlIqxzdbgCg0v-IoE7sncWGOTv9zSCo6fw&s',
            ],
            likes: 10,
            comments: 5000,
            shares: 10,
          ),
          NewsfeedPost(
            username: 'Leonardo DiCaprio',
            date: DateTime(2019, 5, 21, 17, 31),
            postText: 'Just Relaxing',
            imageUrls: [
              'https://cdn.britannica.com/65/227665-050-D74A477E/American-actor-Leonardo-DiCaprio-2016.jpg',
              'https://media.vogue.fr/photos/5c2f607ef73dacd6ece1793f/1:1/w_1865,h_1865,c_limit/gettyimages_97205874_jpg_3153.jpg',
              'https://media.vogue.fr/photos/5c2f608429d88016b1e83c2e/2:3/w_2560%2Cc_limit/gettyimages_168603098_jpg_3575.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOPlIqxzdbgCg0v-IoE7sncWGOTv9zSCo6fw&s',
            ],
            likes: 10,
            comments: 5000,
            shares: 10,
          ),
          NewsfeedPost(
            username: 'Leonardo DiCaprio',
            date: DateTime(2019, 5, 21, 17, 31),
            postText: 'Just Relaxing',
            imageUrls: [
              'https://cdn.britannica.com/65/227665-050-D74A477E/American-actor-Leonardo-DiCaprio-2016.jpg',
              'https://media.vogue.fr/photos/5c2f607ef73dacd6ece1793f/1:1/w_1865,h_1865,c_limit/gettyimages_97205874_jpg_3153.jpg',
              'https://media.vogue.fr/photos/5c2f608429d88016b1e83c2e/2:3/w_2560%2Cc_limit/gettyimages_168603098_jpg_3575.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOPlIqxzdbgCg0v-IoE7sncWGOTv9zSCo6fw&s',
            ],
            likes: 10,
            comments: 5000,
            shares: 10,
          ),
          NewsfeedPost(
            username: 'Leonardo DiCaprio',
            date: DateTime(2019, 5, 21, 17, 31),
            postText: 'Just Relaxing',
            imageUrls: [
              'https://cdn.britannica.com/65/227665-050-D74A477E/American-actor-Leonardo-DiCaprio-2016.jpg',
              'https://media.vogue.fr/photos/5c2f607ef73dacd6ece1793f/1:1/w_1865,h_1865,c_limit/gettyimages_97205874_jpg_3153.jpg',
              'https://media.vogue.fr/photos/5c2f608429d88016b1e83c2e/2:3/w_2560%2Cc_limit/gettyimages_168603098_jpg_3575.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOPlIqxzdbgCg0v-IoE7sncWGOTv9zSCo6fw&s',
            ],
            likes: 10,
            comments: 5000,
            shares: 10,
          ),
          NewsfeedPost(
            username: 'Leonardo DiCaprio',
            date: DateTime(2019, 5, 21, 17, 31),
            postText: 'Just Relaxing',
            imageUrls: [
              'https://cdn.britannica.com/65/227665-050-D74A477E/American-actor-Leonardo-DiCaprio-2016.jpg',
              'https://media.vogue.fr/photos/5c2f607ef73dacd6ece1793f/1:1/w_1865,h_1865,c_limit/gettyimages_97205874_jpg_3153.jpg',
              'https://media.vogue.fr/photos/5c2f608429d88016b1e83c2e/2:3/w_2560%2Cc_limit/gettyimages_168603098_jpg_3575.jpg',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOPlIqxzdbgCg0v-IoE7sncWGOTv9zSCo6fw&s',
            ],
            likes: 10,
            comments: 5000,
            shares: 10,
          ),
        ],

      ),
    );
  }
}
