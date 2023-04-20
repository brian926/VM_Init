#!/bin/bash

sudo apt install $(cat tools.list | tr "\n" " ") -y