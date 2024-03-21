import 'package:flutter/material.dart';

class LastReadCard extends StatelessWidget {
  const LastReadCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Ink(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Last Read',
                      style: TextStyle(
                        color: Color(0xff1E242B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/bismillah-calligraphy.png',
                      height: 40,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Al Fatihah',
                          style: TextStyle(
                            color: Color(0xff1E242B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Ayah 1',
                          style: TextStyle(
                            color: Color(0xff1E242B),
                          ),
                        ),
                      ],
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
