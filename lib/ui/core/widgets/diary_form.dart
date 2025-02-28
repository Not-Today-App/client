// ignore_for_file: constant_identifier_names

import 'package:client/domain/models/diary/diary.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/main/diary/diaries_view_model.dart';
import 'package:client/utils/diary_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiaryForm extends StatefulWidget {
  const DiaryForm({
    super.key,
    required this.viewModel,
    this.diary,
  });

  final DiariesViewModel viewModel;
  final Diary? diary; // Diary to edit (null for create mode)

  @override
  State<DiaryForm> createState() => _DiaryFormState();
}

class _DiaryFormState extends State<DiaryForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _moodController = TextEditingController(text: Mood.NEUTRAL.name);

  @override
  void initState() {
    super.initState();

    // Pre-fill the form if in edit mode
    if (widget.diary != null) {
      _titleController.text = widget.diary!.title;
      _contentController.text = widget.diary!.content;
      _moodController.text = widget.diary!.mood;
    }
  }

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
        id: widget.diary?.id,
        title: _titleController.text,
        content: _contentController.text,
        mood: _moodController.text,
      );

      if (widget.diary == null) {
        // Create a new diary
        widget.viewModel.createDiary.execute(diary);
      } else {
        // Update an existing diary
        widget.viewModel.updateDiary.execute(diary);
      }
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
              Text(widget.diary == null ? 'Create Diary' : 'Edit Diary',
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
                value: Mood.values.firstWhere(
                  (mood) =>
                      mood.toString().split('.').last == _moodController.text,
                  orElse: () => Mood.NEUTRAL,
                ),
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
                child: Text(widget.diary == null ? 'Create' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
