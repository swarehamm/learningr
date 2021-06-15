
# LearningR: Practicing boringness...

This is for the DDA R course. YAYYYY

This project is the first proper setup of a folder for data management

# Brief description of folder and file contents


The following folders contain:

- `data/`:this is the data that i need to do my analysis
- `doc/`:there are the documents tied to the project
- `R/`: This is the code used in the projet

# Installing project R package dependencies

If dependencies have been managed by using `usethis::use_package("packagename")`
through the `DESCRIPTION` file, installing dependencies is as easy as opening the
`LearningR.Rproj` file and running this command in the console:

    # install.packages("remotes")
    remotes::install_deps()
You'll need to have remotes installed for this to work.

# Resource

For more information on this folder and file workflow and setup, check
out the [prodigenr](https://rostools.github.io/prodigenr) online
documentation.
