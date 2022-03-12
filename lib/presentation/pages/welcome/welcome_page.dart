import 'package:dog_app/presentation/core/icon/paw_icons.dart';
import 'package:dog_app/presentation/core/widgets/custom_cached_network_image.dart';
import 'package:dog_app/presentation/pages/breed/breed_page.dart';
import 'package:dog_app/presentation/pages/dog/random_dog_detail/random_dog_detail_page.dart';
import 'package:dog_app/presentation/utils/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildBody(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.navigateTo(
            context: context,
            page: const BreedPage(),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: const Icon(Paw.paw),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: SizedBox(
            width: 160,
            height: 160,
            child: CustomCachedNetworkImage(
              imageURL: 'https://cdn2.thedogapi.com/logos/wave-square_256.png',
            ),
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          title: Text(
            'Hello',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        ListTile(
          title: Text(
            'Human',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        ListTile(
          title: Text(
            'Search between the different breeds of dogs and find your favorites',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(
              text:
                  "If you don't care about the breed and just want to see a random dog. ",
              style: Theme.of(context).textTheme.bodyText2,
              children: [
                TextSpan(
                  text: 'Click here',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => AppNavigator.navigateTo(
                          context: context,
                          page: const RandomDogDetailPage(),
                        ),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(
              text: 'This app was made thanks to ',
              style: Theme.of(context).textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(
                  text: 'thedogapi.com',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()..onTap = _launchURL,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _launchURL() async {
    const url = 'https://thedogapi.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
