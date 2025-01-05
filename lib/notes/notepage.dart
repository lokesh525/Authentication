
import 'package:authentication_user/notes/database.dart';
import 'package:authentication_user/notes/notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget{
  const NotePage({super.key});


  @override
  State<NotePage> createState() => _NotePageState();

}
class _NotePageState extends State<NotePage>{
  final databse = NoteDatabase();
  final noteController = TextEditingController();

//add new note
  void addNewNode(){
    showDialog(context: context, builder:(context)=> AlertDialog(
      title: Text('New Note'),
      content: TextField(
        controller: noteController,
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
          noteController.clear();
        }, child: Text('cancal')),
        //Save
        TextButton(onPressed: (){
          final newNote = Note(content: noteController.text);
          databse.createNode(newNote);
          Navigator.pop(context);
          noteController.clear();
        }, child: Text('Save'))
      ],
    ));

  }

  void updateNode(Note note){
    noteController.text = note.content;

    showDialog(context: context, builder:(context)=> AlertDialog(
      title: Text('Update Note'),
      content: TextField(
        controller: noteController,
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
          noteController.clear();
        }, child: Text('cancel')),
        //Save
        TextButton(onPressed: (){
          final newNote = Note(content: noteController.text);
          databse.updateNote(note, noteController.text);
          Navigator.pop(context);
          noteController.clear();
        }, child: Text('Save'))
      ],
    ));

  }
  void deleteNote(Note note){
    showDialog(context: context, builder:(context)=> AlertDialog(
      title: Text('Delete Note'),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
          noteController.clear();
        }, child: Text('cancel')),
        //Save
        TextButton(onPressed: (){
          final newNote = Note(content: noteController.text);
          databse.deleteNote(note);
          Navigator.pop(context);
          noteController.clear();
        }, child: Text('Delete'))
      ],
    ));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blueGrey ,
        title: Center(child: Text('Notes', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:addNewNode,
        child: Icon(Icons.add),
      ),
      body: Container(
        color: Colors.teal.shade300,
        child: StreamBuilder(
          stream: databse.stream,
          builder: (context, snapshot) {
            //loading
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );

            }
            final notes = snapshot.data!;
            return ListView.separated(
              itemCount: notes.length,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 70,
                  thickness: 2,

                );
              },

              itemBuilder:(context, index) {
                //single note
                final note = notes[index];
                //multiple
                return ListTile(
                  title: Text(note.content),
                  trailing: SizedBox(
                    width: 130,
                    child: Row(
                      children: [
                        //update
                        TextButton(onPressed: (){
                          updateNode(note);
                        }, child:Icon(Icons.edit), ),
                        TextButton(onPressed: (){
                          deleteNote(note);
                        }, child:Icon(Icons.delete), )
                      ],
                    ),
                  ),
                );
              },
            );

            //loaded
          },
        ),
      ),
    );

  }

}