# Bay Area water levels & rainfall, 12/1/2021-1/15/2022

The prompt for this class project was something we missed from home - and when I was home for the holidays, it felt like there was a lot of rain, at least by California standards. I wanted to know how much rain it actually was, so I looked at rainfall data, as well as the capacity and flow rate of a local reservoir and creek. I found that it was more rain than the area typically gets that time of year, but that it was still only enough to fill our reservoir halfway. In short, there was quite a bit of rain - but California is unfortunately, still in a drought.

## My data collection process
I scraped Santa Clara County's [ValleyWater](https://valleywateralert.org/scvwd/index.php) website for data on Stevens Creek and its reservoir. Since the webpage had dropdown menus, I used Selenium to select the correct location, date and data frequency (measurements taken every 6 hours), before loading that into BeautifulSoup. I had originally intended to use ValleyWater's API, but it returned different information than what was displayed in the table.

I used rainfall data from the [National Weather Service](https://www.weather.gov/wrh/Climate?wfo=mtr). After selecting the necessary dates and San Jose Area as the location, I downloaded the data as a PDF and manually copy-pasted it into a spreadsheet. To get rainfall data from just December 1, 2021 to January 15, 2022, I selected "Daily data for a month" and downloaded PDFS for both December 2021 and January 2022. To look at rainfall over time during the month of December, I selected "Monthly summarized data" from the years 1901 to 2021.

### Repository contents
#### Jupyter notebooks
* creeks_scrape.ipynb and creeks_clean.ipynb: Scraping data on Stevens Creek flow
* reservoir.ipynb: Scraping and cleaning data on Stevens Creek Reservoir
* rainfall.ipynb: Cleaning rainfall data for San Jose area

#### Data
* creeks.csv: Stevens Creek data from [Valley Water](https://valleywateralert.org/scvwd/historicdata/qsgi_historicdata_setup.php)
* reservoir.csv: Stevens Creek Reservoir data from [Valley Water](https://valleywateralert.org/scvwd/historicdata/qrgi_historicdata_setup.php)
* rainfall.csv: Precipitation data from the [National Weather Service](https://www.weather.gov/wrh/Climate?wfo=mtr) - searched “Daily data for a month” in San Jose Area, CA
* rainfall_trend.csv: Precipitation data from the [National Weather Service](https://www.weather.gov/wrh/Climate?wfo=mtr) - searched "Monthly summarized data" from 1901-2021

#### [Charts](https://github.com/ilenapeng/stevens-creek/tree/main/charts)
* Finished charts
* charts.R: R script for final ggplot charts on creek flow rate and rainfall
* exploratory_plotting.ipynb: Jupyter notebook drafting up sketches

## What I learned
I learned to work with dropdowns in Selenium and spent a lot of time organizing data so that it would work in Datawrapper, though I didn't end up using all of those charts. I also learned to use an image as a ggplot2 geom_point().

## Future improvements
I really would have loved to request data on reservoir capacity levels over time - ValleyWater's data online only went back until July 2020. In the future, I'd also like to have all of these charts be interactive, instead of a mix of static and interactive, and ideally build them myself in D3.js or a similar library.
