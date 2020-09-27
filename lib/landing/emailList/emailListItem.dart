import 'package:flutter/material.dart';

/// Base class for list of loudest emails, by tags
abstract class EmailListItem {
  Widget buildEmailCard(BuildContext context);

  Widget buildTagHeader(BuildContext context);
}
