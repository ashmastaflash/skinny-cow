FROM ashmastaflash/rp2-deb-gr

#First, we remove documentation...
RUN find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true && \
    find /usr/share/doc -empty|xargs rmdir || true && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* && \
    rm -rf /usr/share/lintian/* /usr/share/linda/* /var/cache/man/*

# Remove all development packages
RUN dpkg -l | awk '{print $2}' | awk -F: '{print $1 }' | egrep *-dev$ | xargs dpkg -r

# Clear history
RUN history -c
