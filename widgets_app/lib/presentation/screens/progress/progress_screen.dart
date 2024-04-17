import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const String name = "progress_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Screen"),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Circular Progress Indicator"),
          SizedBox(
            height: 15,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
          SizedBox(
            height: 15,
          ),
          Text("Circular And Linear Controlled"),
          SizedBox(
            height: 15,
          ),
          _ControllerProgresIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgresIndicator extends StatelessWidget {
  const _ControllerProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return value * 2 / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        
        final progressValue = snapshot.data ?? 0.0;
        

        return  Padding(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black87,
              ),
              const SizedBox(
                width: 20,
              ),
              //linearProgressIndicator needs info of its parent in order to paint the line
              //we'll use expanded widget
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
