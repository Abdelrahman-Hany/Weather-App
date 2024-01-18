import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child:  Center(
        child: Column(
          mainAxisSize:MainAxisSize.min,
          children: [
            Text('there is no weather 😔 start',
            style: TextStyle(fontSize: 25,
            fontWeight: FontWeight.bold,),
            ),
    
          Center(
            child: Text('searching now 🔍',
                  style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
