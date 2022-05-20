##############################################################
# Function to load packages based on a list of package names #
# uninstalled packages are automatically installed           #
# This is a rather basic package, more of a fun side project #
# and a first try of writing an actual package and uploading #
# it to Github. Comments and Issues are welcome, I'll try to #
# look into it. Cheers, Till                                 #
# CC - licence, Till Hovestadt, May 2022                     #
##############################################################

#' Package Loading and Installation Function
#' 
#' Checks whether Packages to be loaded have already been installed.
#' If yes: loads packages
#' If not: installs packages and loads them afterwards
#' @param name vector of packages to be loaded, packages should be in quotationmarks
#' @param repolist optional vector of repositories (URLS in quotation marks) to install packages from if CRAN is not useful. If used, this needs to be ordered: URLS need to be in the same position of the repolist vector as the respective packages in the name vector. All packages desired to be downloaded from CRAN should be labelled "CRAN" in the repolist vector. If all packages are to be downloaded from CRAN, the repolist option can be left out. 
#' @export

pacman <- function(name, # name of package, in quotation marks
                   repolist = NULL) {# optional URL of repository package is to be downloaded from if not CRAN
  
  if(!require(name,  # test whether package is already installed
              character.only = T)) {
    if(is.null(repolist)){ # if not: test whether CRAN or specific repository and installation
      install.packages(name, 
                       dep = T)}
    else {
      if(repolist == "CRAN") {
        install.packages(name, 
                         dep = T)} else {
      install.packages(name,
                       dep = T,
                       repos = repolist)
                         } 
    }
    }
    

  
  require(name, # then, loading of installed packages
          character.only = T)
  }

pacman <- Vectorize(pacman) # vectorizing, so that vector of arguments may be passed on to function

