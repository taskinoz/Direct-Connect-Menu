#!/bin/bash

## This is an auto build script that can be used with the new RSPNVPK tool
## https://github.com/taskinoz/RSPNVPK
## Add the VPK that your editing in a /dir folder
## eg. englishclient_frontend.bsp.pak000_dir.vpk


if [ "$1" = "prod" ]
then
    ## Run on Prod
    ## PS4
    cp ./ps4/*.vpk ./
    wait
    ./RSPNVPK englishclient_frontend.bsp.pak000_dir.vpk -d ./src -s
    wait
    # make dir ignore if exists
    mkdir -p ./CUSA04013/vpk_ps4
    mv ./*.vpk ./CUSA04013/vpk_ps4
    zip -r Direct-Connect-PS4-plugin.zip ./CUSA04013/

    ## PC
    cp ./pc/*.vpk ./
    wait
    ./RSPNVPK englishclient_frontend.bsp.pak000_dir.vpk -d ./src -s
    wait
    # make dir ignore if exists
    mkdir -p ./Direct-Connect-PC
    mv ./*.vpk ./Direct-Connect-PC
    zip -r Direct-Connect-PC.zip ./Direct-Connect-PC/

else
    ## Run on Dev
    cp ./ps4/*.vpk ./
    wait
    RSPNVPK englishclient_frontend.bsp.pak000_dir.vpk -d ./src -s

    mv ./*.vpk ../titanfall-plugin/CUSA04013/vpk_ps4
fi

