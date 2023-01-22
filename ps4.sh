#!/bin/bash

## This is an auto build script that can be used with the new RSPNVPK tool
## https://github.com/taskinoz/RSPNVPK
## Add the VPK that your editing in a /dir folder
## eg. englishclient_frontend.bsp.pak000_dir.vpk

# rm ./*.vpk

## Run on Dev
cp ./ps4dir/*.vpk ./
wait
RSPNVPK englishclient_frontend.bsp.pak000_dir.vpk -d ./src -s

mv ./*.vpk ../titanfall-plugin/CUSA04013/vpk_ps4
