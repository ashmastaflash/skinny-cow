FROM ashmastaflash/rp2-deb-gr

#First, we remove documentation...
RUN /usr/bin/find /usr/share/doc -depth -type f 
RUN /usr/bin/find /usr/share/doc -depth -type f ! -name copyright|/usr/bin/xargs /bin/rm
RUN /usr/bin/find /usr/share/doc -empty|/usr/bin/xargs /bin/rmdir
RUN /bin/rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/*
RUN /bin/rm -rf /usr/share/lintian/* /usr/share/linda/* /var/cache/man/*

# Remove all development packages... try this later if it's still too big...
#RUN dpkg -l | awk '{print $2}' | awk -F: '{print $1 }' | egrep *-dev$ | xargs dpkg -r

# Clear history
RUN history -c
