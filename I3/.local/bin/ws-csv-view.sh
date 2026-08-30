#!/bin/bash

head -9 $1 | csvtk -d, transpose | csview
tail +10 $1 | head -n1  | csview
