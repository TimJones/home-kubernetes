#!/bin/bash

helm init --upgrade

sleep 5

helmfile sync
