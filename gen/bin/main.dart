// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'package:jaguar_martini/jaguar_martini.dart';
import 'package:jaguar_martini/fs_content_source.dart';

import 'package:blog/blog.dart';

const siteMeta = const SiteMetaData(
    title: 'Geek went freak!', baseURL: 'http://localhost:8000');

main(List<String> arguments) async {
  final builder = Builder(
      siteMeta,
      SiteSpec(
          defaultSectionRenderer: SectionSpec(), shortcodes: [GistShortCode()]),
      [FsContentSource(Directory('content'))]);

  await FsWriter(builder, Directory('built'), statics: Directory('static'))
      .write();

  exit(0);
}
