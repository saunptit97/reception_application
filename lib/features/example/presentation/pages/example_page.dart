import 'package:auto_route/annotations.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:reception_application/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/index.dart';
import '../../data/model/index.dart';
import '../../domain/entity/player/player_entity.dart';
import '../bloc/example_bloc.dart';

@RoutePage()
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState
    extends BaseState<ExamplePage, ExampleEvent, ExampleState, ExampleBloc> {
  String text = "Stop Service";

  @override
  void initState() {
    super.initState();
    bloc.pagingController.addPageRequestListener(
      (pageKey) => bloc.add(
        ExampleEvent.getPlayers(
          players: bloc.state.players,
          offset: pageKey,
        ),
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //for listen Continuous change in foreground we will be using Stream builder
            StreamBuilder<Map<String, dynamic>?>(
                stream: FlutterBackgroundService().on('update'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = snapshot.data!;
                  String? lastMessage = data["last_message"];
                  DateTime? date = DateTime.tryParse(data["current_date"]);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(lastMessage ?? 'Unknown'),
                      Text(date.toString()),
                    ],
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      "Foreground Mode",
                      style: TextStyle(color: Colors.white),
                    )),
                onTap: () {
                  FlutterBackgroundService().invoke("setAsForeground");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      "Background Mode",
                      style: TextStyle(color: Colors.white),
                    )),
                onTap: () {
                  print('start');
                  FlutterBackgroundService().invoke("setAsBackground");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () async {
                  final service = FlutterBackgroundService();
                  // final service = widget.appStateService.service;
                  var isRunning = await service.isRunning();
                  if (isRunning) {
                    service.invoke("stopService");
                  } else {
                    service.startService();
                  }

                  if (!isRunning) {
                    setState(() {
                      text = 'Stop Service';
                    });
                  } else {
                    setState(() {
                      text = 'Start Service';
                    });
                  }
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total =
        context.select((ExampleBloc bloc) => bloc.state.players.length);
    return Container(
      decoration:
          BoxDecoration(color: Colors.greenAccent, border: Border.all()),
      padding: const EdgeInsets.all(16),
      child: Text("Count: $total"),
    );
  }
}

class PlayerItem extends StatelessWidget {
  final PlayerEntity data;
  const PlayerItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(data.firstName ?? ""),
          Text("Team: ${data.team}"),
        ],
      ),
    );
  }
}
