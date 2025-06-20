import 'package:flutter/material.dart';
import '../../models/section.dart';
import '../../services/supabase_service.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final SupabaseService service = SupabaseService();
  List<Section> sections = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadSections();
  }

  Future<void> loadSections() async {
    final data = await service.fetchSections();
    setState(() => sections = data);
  }

  void _createSection() async {
    if (nameController.text.isEmpty || slugController.text.isEmpty) return;
    await service.createSection(
      Section(
        id: UniqueKey().toString(),
        name: nameController.text,
        slug: slugController.text,
        isVisible: true,
      ),
    );
    nameController.clear();
    slugController.clear();
    loadSections();
  }

  void _deleteSection(String id) async {
    await service.deleteSection(id);
    loadSections();
  }

  void _toggleVisibility(Section section, bool val) async {
    setState(() => section.isVisible = val);
    await service.updateSectionVisibility(section.id, val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Section Name'),
            ),
            TextField(
              controller: slugController,
              decoration: const InputDecoration(labelText: 'Slug'),
            ),
            ElevatedButton(onPressed: _createSection, child: const Text('Create')),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  final s = sections[index];
                  return Card(
                    child: ListTile(
                      title: Text(s.name),
                      subtitle: Text(s.slug),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Switch(
                            value: s.isVisible,
                            onChanged: (val) => _toggleVisibility(s, val),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteSection(s.id),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
