



class Note{
  int? id;
  String content;
  Note({
    this.id ,
    required this.content
  });
  // map ->note
  factory Note.fromMap(Map<String,dynamic>map){
    return Note(
      id: map['id'] as int,
      content : map['content'] as String,
    );
  }
  //not -> map
  Map<String,dynamic> toMap(){
    return{
      'content' : content,
    };
  }
}