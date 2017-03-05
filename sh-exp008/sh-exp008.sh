#!/bin/bash
# A shell script to load another shell that load video

touch ~/space
echo "#!/bin/sh" >> ~/space
echo "env DISPLAY=:0.0 /usr/bin/cvlc /home/aurelien/Music/space-oddity.mp4" >> ~/space
chmod +x ~/space
sh ~/space
rm ~/space

# End of the program
exit 0
