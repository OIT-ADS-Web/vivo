#!/bin/bash

set -e

cp /vivo/runtime.properties /usr/local/vivo/data/

exec "$@"

