import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_c16/api/model/resonse/articles/Articles.dart';
import 'package:news_c16/core/extensions/DateFomatsExtensions.dart';
import 'package:news_c16/core/resources/app_const/app_color.dart';


class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.articleModel});
  final Article articleModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.grey,width: 1)
      ),
      child: Column(
        spacing: 10,
        children: [
        AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: (articleModel.urlToImage != null && articleModel.urlToImage!.isNotEmpty)
              ? CachedNetworkImage(
            imageUrl: articleModel.urlToImage!,
            width: double.infinity,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      strokeWidth: 2,
                    ),
                  ),
                ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
            ),
          )
              : Container(
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(Icons.image_not_supported,
                  color: Colors.grey, size: 40),
            ),
          ),
        ),
      ),
          Text(
            articleModel.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text('By : ${articleModel.author}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,)),
              Expanded(
                child: Text(
                  articleModel.publishedAt?.formatArticleDate() ?? "",
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
