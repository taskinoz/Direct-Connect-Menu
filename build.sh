#!/bin/bash

## This is an auto build script that can be used with the new RSPNVPK tool
## https://github.com/taskinoz/RSPNVPK
## Add the VPK that your editing in a /dir folder
## eg. englishclient_frontend.bsp.pak000_dir.vpk

## Debug

if [ "$1" = "prod" ]
then
    ## Run on Prod
    ## PS4
    cp ./ps4/*.vpk ./
    echo "Copying PS4 VPKs"
    ls ./
    echo "----------------"
    wait
    ./RSPNVPK ./englishclient_frontend.bsp.pak000_dir.vpk -d ./src -s
    wait
    # make dir ignore if exists
    echo "Making PS4 Folder"
    mkdir -p ./CUSA04013/vpk_ps4
    wait
    mv ./*.vpk ./CUSA04013/vpk_ps4
    wait
    zip -r Direct-Connect-PS4-plugin.zip ./CUSA04013/

    ## PC
    cp ./pc/*.vpk ./
    echo "Copying PC VPKs"
    ls ./
    echo "----------------"
    wait
    ./RSPNVPK ./englishclient_frontend.bsp.pak000_dir.vpk -d ./src -s
    wait
    # make dir ignore if exists
    echo "Making PC Folder"
    mkdir -p ./Direct-Connect-PC
    wait
    mv ./*.vpk ./Direct-Connect-PC
    wait
    zip -r Direct-Connect-PC.zip ./Direct-Connect-PC/

else
    ## Run on Dev
    cp ./ps4/*.vpk ./
    wait
    RSPNVPK englishclient_frontend.bsp.pak000_dir.vpk -d ./src -s

    mv ./*.vpk ../titanfall-plugin/CUSA04013/vpk_ps4
fi

