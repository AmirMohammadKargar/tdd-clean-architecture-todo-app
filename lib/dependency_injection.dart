import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'dependency_injection.config.dart';

final injector = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(injector);
