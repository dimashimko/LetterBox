import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('uk'));

  void setLocale(Locale locale) => emit(locale);
}
