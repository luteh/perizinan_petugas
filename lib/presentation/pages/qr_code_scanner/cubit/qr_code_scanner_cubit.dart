import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'qr_code_scanner_cubit.freezed.dart';
part 'qr_code_scanner_state.dart';

@injectable
class QrCodeScannerCubit extends Cubit<QrCodeScannerState> {
  QrCodeScannerCubit() : super(const QrCodeScannerState.initial());
}
