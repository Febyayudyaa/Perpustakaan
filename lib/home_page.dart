import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  //Buat variabel untuk menyimppan daftar buku
  List<Map<String, dynamic>> buku = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  //fungsi untuk mengambil data buku dari supabase
  Future<void> fetchBooks() async {
    final response = await Supabase.instance.client.from('buku').select();

    setState(() {
      buku = List<Map<String, dynamic>>.from(response);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchBooks,
          ),
        ],
      ),
      body: buku.isEmpty
      ? const Center(child: CircularProgressIndicator())
      : ListView.builder(
          itemCount:buku.length,
          itemBuilder: (context, index) {
            final book = buku[index];
            return ListTile( 
              title: Text(book['judul'] ?? 'Judul', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book['penulis'] ?? 'Penulis', style: TextStyle(fontStyle: FontStyle.italic,fontSize:14 )),
                  Text(book['deskripsi'] ?? 'Deskripsi', style: TextStyle(fontSize:12 )),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // tombol edit
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {

                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {

                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          }
        )
    );
  }
}

