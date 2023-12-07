import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tocktik/presentation/providers/discover_provider.dart';
import 'package:tocktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>(); // esto sirve para escuchar los cambios de la clase DiscoverProvider

    return Scaffold(
        body: discoverProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(strokeWidth: 2,),)
            : VideoScrollableview(videos:discoverProvider.videos)
              
    );
  }
}
