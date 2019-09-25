#!/usr/bin/env python3
"""
Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License").
You may not use this file except in compliance with the License.
A copy of the License is located at

    http://www.apache.org/licenses/LICENSE-2.0

or in the "license" file accompanying this file. This file is distributed
on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
express or implied. See the License for the specific language governing
permissions and limitations under the License.
"""

import datetime
from flask import (
    Flask,
    jsonify
)


APP = Flask(__name__)


@APP.route('/')
def main():
    return jsonify(**{'time': str(datetime.datetime.now().isoformat())})


@APP.route('/healthz')
def health():
    return jsonify(**{'status': 'ok', 'date': str(datetime.datetime.now().isoformat())})


if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=5000)
