# Release Channels Graph generator.

### This scripts uses the "dot" and "jq" processor to create SVG files of the OCP 4.x release channels. Currently the script runs against the 4.x channels I'm aware of. __Note__ : Not all release channels are visible in the OCP UI. It's dependant on what version of the console container is in use.

### Requirements
- curl
- graphviz
- jq

### Included files

- getocpdepgraphs.sh - Wrapper script to creates graphs of the above channels. Calls the graph.sh script
- graphs - Output directory, it's contents will be ignored by git
- graph.sh - Scripts from RedHat support to graph the channels.

