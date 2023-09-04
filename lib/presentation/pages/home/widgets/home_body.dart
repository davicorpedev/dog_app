import 'package:dog_app/presentation/navigation/app_router.dart';
import 'package:dog_app/presentation/navigation/navigator.dart';
import 'package:dog_app/presentation/widgets/custom_cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        ListTile(
          title: Text(
            'Hooman',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        ListTile(
          title: Text(
            'Search between the different breeds of dogs and find your favorites',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(
              text:
                  "If you don't care about the breed and just want to see a random dog. ",
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'Click here',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => AppNavigator.navigateTo(
                          context: context,
                          route: const RandomDogDetailRoute(),
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
              style: Theme.of(context).textTheme.bodyMedium,
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
    final uri = Uri.parse('https://thedogapi.com');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.path}';
    }
  }
}
