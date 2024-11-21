import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  final Function(String, String, String) onAddBook;

  const AddBookPage({super.key, required this.onAddBook});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: const Text('Tambah Buku Baru'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left), 
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Judul'),
              ),
              TextField(
                controller: authorController,
                decoration: const InputDecoration(labelText: 'Penulis'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final title = titleController.text;
                  final author = authorController.text;
                  final description = descriptionController.text;

                  if (title.isNotEmpty && author.isNotEmpty && description.isNotEmpty) {
                    widget.onAddBook(title, author, description);
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Buku berhasil ditambahkan')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Semua bidang harus diisi')),
                    );
                  }
                },
                child: const Text('Simpan Buku'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[200],  
                  foregroundColor: Colors.black,        
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
