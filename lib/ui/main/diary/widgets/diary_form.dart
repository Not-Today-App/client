// ignore_for_file: constant_identifier_names

import 'package:client/domain/models/diary/diary.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/main/diary/diaries_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  const DiaryForm({super.key, required this.viewModel});

  final DiariesViewModel viewModel;

  @override
  State<DiaryForm> createState() => _DiaryFormState();
}

class _DiaryFormState extends State<DiaryForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _moodController = TextEditingController(text: Mood.NEUTRAL.name);

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _moodController.dispose();
    super.dispose();
  }

  String? _validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title is required';
    }
    return null;
  }

  String? _validateContent(String? value) {
    if (value != null && value.length > 255) {
      return 'Content cannot exceed 255 characters';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final diary = Diary(
        title: _titleController.text,
        content: _contentController.text,
        mood: _moodController.text,
      );

      // Execute the createDiary command
      widget.viewModel.createDiary.execute(diary);

      GoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSizes.p16,
          right: AppSizes.p16,
          top: AppSizes.p32,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Create Diary',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSizes.p32),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title*',
                ),
                maxLength: 30,
                validator: _validateTitle,
              ),
              const SizedBox(height: AppSizes.p16),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Content',
                  hintText: 'What did you do today?',
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                validator: _validateContent,
                maxLength: 255,
              ),
              const SizedBox(height: AppSizes.p16),
              DropdownButtonFormField<Mood>(
                value: Mood.NEUTRAL,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mood*',
                ),
                items: Mood.values.map((Mood mood) {
                  return DropdownMenuItem<Mood>(
                    value: mood,
                    child: Text(mood.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (Mood? newValue) {
                  if (newValue != null) {
                    _moodController.text = newValue.toString().split('.').last;
                  }
                },
              ),
              const SizedBox(height: AppSizes.p16),
              FilledButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
