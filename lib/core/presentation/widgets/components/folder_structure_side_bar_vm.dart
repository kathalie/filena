import 'package:flutter/material.dart';

import '../../const/icons_const.dart';

enum FolderStructure {
  classified('Classified'),
  unclassified('Unclassified');

  final String caption;

  const FolderStructure(this.caption);
}

class FolderStructureSideBarViewModel {
  // final folderStructures<String,FolderStructure> = {
  //   'Classified': ,
  // 1: 'Unclassified',
  // };

  onValueChanged(int newValue) {
    //TODO change folder structure
  }
}