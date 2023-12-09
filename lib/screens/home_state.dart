part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Resource resource;
  final int count;

  const HomeState({
    required this.resource,
    required this.count,
  });

  HomeState copyWith({
    Resource? resource,
    int? count,
  }) {
    return HomeState(
      resource: resource ?? this.resource,
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [resource, count];
}

sealed class Resource {
  const Resource();
}

class Initial extends Resource {
  const Initial();
}

class Loading extends Resource {
  const Loading();
}

class Success extends Resource {
  const Success();
}
