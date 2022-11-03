#!/bin/bash
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#!/bin/bash
set +x
(unzip bazel.zip && rm -f bazel.zip) || exit 1
# Fix for https://github.com/bazelbuild/bazel/issues/12327 is not included in
# 4.0.0 yet.
wget https://github.com/bazelbuild/bazel/commit/f8606e5e76579442a1c6563e718ea54c673f1a04.patch -O issue12327.patch || exit 1
patch --strip 1 < issue12327.patch || exit 1

# Force using python 3.7 (system default may be 2.6 which is not supported).
PATH=/opt/python/cp37-cp37m/bin:$PATH \
# https://github.com/bazelbuild/bazel/issues/9254 (fixed post 3.0.0)
EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" \
BAZEL_LINKLIBS=-lstdc++:-lm \
./compile.sh
set -x
