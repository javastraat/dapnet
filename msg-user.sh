#!/bin/bash

msg=$2
name=$1

sudo pistar-dapnetapi $name "$msg" debug

