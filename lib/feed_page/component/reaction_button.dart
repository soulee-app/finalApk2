import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class ReactionButtonDemo extends StatefulWidget {
  const ReactionButtonDemo({super.key});

  @override
  _ReactionButtonDemoState createState() => _ReactionButtonDemoState();
}

class _ReactionButtonDemoState extends State<ReactionButtonDemo> {
  Reaction<String>? _selectedReaction;

  @override
  void initState() {
    super.initState();
    _selectedReaction = Reaction<String>(
      value: 'Daisy',
      icon: _buildReactionIcon('assets/flowers/Orchid.png', 'daisy'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xEDE1C9C7),
      borderRadius: BorderRadius.circular(12),
      child: ReactionButton<String>(
        onReactionChanged: (Reaction<String>? reaction) {
          setState(() {
            _selectedReaction = reaction;
          });
          debugPrint('Selected value: ${reaction?.value}');
        },
        reactions: <Reaction<String>>[
          Reaction<String>(
            value: 'Daisy',
            icon: _buildReactionIcon('assets/flowers/Orchid.png', 'Daisy'),
          ),
          Reaction<String>(
            value: 'Ful',
            icon: _buildReactionIcon('assets/flowers/Ful.png', 'Ful'),
          ),
          Reaction<String>(
            value: 'Gada',
            icon: _buildReactionIcon('assets/flowers/Gada.png', 'Gada'),
          ),
          Reaction<String>(
            value: 'Golap',
            icon: _buildReactionIcon('assets/flowers/Golap 1.png', 'Golap'),
          ),
        ],
        selectedReaction: _selectedReaction,
        itemSize: const Size(88, 40),
        animateBox: true,
        boxPadding: const EdgeInsets.symmetric(vertical: 2), // Add padding
      ),
    );
  }

  Widget _buildReactionIcon(String asset, String label) {
    return SizedBox(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Row(
          children: [
            Image.asset(
              asset,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
