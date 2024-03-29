# An example of Jamovi module

This is a simple Jamovi module, created by following the tutorial in https://dev.jamovi.org.
This module performs a t-test with R, shows a table of the results, and plot descriptive statistics.

## Installation

### From `.jmo` file

- Download the `.jmo` file in the [releases page](https://github.com/tomboulier/jmvtools_tuto/releases/).
- In Jamovi, go to *Modules* (top-right corner) > *Managed installed*.
- In the panel, go to *Sideload*, click on the arrow and look for the downloaded `.jmo` file in your computer.

### Using `jvmtools`
First, let us install `jvmtools` as explained [here](https://dev.jamovi.org/tuts0101-getting-started.html).
In R, simply type:
```R
  install.packages('jmvtools', repos=c('https://repo.jamovi.org', 'https://cran.r-project.org'))
```

Next, go to the folder of the repository and type:
```R
  jmvtools::install()
```

## Usage

Open [Jamovi](https://www.jamovi.org/), and the module will appear in the modules panel with the name *SuperModule*.
