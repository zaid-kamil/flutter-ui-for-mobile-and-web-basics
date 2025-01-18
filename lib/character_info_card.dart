import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: CharacterInfoCard(
        characterName: 'Uzumaki Naruto',
        description: 'Hidden Leaf Village',
        imagePath: 'assets/images/naruto.jpg',
      ),
    ),
  ));
}

class CharacterInfoCard extends StatelessWidget {
  final String characterName;
  final String description;
  final String imagePath;

  const CharacterInfoCard({
    super.key,
    required this.characterName,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return _buildMobileLayout();
        } else {
          return _buildDesktopLayout();
        }
      },
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        Image.asset(imagePath),
        Text(characterName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Secret Info ${index + 1}'),
                  subtitle: const Text('Lorem ipsum dolor sit amet'),
                  leading: const Icon(Icons.adb),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              );
            },
            itemCount: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    double height = 500;
    return Column(
      children: [
        Container(
          color: Colors.white70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(100),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    imagePath,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      characterName,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline),
                      label: const Text('More Info'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          // gridview with cards
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Card(
                color:
                    Colors.primaries[index % Colors.primaries.length].shade100,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text('Secret Info ${index + 1}'),
                  subtitle: const Text('Lorem ipsum dolor sit amet'),
                  leading: const Icon(Icons.adb),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              );
            },
            itemCount: 15,
          ),
        ),
      ],
    );
  }
}
