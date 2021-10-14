#!/bin/bash
ABS_PATH=$1
REAL_PATH=$(dirname $ABS_PATH)
TRACK=$(mediainfo $ABS_PATH | grep 'Audio #' | wc -l)
TYPE=$(mediainfo $ABS_PATH | grep 'Scan type' | awk -F ':' '{print $2}')
SOM=$(mediainfo $ABS_PATH | grep 'Time code of first frame' | head -1 | awk '{print $7}')
BIT_RATE=$(mediainfo $ABS_PATH | grep -w 'Bit rate' | head -2 | tail -1 | awk '{print $4}')
CONVERTED_BITRATE=$(echo $BIT_RATE*1000 | bc)

if [[ $TRACK -eq '8' ]] && [[ $TYPE == *Interlaced* ]]; then

        echo 'Absolute Path of content is: ' ${ABS_PATH} \n 'Its total track are: ' $TRACK \n 'Its SOM and bit rate is: ' $SOM $BIT_RATE

        sleep 1

        echo 'Starting conversion process...'

        ffmpeg -i  $ABS_PATH  -map 0:1 -top 1 -flags:v +ilme+ildct -vcodec mpeg2video -acodec pcm_s24le -b:v ${CONVERTED_BITRATE}k ${REAL_PATH}/abc.m2v -map_channel 0.1.0  -b:a 320k $REAL_PATH/abc1.wav -map_channel 0.2.0   -b:a 320k $REAL_PATH/abc2.wav -map_channel 0.3.0   -b:a 320k $REAL_PATH/abc3.wav -map_channel 0.4.0   -b:a 320k $REAL_PATH/abc4.wav -map_channel 0.5.0   -b:a 320k $REAL_PATH/abc5.wav -map_channel 0.6.0   -b:a 320k $REAL_PATH/abc6.wav -map_channel 0.7.0   -b:a 320k $REAL_PATH/abc7.wav -map_channel 0.8.0   -b:a 320k $REAL_PATH/abc8.wav | -y


elif [[ $TRACK -eq '4' ]] && [[ $TYPE == *Interlaced* ]]; then

ffmpeg -i $ABS_PATH  -map 0:1 -top 1 -flags:v +ilme+ildct -vcodec mpeg2video -acodec pcm_s24le -b:v ${CONVERTED_BITRATE}k ${REAL_PATH}/abc.m2v -map_channel 0.1.0  -b:a 320k $REAL_PATH/abc1.wav -map_channel 0.2.0   -b:a 320k $REAL_PATH/abc2.wav -map_channel 0.3.0   -b:a 320k $REAL_PATH/abc3.wav -map_channel 0.4.0   -b:a 320k $REAL_PATH/abc4.wav | -y

fi

