import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity/ui/user/features/support/logic/support_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/assets.dart';
import '../data/model/AllReview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                title: Text(AppLocalizations.of(context)!.reviews),
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
      margin:  EdgeInsets.symmetric(vertical: 8.0.h),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: review.user_image != null
              ? CachedNetworkImageProvider(
                  'https://charityorg.life/storage/app/${review.user_image}')
              : const AssetImage(Assets.imagesImg) as ImageProvider,
        ),
        title: Text(
          review.userName ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review.text ?? ''),
             SizedBox(height: 8.h),
            Row(
              children: [
                const Spacer(),
                Text(
                  review.date != null && review.date!.length > 10
                      ? review.date!.substring(0, 10)
                      : (review.date ?? ''), // Add review date
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
