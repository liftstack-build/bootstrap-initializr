bootstrap-initializr
====================

Initializr updated with latest Bootstrap (2.1)


### update initializr's bootstrap with latest bootstrap version from repo
 
1.  Download Initializr with Bootstrap ([Main Page][1], [Direct Download][2]).

2.  Download latest [Bootstrap][3] or clone the [github repo][4].

3.  Run the [combine-bootstrap-initializr.sh script][5] from the same directory, 
specifying custom locations via command line arg if necessary:

* -bootstrap:     default is ./submodules/bootstrap
* -initializr:    default is ./initializr
* -temp:          default is ./temp
* -target:        default is ./target

This simply copies all files in bootstrap/js, bootstrap/less, and bootstrap/img to their 
respective directories in initializr's slightly customized directory structure, 
overwriting old versions, and renaming some files appropriately (for example, removing 
the 'bootstrap-' preface on bootstrap js files.


[1]:    http://www.initializr.com
[2]:    http://www.initializr.com/builder?mode=less&boot-hero&h5bp-htaccess&h5bp-nginx&h5bp-webconfig&h5bp-chromeframe&h5bp-analytics&h5bp-build&h5bp-iecond&h5bp-favicon&h5bp-appletouchicons&h5bp-scripts&h5bp-robots&h5bp-humans&h5bp-404&h5bp-adobecrossdomain&jquery&modernizrrespond&boot-css&boot-scripts
[3]:    http://twitter.github.com/bootstrap/
[4]:    https://github.com/twitter/bootstrap
[5]:    https://github.com/liftstack-build/bootstrap-initializr/blob/master/scripts/combine-bootstrap-initializr.sh
