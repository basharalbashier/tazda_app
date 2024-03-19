import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../main.dart';
import '../modules/user.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/textfield_widget.dart';


class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({super.key, required this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
  

    return  Builder(
        builder: (context) => Scaffold(
          // appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: bgList[2],
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage(user: widget.user,)),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(widget.user),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(widget. user),
            ],
          ),
        ),
    
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email??"",
            style: TextStyle(color: Colors.grey),
          ),
            RatingBar.builder(
                              initialRating:  4.3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 30,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              
                              ),
                              onRatingUpdate: (rating) {},
                            ),
        ],
      );

   

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
             "Let me know if any part needs more explanation. We can also look at the code sample files you have open to see how certain aspects are already implemented. A clean, responsive UI along with robust state and data management will help create a nice editable profile page.",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}



class EditProfilePage extends StatefulWidget {
  final User user;

  const EditProfilePage({super.key, required this.user});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {


  @override
  Widget build(BuildContext context) =>  Builder(
          builder: (context) => Scaffold(
            // appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                // ProfileWidget(
                //   // imagePath: user.imagePath,
                //   isEdit: true,
                //   onClicked: () async {},
                // ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: widget.user.username,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text:widget.user.email??'${ widget.user.username}@email.com',
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'About',
                  text:widget. user.token,
                  maxLines: 5,
                  onChanged: (about) {},
                ),
                const SizedBox(height: 10),
                
              ],
            ),
          ),
    
      );
}
