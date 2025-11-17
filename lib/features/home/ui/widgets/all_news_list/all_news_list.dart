import 'package:flutter/material.dart';

class AllNewsList extends StatelessWidget {
  const AllNewsList({super.key});

  final List<Map<String, String>> allNews = const [
    {
      "title": "INTCORE announces Q4 results",
      "subtitle": "The company reports a record growth in Q4 2025",
      "image": "https://via.placeholder.com/100",
    },
    {
      "title": "New mobile app released",
      "subtitle": "INTNEWS app now available for employees worldwide",
      "image": "https://via.placeholder.com/100",
    },
    {
      "title": "Office reopening post pandemic",
      "subtitle": "All employees are requested to follow new guidelines",
      "image": "https://via.placeholder.com/100",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: allNews.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final news = allNews[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                news['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              news['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              news['subtitle']!,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
