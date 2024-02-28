WIP populate ydl_opts and use filename variable's string transformation to
rename / name downloaded files


#!/usr/bin/env python3

# Should read firefox bookmarks music folder in sqlite
# Should use hashes for update tracking
# Should build m3u playlist preserving the order.
# Should shadow firefox with shadow script placed in the directory where pulley is.

# moz_places: id url url_hash
# moz_bookmarks: type(1=page, 2=folder) title (applies for folders as well) fk(moz_places: id) parent

import sqlite3
import argparse
import os
import subprocess
from yt_dlp import YoutubeDL

parser = argparse.ArgumentParser(
    description='Download and make an m3u playlist out of all the songs\
                 in a firefox bookmarks folder')
parser.add_argument('src', help="The path of the firefox profile's\
                    places.sqlite file")
# TODO add custom --output path argument
args = parser.parse_args()
SRC = os.path.abspath(args.src)

conn = sqlite3.connect(SRC)
cursor = conn.cursor()

cursor.execute('''
-- type = 1: page, type = 2: folder

-- might also want to select moz_bookmarks.title
with folderId as (SELECT id from moz_bookmarks where title = "OPTRA Playlists")
select moz_places.url from moz_bookmarks
join moz_places on moz_bookmarks.fk =  moz_places.id 
where
-- TODO: traverse subfolders (handle type detection, position reset)6
type = 1 and parent in folderId
order by moz_bookmarks.position
''')

# list(tuple(str, str))
playlist = cursor.fetchall()
# urls: str = [url for tuple in playlist for url in tuple]

with open('playlist.m3u', 'w') as f:
    errors = []
    ydl_opts = {}
    with YoutubeDL(ydl_opts) as ydl:
        for tuple in playlist[1:]: # TODO handle bandcamp so this expedient
                                   # slicing can go
            url = tuple[0]
            try:
                # Python API equivalent to:
                #            subprocess.run(['yt-dlp', '--extract-audio', '--no-playlist', 
                #                            '--audio-format', 'opus', '--audio-quality', '0',
                #                            '--output', file_title, url],
                #                           check=True)
                info = ydl.extract_info(url)
                filename = '_'.join(info['title'].split()) + '.opus'
                f.write('./' + filename + '\n')
            except Exception as e:
                errors.append(e)
                print(e)
