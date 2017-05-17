#! /bin/bash
#
# deploy.sh
# Copyright (C) 2015 subho halder <sunny@appknox.com>
#
# Distributed under terms of the MIT license.
#

ember deploy production --verbose=true --activate=true --show-progress=true

ENVIRONMENT=production
LOCAL_USERNAME=`whoami`
REVISION=`git log -n 1 --pretty=format:"%H"`
