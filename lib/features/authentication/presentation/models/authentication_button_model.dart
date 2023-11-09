import 'package:notez/features/authentication/domain/entities/federated_provider.dart';

class AuthenticationButtonModel {
  AuthenticationButtonModel({
    required this.federatedProvider,
    required this.label,
    required this.logoPath,
  });

  final FederatedProvider federatedProvider;
  final String label;
  final String logoPath;
}
