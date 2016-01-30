#!/usr/bin/env bash

playlists_root_dir="/mnt/USB/"

pls_file="./mp3.pls"
m3u_file="./mp3.m3u"

rm ${m3u_file}
rm ${pls_file}

touch ${pls_file}
touch  ${m3u_file}

echo "[playlist]" > "${pls_file}"
echo "NumberOfEntries=100" >> "${pls_file}"

#find /mnt/USB/*.mp3

for i in "${playlists_root_dir}*.mp3" do
  echo "Generating $station playlist"
  #pls_url="http://somafm.com/$station.pls"
  #m3u_url="http://somafm.com/m3u/$station.m3u"

  echo "#EXTM3U" >> "${m3u_file}"
  echo "#EXTINF:-1,$station" >> "${m3u_file}"
  echo "${stations["$station"]}" >> "${m3u_file}"

  echo "" >> "${pls_file}"
  echo "File1=${stations["$station"]}" >> "${pls_file}"
  echo "Title1=$station" >> "${pls_file}"
  echo "Length1=-1" >> "${pls_file}"

done