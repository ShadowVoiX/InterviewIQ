import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'history_screen.dart';
import 'profile_screen.dart';
import 'role_selection.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  String userName = "User";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    if (doc.exists) {
      setState(() {
        userName = doc["fullName"] ?? "User";
      });
    }
  }

  Stream<QuerySnapshot> interviewStream() {
    final user = FirebaseAuth.instance.currentUser;

    return FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("interviews")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  int calculateStreak(List<QueryDocumentSnapshot> docs) {
    if (docs.isEmpty) return 0;

    int streak = 0;
    DateTime? lastDate;

    for (var doc in docs) {
      final ts = doc["createdAt"];

      if (ts == null) continue;

      DateTime date = ts.toDate();

      if (lastDate == null) {
        streak = 1;
      } else {
        final diff = lastDate.difference(date).inDays;

        if (diff == 1) {
          streak++;
        } else if (diff > 1) {
          break;
        }
      }

      lastDate = date;
    }

    return streak;
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      homePage(),
      const HistoryScreen(),
      const ProfileScreen(), // Placeholder for profile screen
    ];

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget homePage() {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
        await Future.delayed(const Duration(milliseconds: 400));
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff315CFD), Color(0xff7D2EFF)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Good Morning,",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "“Success is where preparation meets opportunity.”",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RoleSelectionScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text("Start New Interview"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16),
              child: StreamBuilder<QuerySnapshot>(
                stream: interviewStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final docs = snapshot.data!.docs;

                  List<int> scores = docs
                      .map((d) => (d["score"] ?? 0) as int)
                      .toList();

                  int total = docs.length;

                  int avg = scores.isEmpty
                      ? 0
                      : (scores.reduce((a, b) => a + b) / scores.length)
                          .round();

                  int highest = scores.isEmpty
                      ? 0
                      : scores.reduce((a, b) => a > b ? a : b);

                  int streak = calculateStreak(docs);

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    children: [
                      StatCard(title: "Interviews", value: "$total"),
                      StatCard(title: "Avg Score", value: "$avg%"),
                      StatCard(title: "Highest", value: "$highest%"),
                      StatCard(title: "Streak", value: "$streak days"),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(title),
          ],
        ),
      ),
    );
  }
}