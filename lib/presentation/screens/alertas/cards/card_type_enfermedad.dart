import 'package:flutter/material.dart';

class CardTypeEnfermedad extends StatefulWidget {
  final String label;
  final double elevation;

  const CardTypeEnfermedad({super.key, required this.label, required this.elevation});

  @override
  State<CardTypeEnfermedad> createState() => CardTypeEnfermedadState();
}

class CardTypeEnfermedadState extends State<CardTypeEnfermedad> {
  IconData icon = Icons.expand_more;
  double h = 100.0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: h,
        child: Card(
          color: colors.surfaceVariant,
          elevation: widget.elevation,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Row(children: [
                          const Icon(Icons.warning),
                          const SizedBox(width: 10),
                          Text(widget.label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ]),
                      ),

                      if(icon == Icons.expand_less)
                      ...[
                        const SizedBox(height: 10,),

                        const Text('COMPORTAMIENTO EXTRAÑO DE AVE\nEN EL GALPÓN 2'),
                     
                        const SizedBox(height: 30,),

                        Column(
                          children: [
                            FilledButton(
                              onPressed: (){
                                  
                              },
                      
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Column(
                                  children: [
                                    Text('Declarar cuarentena'),
                                    SizedBox(height: 10,),
                                    Icon(Icons.medical_services_outlined)
                                  ],
                                ),
                              )
                            ),
                          ],
                        ),
        
                      ],
                      
                    ]),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(icon),
                    onPressed: () {
                      setState(() {
                        if (icon == Icons.expand_more) {
                          icon = Icons.expand_less;
                          h = h + 200.0;
                        } else {
                          icon = Icons.expand_more;
                          h = h - 200.0;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}