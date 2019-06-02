#!/bin/bash

set -eu

basedir=$(dirname $0)/../../../bin

echo '== Invoking bin/setup =='
$basedir/setup

echo '== Starting application server =='
$basedir/rails server -b 0.0.0.0
