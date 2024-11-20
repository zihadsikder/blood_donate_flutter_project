import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/app_bar_widgets.dart';
import '../widget/image_assets.dart';

class DietChart extends StatelessWidget {
  const DietChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidgets(title: 'Diet Chart'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text('Before Blood Donation',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black)),
              const SizedBox(height: 15),
              Text(
                  "First of all, try to relax. Being scared makes your body tense up and makes the whole thing take longer. In terms of food, before you give blood it's essential that your iron levels are high and that you're as hydrated as possible. Here's 5 foods to eat before you donate:",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('1. Water',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.water,
              ),
              const SizedBox(height: 10),
              Text(
                  "This one really has nothing to do with iron levels, but it is by far the most important thing to eat (drink) before you donate blood. Being sufficiently hydrated makes the whole process easier and helps you to feel less lightheaded when it's over.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('2. Lentils',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.lentils,
              ),
              const SizedBox(height: 10),
              Text(
                  "Red meat not your thing? No problem. Lentils are absolutely packed with iron, along with tons of other important nutrients, making them one of the healthiest foods out there.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('3. Spinach',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.spinach,
              ),
              const SizedBox(height: 10),
              Text(
                  "Channel your inner Popeye and load up on spinach before you donate blood. It's super versatile — sauté it, add it to a green smoothie, or use it as a vitamin-packed base for your favorite salad — and also surprisingly hydrating. Win win.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('4. Lean Red Meat',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.lean,
              ),
              const SizedBox(height: 10),
              Text(
                  "While it's true that red meat should be eaten in moderation, it's not a bad idea to eat a steak before you give blood. With 2.4 milligrams of iron per 100 grams of meat, you'll pass the hemoglobin test with flying colors. Just make sure it's not too fatty.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('5. Watermelon',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.watermelon,
              ),
              const SizedBox(height: 10),
              Text(
                  "Do you have trouble just drinking plain water? Try eating a hydrating watermelon instead. If you're not into watermelon, strawberries are another ultra-hydrating fruit that are perfect for eating before you donate blood.",
                  style: textStyle),
              const SizedBox(height: 20),
              const Text('After Blood Donation',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black)),
              const SizedBox(height: 15),
              Text(
                  "Congrats! You just made a difference in as many as three people's lives. Re-hydrate and treat yourself for being a good person with these 5 foods: ",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('1. Juice',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.juice,
              ),
              const SizedBox(height: 10),
              Text(
                  "Ditch the boring water for a sweeter, hydrating option. If you're not about added sugars, try coconut water or a cold-pressed juice.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('2. Avocado',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.avocado,
              ),
              const SizedBox(height: 10),
              Text(
                  "Since you're supposed to avoid fatty foods before you donate, be sure to go ham on some avocados afterwards. On top of being delicious, they're packed full of omega-3's. Score! Whether you smash it on top of a piece of toast or turn it into guac, there's really no way to go wrong here.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('3. Cookies',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.cookies,
              ),
              const SizedBox(height: 10),
              Text(
                  "No nutritional value here, but hey — you deserve a treat. While the blood drive will likely provide these, you can also bake your own.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('4. Cereal',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.cereal,
              ),
              const SizedBox(height: 10),
              Text(
                  "Not only is cereal the trendiest food of 2017, but also it's often fortified with iron. Opt for a low-sugar variety like cheerios or chex if you're Iryna be extra healthy (but let's be real, lucky charms = life).",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('5. Mocktails',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(

                asset: AppAssets.mocktails,
              ),
              const SizedBox(height: 10),
              Text(
                  "The Red Cross recommends avoiding alcohol for at least 24 hours after you donate blood. Don't get too down, though, because there are tons of fun mocktails you can drink. I guarantee you won't even miss the alcohol.",
                  style: textStyle),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get headLineTextStyle {
    return const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black);
  }

  TextStyle get textStyle {
    return const TextStyle(
                    letterSpacing: 0.4, fontSize: 13, color: Colors.black);
  }
}
