#!/usr/bin/env python
#
# See package vorbis-tools (ogg123, oggdec, oggenc, ogginfo, vcut, vorbiscomment) too
import os
#os.sep is the (or a most common) pathname separator ('/' or ':' or '\\')
#from os import path, listdir
from os import path
import types
# IntType
# LongType
# FloatType
#

if __name__ == "__main__":
    in_dir = raw_input("Where are the input files? ")
    #in_dir = os.getcwd()

    while (not path.isdir(in_dir)):
        in_dir = raw_input("Hey, that's not diretory. Gimme a directory: ")

    artist = raw_input("Who's the artist? ")
    album = raw_input("Album, please? ")
    date = raw_input("When was it published? ")
    total_tracks = raw_input("How many tracks does it have? ")

    out_dir =
    #path.exists
    quality =

    while (quality != IntType or quality != LongType or quality != FloatType):
        pass
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
        trac_num = raw_input("What's the track number? ")
        title = raw_input("What's the song title? ")
        out_file = Try to guess is as track-Song_title.ogg
	#pid = os.fork()

	#if pid == 0:
	    #print "I'm your son"
	#    os.execvp('ls', ['ls', '-la', in_dir + os.sep + file])
	#else:
	    #print "Luck, I'm your father"
	#    print os.wait()
        
	# For what I'm gonna do this is simpler
	#status = os.system("ls -la " + in_dir + os.sep + file)
	file = path.join(in_dir, file)
	status = os.system("ls -la " + file)
        
	if ( num_track != ""):
	    command += ' -N ' + num_track
	
	if ( title != ""):
	    command += ' -t ' + title
	
	command += ' ' + os.join(out_dir, out_file)
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

