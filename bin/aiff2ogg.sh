#!/bin/bash
#
# Vorbis is a variable bit rate (VBR) codec, which means that you tell it to create audio of a given
# quality and it uses however many bytes of data it takes to achieve that goal. The (undocumented in
# the man page!) "-aq" option of ffmpeg is how you tell it what audio quality to ask of a VBR codec,
# and the numerical value you give is interpreted differently by different codecs. In the case of
# the Vorbis codec, "0" is the poorest quality available, getting better with larger values.
# The value of "60" used here results in audio at roughly 160 kbit/s, which is very good.
#
# See package vorbis-tools (ogg123, oggdec, oggenc, ogginfo, vcut, vorbiscomment) too

AUTH='Maxïmo Park'
ALBUM='Our Earthly Pleasures'
Y=2007

#ffmpeg -i 01-Audio_Track.aiff \
#   -year $Y -author "$AUTH" -album "$ALBUM" -track 01 -title 'Girls Who Play Guitars' \
#   -acodec vorbis -aq 50 -ac 2 out/01-Girls_Who_Play_Guitars.ogg

## seems that the author and co options doen't work for this format. I'll try this instead
# ffmpeg -i 01-Audio_Track.aiff -acodec vorbis -aq 50 -ac 2 out/01-Girls_Who_Play_Guitars.ogg
# vorbiscomment -a -t 'ARTIST=Maxïmo Park' out/01-Girls_Who_Play_Guitars.ogg
# vorbiscomment -a -t 'ALBUM=Our Earthly Pleasures' out/01-Girls_Who_Play_Guitars.ogg
# vorbiscomment -a -t 'TRACKTOTAL=12' out/01-Girls_Who_Play_Guitars.ogg
# vorbiscomment -a -t 'TRACKNUMBER=01' out/01-Girls_Who_Play_Guitars.ogg
# vorbiscomment -a -t 'TITLE=Girls Who Play Guitars' out/01-Girls_Who_Play_Guitars.ogg

## Well it seems that ffmpeg doesn't handle vorbis properly. I'll use this then
oggenc -q 6 -a "$AUTH" -l "$ALBUM" -d "$Y" -c 'tracktotal=12' \
   -N 01 -t 'Girls Who Play Guitars'   01-Audio_Track.aiff \
   -N 02 -t 'Our Velocity'             02-Audio_Track.aiff \
   -N 03 -t 'Books From Boxes'         03-Audio_Track.aiff \
   -N 04 -t 'Russian Literature'       04-Audio_Track.aiff \
   -N 05 -t 'Karaoke Plays'            05-Audio_Track.aiff \
   -N 06 -t 'Your Urge'                06-Audio_Track.aiff \
   -N 07 -t 'The Unshockable'          07-Audio_Track.aiff \
   -N 08 -t 'By The Monument'          08-Audio_Track.aiff \
   -N 09 -t 'Nosebleed'                09-Audio_Track.aiff \
   -N 11 -t 'Sandblasted And Set Free' 11-Audio_Track.aiff \
   -N 12 -t 'Parisian Skies'           12-Audio_Track.aiff \
   -N 10 -t "A Fortnight's Time"       10-Audio_Track.aiff \
   -n "%n-%t.ogg" -X " '" -P"_-"

