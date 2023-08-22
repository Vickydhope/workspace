import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workspace/config/routes/router_config.dart';
import 'package:workspace/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:workspace/features/dashboard/presentation/bloc/remote_category_bloc.dart';

import '../../../../config/di/injection.dart';
import '../../../../config/flavor_config.dart';

import 'package:cached_network_image/cached_network_image.dart';

class MainCategories extends StatefulWidget {
  const MainCategories({Key? key}) : super(key: key);

  @override
  State<MainCategories> createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => getIt<RemoteCategoryBloc>()..add(GetCategories()),
      child: Builder(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<RemoteCategoryBloc>().add(GetCategories());
            Future block = context
                .read<RemoteCategoryBloc>()
                .stream
                .firstWhere((element) => element is! RemoteCategoriesDone);
            await block;
          },
          child: Scaffold(
            appBar: _buildAppBar(),
            body: BlocBuilder<RemoteCategoryBloc, RemoteCategoryState>(
              builder: (context, state) {
                if (state is RemoteCategoriesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is RemoteCategoriesError) {
                  return Center(
                    child: Text(state.error?.message ?? ""),
                  );
                }
                if (state is RemoteCategoriesDone) {
                  return ListView.builder(
                    itemCount: state.categories!.length,
                    itemBuilder: (context, index) {
                      final category = state.categories![index];
                      return ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: category.strCategoryThumb ?? "",
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        title: Text(category.strCategory ?? "-"),
                        subtitle: Text(
                          category.strCategoryDescription ?? "-",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        );
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Home"),
      actions: [
        IconButton(
          onPressed: () {
            context.read<AuthBloc>().add(Logout());
          },
          icon: const Icon(Icons.logout),
        ),
        IconButton(
          onPressed: () {
            context.pushNamed(Routes.notification.name);
          },
          icon: const Icon(Icons.notifications_rounded),
        ),
      ],
    );
  }
}
