import 'package:blood_donate_flutter_project/app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import '../widget/image_assets.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text('Exercises'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8.0),
              const ImagesAssets(
                height: 280,
                asset: AppAssets.fitness,

              ),
              const SizedBox(height: 20),
              const Text(
                  '5 Exercises That Will Improve Your Poor Circulation Immediately',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.purple)),
              const SizedBox(height: 15),
              Text(
                  "Circulation is one of those things you probably never think about, even though it's crucial for good health. Your heart pumps about 5 quarts of blood throughout your body's system of blood vessels each minute. When your circulatory system is working well, it delivers oxygen throughout the body and helps to eliminate waste. When circulation is poor, your blood doesn't flow as vigorously—and symptoms can include numbness in your fingers and toes, fluid retention, bloating, and a lack of energy.The good news is that if you are dealing with poor circulation, one of the easiest ways to get your blood pumping optimally again is by exercising. \"When the heart muscle contracts at a higher rate, the blood moves more rapidly through the blood vessels, which improves circulation,\" says Jeff Martin, a chiropractor and personal trainer in Houston, Texas. James Shapiro, a personal trainer in New York City agrees, adding that both cardiovascular and resistance training are important if you want to improve circulation. (Got 10 minutes? Then you've got time to lose the weight for good with Prevention's new 10-minute workouts and 10-minute meals. Get Fit in 10: Slim and Strong for Life now!)\"Not only is raising your heart rate important, but you also need some resistance to cause muscle fibers to contract,\"says Shapiro.\"That muscle contraction prompts blood to flow to that specific region.\"Here, fitness experts share their go-to moves for improving your circulation—immediately.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('1. Squat-To-Row With Resistance Band',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(
                height: 300,
                asset: AppAssets.squat,
              ),
              const SizedBox(height: 10),
              Text(
                  "This exercise works the posterior subsystem (hamstrings, glutes, and lats) and thanks to the resistance band, it qualifies as both a cardio and resistance workout, says Shapiro. Start by attaching a resistance band to an anchor position—say, a tree or sturdy column—at stomach level. Hold both ends of the bands and step a foot or so away from the anchor, then squat down with your arms fully extended. Come up to a full upright position as you bend your elbows to pull in the band, keeping your elbows close to your body. Repeat 3 sets of 10-15 reps.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('2. Push-Ups',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(
                height: 350,
                asset: AppAssets.pushup,
              ),
              const SizedBox(height: 10),
              Text(
                  "This basic move is also double-whammy cardio and resistance exercise, which not only gets the heart rate up but also strengthens your arms, shoulders, chest, and core muscles, says Martin. \"If you can't do push-ups off your toes, don't drop to your knees. Instead, place your hands on a bench or another incline so you're still able to engage your core and stabilizer muscles in a 'plank' position,\" says Martin. Hold a plank position with your hands directly under your shoulders and feet hip-width distance. Bend your elbows out to either side to lower part-way down towards the floor, and then lift yourself back up. Repeat 3 sets of 10-15 reps. (See how to do the perfect push-up here.)",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('3. Ankle Pumps',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(
                height: 250,
                asset: AppAssets.ankle,
              ),
              const SizedBox(height: 10),
              Text(
                  "This exercise works the calf muscle—a large, lower extremity muscle in close proximity to veins and arteries. \"The pumping action of the calf muscle—contracting and releasing—helps move blood and lymph through the veins and arteries of the lower leg, which are prone to blood clots and leg swelling,\" says Alice Holland, director and doctor of physical therapy at Stride Strong Physical Therapy in Portland, Oregon. From a comfortable standing position, raise your heels to transfer your weight to the balls of your feet, and squeeze your calf muscles for just 1 second. (Try not to squeeze too strongly or tightly to avoid cramping.) Repeat 3 sets of 20 reps.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('4. Diaphragmatic Breathing',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(
                height: 250,
                asset: AppAssets.breathing,
              ),
              const SizedBox(height: 10),
              Text(
                  "While this exercise may sound too simple to be effective at boosting circulation, Holland says diaphragmatic breathing stimulates deep lymphatic structures that improve the movement of nutrients and waste material between the body tissues and the bloodstream. Lying down, put one hand on your belly and one hand on your chest. Breathe in, attempting to raise the hand that is resting on your belly, making sure the hand on your chest is not rising. This means you're using your diaphragm more fully as you breathe (most of us breathe into our chests and not our bellies, which doesn't work as much of the diaphragm). Breathe like this for 5 minutes.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('5. Punch-And-Twist',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(
                height: 250,
                asset: AppAssets.ex5,
              ),
              const SizedBox(height: 10),
              Text(
                  "This cardiovascular exercise will warm you up quickly and boost circulation because it puts the larger muscle groups of the arms to work, which boosts blood flow. \"Flexion and extension of the elbows works your arms, rotating your trunk targets your abdominal muscles, and exhaling as you punch also works the diaphragm,\" says Holland. The result? \"This move will warm you up quickly and increase blood flow throughout your body,\" she says. From a comfortable standing position, punch one arm out as far as you can and add a little twist in your spine as you do so. Bring this arm back to your chest, then punch with the other arm. Repeat 3 sets of 20 punches on each side, being sure to exhale fully (and even audibly) on each punch.",
                  style: textStyle),
              const SizedBox(height: 15),
              Text('6. Crunches',
                  style: headLineTextStyle),
              const SizedBox(height: 10),
              const ImagesAssets(
                height: 280,
                asset: AppAssets.crunches,
              ),
              const SizedBox(height: 10),
              Text(
                  "The crunch is an abdominal exercise that works the rectus abdominis muscle. It enables both building 'six-pack' abs and tightening the belly.",
                  style: textStyle),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get textStyle {
    return const TextStyle(
                    letterSpacing: 0.4, fontSize: 13, color: Colors.black);
  }

  TextStyle get headLineTextStyle {
    return const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black);
  }
}
