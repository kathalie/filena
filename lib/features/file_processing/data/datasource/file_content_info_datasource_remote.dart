import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import '../../../files_management/domain/enums/file_category.dart';
import 'dto/file_content_info_dto.dart';
import 'dto/generate_file_content_dto.dart';
import 'file_content_info_datasource.dart';

// class FileInfoDetailsDatasourceRemote implements FileInfoDetailsDatasource{
//   static const _responseFormat = {
//     'type': 'object',
//     'properties': {
//       'keywords': {
//         'type': 'array',
//         'items': {
//           'type': 'string',
//         },
//       },
//     },
//     'required': [
//       'keywords',
//     ],
//   };
//
//   Future<Map<String, dynamic>?> _toJson(
//     FileContentInfoPromptDto promptDto,
//   ) async {
//     if (promptDto.fileCategory == FileCategory.image) {
//       return {
//         'model': 'llama3.2',
//         'prompt': promptDto.prompt,
//         'stream': false,
//         'format': _responseFormat,
//       };
//     }
//
//     if (promptDto.fileCategory == FileCategory.document) {
//       final documentText = await promptDto.content
//           .transform(
//             StreamTransformer<List<Uint8List>, List<int>>.fromHandlers(
//               handleData: (data, sink) {
//                 for (final byteList in data) {
//                   sink.add(byteList);
//                 }
//               },
//             ),
//           )
//           .transform(utf8.decoder)
//           .join();
//
//       return {
//         'model': 'llava',
//         'prompt': promptDto.prompt,
//         'stream': false,
//         'images': [promptDto.content], // TODO convert to base 64
//         'format': _responseFormat,
//       };
//     }
//
//     return null;
//   }
//
//   @override
//   Future<FileContentInfoDto> retrieveFileContentInfo(FileContentInfoPromptDto promptDto) {
//     // TODO: implement retrieveFileContentInfo
//     throw UnimplementedError();
//   }
//
// // String _base64() {
// //   int totalLength = 0;
// //   for (var bytes in data) {
// //     totalLength += bytes.length;
// //   }
// //
// //   // Combine all Uint8List chunks into one
// //   final Uint8List combinedBytes = Uint8List(totalLength);
// //   int offset = 0;
// //   for (var bytes in data) {
// //     combinedBytes.setRange(offset, offset + bytes.length, bytes);
// //     offset += bytes.length;
// //   }
// //
// //   // Convert the combined Uint8List to base64
// //   String base64String = base64Encode(combinedBytes);
// //   return base64String;
// // }
// }
