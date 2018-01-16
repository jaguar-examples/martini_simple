// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_martini/jaguar_martini.dart';
import 'package:jaguar_martini/collectors/dir.dart';

import 'package:blog/blog.dart';

const siteMeta = const SiteMetaData(
    title: 'Geek went freak!', baseURL: 'http://localhost:8000');

main(List<String> arguments) async {
  final postCollector = new DirPostCollector(new Directory('./content'));
  final processor = new Processor(siteMeta, new DefaultWriter())
    ..addShortcode(const GistShortCode())
    ..add(postCollector)
    ..start();

  final server = new Jaguar(port: 8000);
  server.addApi(new GeneratedHandler(processor));
  server.staticFiles('/static/*', new Directory('./static'));
  await server.serve();
}