import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:notes_app/global_variables.dart';
import 'package:notes_app/pages/add_note_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<String> filters = const [
    "All notes",
    "Default notes",
    "Quick notes",
    "Call summaries",
    "Handwritten notes",
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    child: Icon(Icons.search_outlined, size: 36),
                  ),
                  Icon(Icons.more_vert_rounded, size: 36),
                ],
              ),
              Text(
                'Notes',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${sampleNotes.length} notes',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? Colors.grey[800]
                              : null,
                          label: Text(filter),
                          labelPadding: EdgeInsets.all(8),
                          labelStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: selectedFilter == filter
                                ? FontWeight.bold
                                : null,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(14),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: MasonryView(
                    itemPadding: 2,
                    listOfItem: sampleNotes,
                    numberOfColumn: 2,
                    itemBuilder: (item) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return AddNotePage(
                                  title: item['header'],
                                  content: item['content'],
                                );
                              },
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.grey[900],
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${item['header']}',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '${item['content']}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6),
                                Text(
                                  '${item['date']}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return AddNotePage(title: '', content: '');
                },
              ),
            );
          },
          backgroundColor: const Color.fromARGB(255, 245, 176, 17),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(50),
          ),
          child: Icon(Icons.add, size: 50, color: Colors.white),
        ),
      ),
    );
  }
}
