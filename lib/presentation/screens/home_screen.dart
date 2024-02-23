import 'package:todo_app/presentation/models/note.dart';
import 'package:todo_app/presentation/widgets/shared/newtask_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  List<Note> sampleNotes = [
    Note(
      id: 1,
      name: "Germany",
    ),
    Note(id: 2, name: "English", isChecked: true)
  ];

  void newTask() {
    showDialog(
        context: context,
        builder: (context) => DialogNewTask(
              controller: controller,
              onSave: () {
                if (controller.text != "") {
                  setState(() {
                    sampleNotes.add(Note(id: 10, name: controller.text));
                    Navigator.of(context).pop();
                    controller.clear();
                  });
                }
              },
            ));
  }

  void changeCheck(int index) {
    setState(() {
      sampleNotes[index].isChecked = !sampleNotes[index].isChecked;
    });
  }

  void deleteTask(int index) {
    setState(() {
      sampleNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemCount: sampleNotes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              onTap: () => changeCheck(index),
              leading: Checkbox(
                value: sampleNotes[index].isChecked,
                onChanged: (value) => changeCheck(index),
              ),
              title: Text(
                sampleNotes[index].name,
                style: TextStyle(
                    decoration: sampleNotes[index].isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              trailing: IconButton(
                onPressed: () => deleteTask(index),
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
