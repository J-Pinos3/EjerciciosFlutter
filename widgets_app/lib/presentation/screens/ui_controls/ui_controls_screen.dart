import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const String name = "ui_controls_screen";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Ui Controls"),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation{CAR, PLANE, BOAT, SUBMARINE}

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.CAR;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;


  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text("Developer Mode"),
          subtitle: Text("Aditional Controls"),
          value: isDeveloper,
          onChanged: (value)=> setState(() {
            isDeveloper =! isDeveloper;
          })
        ),


        ExpansionTile(
          title: Text("Transport vehicle"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
              title: Text("By Car"),
              subtitle: Text("Travel by car"),
              value: Transportation.CAR,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.CAR;
              }),
            ),

            RadioListTile(
              title: Text("By Boat"),
              subtitle: Text("Travel by boat"),          
              value: Transportation.BOAT,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.BOAT;
              }),
            ),

            RadioListTile(
              title: Text("By Plane"),
              subtitle: Text("Travel by plane"),          
              value: Transportation.PLANE,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.PLANE;
              }),
            ),

            RadioListTile(
              title: Text("By Submarine"),
              subtitle: Text("Travel by submarine"),          
              value: Transportation.SUBMARINE,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.SUBMARINE;
              }),
            ),
          ],
        ),


        CheckboxListTile(
          title: Text("Would you like a breakfast?"),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),

        CheckboxListTile(
          title: Text("Would you like a lunch?"),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),

        CheckboxListTile(
          title: Text("Would you like a dinner?"),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
      ],
    );
  }
}