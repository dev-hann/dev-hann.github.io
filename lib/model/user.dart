import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.name,
    required this.imageURL,
    required this.bio,
    required this.email,
  });

  final String name;
  final String imageURL;
  final String bio;
  final String email;

  @override
  List<Object?> get props => [
        name,
        imageURL,
        bio,
        email,
      ];
}
