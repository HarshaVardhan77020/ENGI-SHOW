import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import '../widgets/simple_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void open(BuildContext context, String title, String desc, IconData icon, List<String> items) {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => SimplePage(title: title, description: desc, icon: icon, items: items),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final features = [
      ('Basics', 'Learn engineering fundamentals', Icons.menu_book, ['Fundamentals', 'Definitions', 'Key concepts']),
      ('Theory', 'Study subject concepts', Icons.auto_stories, ['Unit-wise theory', 'Important topics', 'Revision notes']),
      ('Diagrams', 'Understand engineering diagrams', Icons.account_tree, ['Circuit diagrams', 'Flow diagrams', 'Technical diagrams']),
      ('Practicals', 'Practice laboratory skills', Icons.science, ['Lab experiments', 'Procedure', 'Observation and results']),
      ('Question Bank', 'Prepare for examinations', Icons.quiz, ['Previous questions', 'Important questions', 'Unit-wise questions']),
      ('Quiz', 'Test your knowledge', Icons.psychology, ['Topic quizzes', 'Timed tests', 'Score tracking']),
      ('Attendance', 'Track learning progress', Icons.calendar_month, ['Attendance percentage', 'Learning activity', 'Progress tracking']),
      ('Projects', 'Build practical projects', Icons.build, ['Project ideas', 'Project guidance', 'Project progress']),
      ('Soft Skills', 'Improve communication', Icons.groups, ['Communication', 'Teamwork', 'Presentation skills']),
      ('Interview Preparation', 'Prepare for interviews', Icons.record_voice_over, ['Technical questions', 'HR questions', 'Mock interview preparation']),
      ('Certificate', 'View your achievement', Icons.workspace_premium, ['Quiz performance', 'Attendance', 'Practical performance']),
      ('Career Connection', 'Connect learning with careers', Icons.business_center, ['Company opportunities', 'Career preparation', 'Job readiness']),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('EngiBridge'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline)),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Welcome to EngiBridge 👋',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Your engineering learning and career companion.',
                    style: TextStyle(color: Colors.grey.shade700)),
                const SizedBox(height: 18),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(children: [
                      const CircleAvatar(radius: 30, child: Icon(Icons.school, size: 30)),
                      const SizedBox(width: 16),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                        Text('Student Progress', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                        SizedBox(height: 8),
                        LinearProgressIndicator(value: 0.45),
                        SizedBox(height: 6),
                        Text('45% learning progress'),
                      ])),
                    ]),
                  ),
                ),
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final f = features[index];
                return FeatureCard(
                  title: f.$1, subtitle: f.$2, icon: f.$3,
                  onTap: () => open(context, f.$1, f.$2, f.$3, f.$4),
                );
              }, childCount: features.length),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 280,
                mainAxisExtent: 185,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
