import 'package:flutter/material.dart';

class ItemPerson extends StatefulWidget {
  const ItemPerson({super.key});

  @override
  State<ItemPerson> createState() => _ItemPersonState();
}

class _ItemPersonState extends State<ItemPerson> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightBlue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.only(bottom: 18, left: 18, right: 18),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Label',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Content'),
              const Text(
                'Label',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Content'),
              const Text(
                'Label',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Content'),
              const Text(
                'Label',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Content'),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  isVisible = !isVisible;
                }),
                child: const Text(
                  'See more',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Visibility(
                maintainAnimation: true,
                maintainState: true,
                visible: isVisible,
                child: const Column(
                  children: [
                    Text(
                      'Label',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Content'),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
