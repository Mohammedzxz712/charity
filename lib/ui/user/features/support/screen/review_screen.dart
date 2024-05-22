import 'package:charity/ui/user/features/support/logic/support_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/AllReview.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SupportCubit()..getReviews(), // Fetch reviews on creation
      child: BlocConsumer<SupportCubit, SupportState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ReviewLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetReviewsSuccessState) {
            final reviews = context.read<SupportCubit>().reviewList;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Reviews'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: reviews?.length ?? 0,
                  itemBuilder: (context, index) {
                    return _buildReviewCard(reviews?[index]);
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }

  Widget _buildReviewCard(Reviews? review) {
    if (review == null) {
      return const SizedBox(); // Return an empty widget if review is null
    }
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(''), // Add image profile
        ),
        title: Text(
          review.userName ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review.text ?? ''),
            const SizedBox(height: 8),
            const Row(
              children: [
                Spacer(),
                Text(
                  '12/12/2022', // Add review date
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
