// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum Mood {
  HAPPY,
  RELAXED,
  PROUD,
  HOPEFUL,
  NEUTRAL,
  SAD,
  ANXIOUS,
  TIRED,
  ANGRY,
  OVERWHELMED,
  CALM,
  CONFUSED,
  EXCITED,
  GRATEFUL,
  LONELY,
}

class DiaryForm extends StatefulWidget {
  const DiaryForm({super.key});

  @override
  _DiaryFormState createState() => _DiaryFormState();
}

class _DiaryFormState extends State<DiaryForm> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  Mood? _selectedMood;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Diary',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title*'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          DropdownButton<Mood>(
            hint: Text('Mood*'),
            value: _selectedMood,
            onChanged: (Mood? newValue) {
              setState(() {
                _selectedMood = newValue;
              });
            },
            items: Mood.values.map((Mood mood) {
              return DropdownMenuItem<Mood>(
                value: mood,
                child: Text(mood.toString().split('.').last),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
              // You can add your logic to save the diary entry here
              Navigator.of(context).pop();
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
