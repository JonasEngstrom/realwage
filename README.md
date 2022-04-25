# Realwage

Graphs the real wage evolution of a Swedish worker using monthly [Consumer Price Index data from Statistics Sweden](http://www.statistikdatabasen.scb.se/pxweb/sv/ssd/START__PR__PR0101__PR0101A/KPIFastM2) from 2006 and onwards.

## Installing the `realwage` Package

The following steps describe how to install `realwage` from GitHub.

### 1. Install *devtools*
```r
install.packages('devtools')
```
### 2. Load *devtools*
```r
library(devtools)
```
### 3. Install *realwage*
```r
install_github('JonasEngstrom/realwage', build_vignettes = TRUE)
```
### 4. Load *medinetparser*
```r
library(realwage)
```

## Get Started Using the `realwage` Package

### 1. Install and Load the `tibble` Package

```r
install.packages('tibble')
library(tibble)
```

### 2. Make a `tibble` Object of Past Salaries

The tibble needs to have *year*, *month*, and *salary* columns.

```r
wage_table <- tibble(year = c(2020, 2021, 2022),
                     month = c(3, 3, 3),
                     salary = c(30000, 30250, 31000))
```

### 3. Plot Inflation Adjusted Salary

```r
calculate_and_plot_adjusted_salary(wage_table)
```

## Learn More

Run the following command, to learn more about how `realwage` can be used.

```r
browseVignettes('realwage')
```
