#!/usr/bin/env python
"""Converts aiff audio files to ogg vorbis.

This thing uses oggenc from the package vorbis-tools, so make sure it's
installed.
"""
#
# See package vorbis-tools (ogg123, oggdec, oggenc, ogginfo, vcut, vorbiscomment) too
# mind sys.stdin sys.stdout sys.stderr
import os
from os import path
from types import IntType, LongType, FloatType

def guess_track_number(file):
    return number
    pass

def guess_track_title(file):
    return title
    pass

def guess_out_name(num, title):
    return name
    pass

if __name__ == "__main__":
    in_dir = raw_input("Where are the input files? ")
    #in_dir = os.getcwd()

    while (not path.isdir(in_dir)):
        in_dir = raw_input("Hey, that's not diretory. Gimme a directory: ")

    artist = raw_input("Who's the artist? ")
    album = raw_input("Album, please? ")
    date = raw_input("When was it published? ")
    total_tracks = raw_input("How many tracks does it have? ")

    out_dir = raw_input("Where I may place the output files? ")
    # i'll use os.makedirs for this one isnstead of os.mkdir
    if not path.exists(out_dir):
        os.makedirs(out_dir)
    elif not path.isdir(out_dir):
        out_dir = raw_input("That exists and it's nos a directory. Choose othe one: ")

    # use 6 as default quality level?
    quality = raw_input("Quality? ")
    quality = float(quality) 

    while (quality != IntType or quality != LongType or quality != FloatType):
        quality = raw_input("Quality again, please? ")
        quality = float(quality) 
    else:
        command = 'oggenc -q ' + quality

    if (artist != ""):
        command += ' -a ' + artist

    if ( album != ""):
        command += ' -l ' + album

    if ( date != ""):
        command += ' -d ' + date

    if ( total_tracks != ""):
        command += " -c 'tractotal=" +
	
    for file in os.listdir(in_dir):
        trac_num = guess_trac_num(file)
	if(trac_num):
            trac_num = raw_input("What's the track number?[%s] "%trac_num)
	else:
	    trac_num = raw_input("What's the track number? ")

        title = guess_trac_title(file)
	if(title):
            title = raw_input("What's the song title?[%s] "%title)
	else:
	    title = raw_input("What's the song title? ")

        out_file
        raw_input('%s-%s.ogg'%(trac_num, title))
	out_file = Try to guess is as track-Song_title.ogg

	if ( num_track != ""):
	    command += ' -N ' + num_track
	
	if ( title != ""):
	    command += ' -t ' + title
	
	command += ' ' + path.join(out_dir, out_file)
	# Think about using a thread for each song
	status = os.system(command)
    
    #ask if the is another album

#oggenc -q 6 -a "$AUTH" -l "$ALBUM" -d "$Y" -c 'tracktotal=12' \
#   -N 01 -t 'Girls Who Play Guitars'   01-Audio_Track.aiff \
#   -N 02 -t 'Our Velocity'             02-Audio_Track.aiff \
#   -N 03 -t 'Books From Boxes'         03-Audio_Track.aiff \
#   -N 04 -t 'Russian Literature'       04-Audio_Track.aiff \
#   -N 05 -t 'Karaoke Plays'            05-Audio_Track.aiff \
#   -N 06 -t 'Your Urge'                06-Audio_Track.aiff \
#   -N 07 -t 'The Unshockable'          07-Audio_Track.aiff \
#   -N 08 -t 'By The Monument'          08-Audio_Track.aiff \
#   -N 09 -t 'Nosebleed'                09-Audio_Track.aiff \
#   -N 11 -t 'Sandblasted And Set Free' 11-Audio_Track.aiff \
#   -N 12 -t 'Parisian Skies'           12-Audio_Track.aiff \
#   -N 10 -t "A Fortnight's Time"       10-Audio_Track.aiff \
#   -n "%n-%t.ogg" -X " '" -P"_-"

