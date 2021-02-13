// Packages
import 'package:flutter/material.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';
// Widgets
import 'package:SearchableCards/widgets/post_card/post_card.dart';
import 'package:SearchableCards/widgets/shared/scf_text/scf_text.dart';
// Dummy Data
import 'package:SearchableCards/dummy_data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> _posts = PostModel.listFromJson(DummyData.posts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ScfText("Searchable Cards"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _posts.length,
              itemBuilder: (BuildContext context, int idx) => PostCard(post: _posts[idx]),
            ),
          ],
        ),
      ),
    );
  }
}
