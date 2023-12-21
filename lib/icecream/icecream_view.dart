import 'dart:convert';

import 'package:flutter/material.dart';
import 'model/icecream.dart';
import 'package:flutter/services.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  Future<List<Icecream>?> loadIcecreams() async{
    final rawIcecreams = await rootBundle.loadString("assets/icecream.json");
    await Future.delayed(const Duration(seconds: 1));
    final icecreams = icecreamDataFromJson(rawIcecreams);
    return icecreams.icecreams;
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Icecreams",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
          Text("We Have Something Yummy for You",
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          Expanded(
              child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(future: loadIcecreams(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        if (snapshot.hasError) {
                          // Handle the error case
                          return Text("Error: ${snapshot.error}");
                        }
                        final icecreams = snapshot.data;
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height/3,
                          //height: 100,
                          child: ListView.builder(
                            //shrinkWrap: true,
                            itemBuilder: (context,index){
                            final icecream = icecreams[index];
                            return SizedBox(
                              width: 200,
                              child: Card(
                                clipBehavior: Clip.hardEdge,
                                color: Colors.orange.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.network(
                                        icecream.image!,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                            scrollDirection: Axis.horizontal,
                            itemCount: icecreams!.length,
                          ),
                        );
                      }
                      else{
                        return const Center(child: CircularProgressIndicator.adaptive());
                      }
                    }
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
