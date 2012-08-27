bootstrap-initializr
====================

Initializr updated with latest Bootstrap (2.1)


## update initializr's bootstrap with latest bootstrap version from repo
 
1.  Download Initializr with Bootstrap
Main Page:          http://www.initializr.com
Direct Download:    http://www.initializr.com/builder?mode=less&boot-hero&h5bp-htaccess&h5bp-nginx&h5bp-webconfig&h5bp-chromeframe&h5bp-analytics&h5bp-build&h5bp-iecond&h5bp-favicon&h5bp-appletouchicons&h5bp-scripts&h5bp-robots&h5bp-humans&h5bp-404&h5bp-adobecrossdomain&jquery&modernizrrespond&boot-css&boot-scripts

2.  Download latest Bootstrap or clone the github repo
http://twitter.github.com/bootstrap/

3.  Run this script from the same directory.  This simply copies all files in 
bootstrap/js, bootstrap/less, and bootstrap/img to their respective directories
in initializr's unpacked directory, overwriting old versions, and renaming 
some files appropriately (for example, removing the 'bootstrap-' preface on 
bootstrap js files.
