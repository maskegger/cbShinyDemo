Intermediate R Shiny
================
Chris Brownlie

# cbShinyDemo

<!-- badges: start -->

<!-- badges: end -->

cbShinyDemo is a package to showcase how to structure an R Shiny app as
a package, as well as other R Shiny techniques ranging from basic to
more advanced.

## Usage

This package and associated repository is simply meant as a place I can
store a shiny app which uses techniques I think are cool or useful, so I
can always find them again and can share with others more easily.
Initially, I plan to present this package, app & repository at a DfE
Coffee & Coding session. To view the app, install the package and run
the app via the code below:

``` r
devtools::install_github("chrisbrownlie/cbShinyDemo")

cbShinyDemo::run_app()
```

## Code structure

The project and app itself follow the naming and structure conventions
outlined in the ‘Structure’ tab of the app. Namely, the app is
structured as a package and heavily relies on shiny modules.

## Caveats

I do not claim that the methods used here are the best way to solve a
specific problem.

The shiny app in this package uses a structure which takes heavily from
the structure and naming methodology proposed by thinkr and the golem
framework (see acknowledgements). This is an opinionated framework and
is not always suitable/necessary.

## Acknowledgements

See [Engineering Shiny](https://engineering-shiny.org/) for more
information on thinkR and the golem framework.
