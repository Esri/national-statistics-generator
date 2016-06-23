# National Statistics Generator (NatSTAT)

This tool generates national statistics data directly within SPSS. It works by capturing the latest population, lifestyle, market, job and spending 
data from Esri’s Geoenrichment Service after referencing location values (latitude and longitude values) provided in the stream. This specific version has full support for coorindates in the United States, however the tool code can be altered to support other countires.

## Sources
Esri demographic data sources are documented here, [Esri U.S. Data Fact Sheet (PDF)](http://downloads.esri.com/esri_content_doc/dbl/us/G68812_Data_Factsheet-FINAL_04-23-15.pdf).

![SPSS Node Dialog](https://github.com/phpmaps/national-statistics-generator/blob/master/Screenshot/spss_natstat.png?raw=Yes)

## Instructions
* Read dependencies section
* Install NatSTAT
* Build a stream that includes a data source containing a Latitude and Longitude field
* Click on the NatSTAT node and connect the Latitude and Longitude fields with your data source 
* Select a data collection, buffer distance and input your ArcGIS Online username and password
* Connect the NatSTAT tool with an output node 
* Run the stream

## Extension Data Reference 
Below are the data collections which you can use to enrich your data.  The column titled total number of variables indicates the total number of fields that will get generated in your output. 
To learn more about the data collection variables, which will be included in your output, click on the hyperlinks in the below table to open up the National Statistic Variable Explorer.

#### National Statistic Variable Explorer

![NatSTAT Data Explorer](https://github.com/phpmaps/national-statistics-generator/blob/master/Screenshot/dataexplorer.png?raw=Yes)

### Income Data

Data collection  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Disposable Income](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=disposableincome&countryCode=us)  | 96 | Yes
[Food Stamps / SNAP](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=foodstampsSNAP&countryCode=us)  | 6 | Yes
[Household Income](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=householdincome&countryCode=us) | 92 | Yes
[Income by Age](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=incomebyage&countryCode=us) | 396 | Yes
[Net Worth](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=networth&countryCode=us) | 82 | Yes
[Wealth Facts](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=Wealth&countryCode=us) | 58 | Yes

### Age Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Age 1 Year Increments](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=1yearincrements&countryCode=us)  | 576 | Yes
[Age 5 Year Increments](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=5yearincrements&countryCode=us)  | 187 | Yes
[Age by Race by Sex](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=agebyracebysex&countryCode=us) | 1000 | Yes
[Income by Age](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=incomebyage&countryCode=us) | 396 | Yes

### Household Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Disability](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=disability&countryCode=us)  | 6 | Yes
[Household Totals](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=householdtotals&countryCode=us)  | 35 | Yes
[Household Type](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=householdtype&countryCode=us) | 35 | Yes
[Households by Age of Householder](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=householdsbyageofhouseholder&countryCode=us) | 16 | Yes
[Households by Race of Householder](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=householdsbyraceofhouseholder&countryCode=us) | 44 | Yes
[Households by Size](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=householdsbysize&countryCode=us) | 13 | Yes
[Presence of Children](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=presenceofchildren&countryCode=us) | 55 | Yes

### Housing Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Heating Fuel](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=heatingfuel&countryCode=us)  | 28 | Yes
[Home Value](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=homevalue&countryCode=us) | 110 | Yes
[Housing Cost](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=housingcosts&countryCode=us) | 114 | Yes
[Housing Unit Totals](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=housingunittotals&countryCode=us) | 4 | Yes
[Housing by Age of Householder](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=housingbyageofhouseholder&countryCode=us) | 16 | Yes
[Housing by Race of Householder](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=housingbyraceofhouseholder&countryCode=us) | 16 | Yes
[Housing by Size](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=housingbysize&countryCode=us) | 14 | Yes
[Owner and Renter](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=OwnerRenter&countryCode=us) | 8 | Yes
[Units in Structure](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=unitsinstructure&countryCode=us) | 34 | Yes
[Vacant](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=vacant&countryCode=us) | 10 | Yes
[Vehicles Available](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=vehiclesavailable&countryCode=us) | 39 | No
[Year Built](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=yearbuilt&countryCode=us) | 31 | No
[Year Moved In](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=yearmovedin&countryCode=us) | 36 | No

### Health Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Health](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=health&countryCode=us)  | 161 | No
[Health Insurance Coverage](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=HealthPersonalCare&countryCode=us) | 123 | Yes


### Education Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Educational Attainment](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=educationalattainment&countryCode=us)  | 54 | Yes
[School Enrollment](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=schoolenrollment&countryCode=us) | 70 | Yes

### Business Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Businesses](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=businesses&countryCode=us)  | 73 | Yes
[Employees](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=employees&countryCode=us) | 72 | No
[Industry by NAICS Code](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=industrybynaicscode&countryCode=us)  | 123 | Yes
[Industry by SIC Code](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=industrybysiccode&countryCode=us) | 96 | Yes
[Sales](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=sales&countryCode=us) | 73 | Yes

### Population Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Gender](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=gender&countryCode=us)  | 187 | Yes
[Group Quarters](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=groupquarters&countryCode=us) | 12 | Yes
[Key Global Facts](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=KeyGlobalFacts&countryCode=us) | 5 | Yes
[Language](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=language&countryCode=us) | 154 | Yes
[Population Totals](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=populationtotals&countryCode=us) | 20 | Yes

### Race Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Age by Race by Sex](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=agebyracebysex&countryCode=us)  | 1000 | Yes
[Hispanic Origin](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=hispanicorigin&countryCode=us) | 24 | Yes
[Language](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=language&countryCode=us) | 154 | Yes
[Race and Hispanic Origin](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=raceandhispanicorigin&countryCode=us) | 68 | Yes

### Spending Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Clothing](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=clothing&countryCode=us)  | 79 | Yes
[Education](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=education&countryCode=us) | 12 | Yes
[Entertainment](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=entertainment&countryCode=us) | 72 | Yes
[Financial](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=financial&countryCode=us) | 57 | Yes
[Food](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=food&countryCode=us)  | 169 | Yes
[Health Personal Care](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=HealthPersonalCareCEX&countryCode=us) | 54 | Yes
[Housing and Household](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=HousingHousehold&countryCode=us) | 197 | Yes
[Life Insurance and Pension](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=LifeInsurancePensions&countryCode=us) | 8 | Yes
[Miscellaneous](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=miscellaneous&countryCode=us)  | 27 | Yes
Spending Total | 2 | Yes
[Transportation](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=transportation&countryCode=us) | 63 | Yes
[Travel](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=TravelCEX&countryCode=us) | 26 | Yes

### Behaviors Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Automobiles & Automotive](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=AutomobilesAutomotiveProducts&countryCode=us)  | 137 | Yes
[Baby Products, Toys & Games](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=BabyProductsToysGames&countryCode=us) | 57 | Yes
[Civic Activities & Political Affiliation](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=CivicActivitiesPoliticalAffiliation&countryCode=us) | 31 | Yes
[Clothing, Shoes & Accessories](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=ClothingShoesAccessories&countryCode=us) | 68 | Yes
[Electronics & Internet](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=ElectronicsInternet&countryCode=us)  | 198 | Yes
[Financial & Insurance](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=FinancialInsurance&countryCode=us) | 184 | Yes
[Grocery & Alcoholic Beverages](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=GroceryAlcoholicBeverages&countryCode=us) | 301 | Yes
[Health & Personal Care](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=HealthPersonalCare&countryCode=us) | 191 | Yes
[Home Improvement, Garden & Lawn](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=HomeImprovementGardenLawn&countryCode=us)  | 106 | Yes
[Household Goods, Furniture & Appliances](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=HouseholdGoodsFurnitureAppliances&countryCode=us) | 154 | Yes
[Leisure Activities/Lifestyle](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=LeisureActivitiesLifestyle&countryCode=us) | 132 | Yes
[Media - Magazines & Newspapers](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=MediaMagazinesNewspapers&countryCode=us) | 51 | Yes
[Media - Radio & Other Audio](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=MediaRadioOtherAudio&countryCode=us)  | 76 | Yes
[Media - TV Viewing](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=MediaTVViewing&countryCode=us) | 127 | Yes
[Pets & Products](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=PetsPetProducts&countryCode=us) | 41 | Yes
[Phones & Yellow Pages](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=PhonesYellowPages&countryCode=us) | 108 | Yes
[Psychographics & Advertising](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=PsychographicsAdvertising&countryCode=us)  | 178 | Yes
[Restaurant](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=restaurants&countryCode=us) | 91 | Yes
[Shopping](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=shopping&countryCode=us) | 148 | Yes
[Sports](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=sports&countryCode=us) | 99 | Yes
[Travel](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=TravelCEX&countryCode=us) | 85 | Yes

### Jobs Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Commute](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=commute&countryCode=us)  | 97 | Yes
[Industry](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=industry&countryCode=us) | 25 | Yes
[Occupation](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=occupation&countryCode=us) | 23 | Yes
[Veterans](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=veterans&countryCode=us) | 73 | Yes
[Women](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=women&countryCode=us) | 37 | Yes

### Poverty Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Households](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=households&countryCode=us)  | 37 | Yes
[Population](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=households&countryCode=us) | 22 | Yes


### Marital Status Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Marital Status Totals](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=maritalstatustotals&countryCode=us)  | 18 | Yes

### Tapestry and Lifestyle Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Lifemode Groups](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=lifemodegroupsNEW&countryCode=us)  | 14 | Yes
[Tapestry Adults](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=tapestryadultsNEW&countryCode=us) | 69 | Yes
[Tapestry Households](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=tapestryhouseholdsNEW&countryCode=us)  | 92 | Yes
[Tapestry Population](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=tapestrypopulationNEW&countryCode=us) | 89 | Yes
[Urbanization Groups](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=urbanizationgroupsNEW&countryCode=us)  | 6 | Yes

### At Risk Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[At Risk](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=AtRisk&countryCode=us) | 65 | Yes

### Key US Facts Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Key US Facts](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=KeyUSFacts&countryCode=us)  | 14 | Yes

### Supply and Demand Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Retail Marketplace](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=retailmarketplace&countryCode=us)  | 184 | Yes

### Policy Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Policy Facts](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=Policy&countryCode=us)  | 36 | Yes

### Landscape Data

Category  | Total # of National Statistic Variables | Available In NatSTAT 
:------------- | ------------- | ---------------
[Infrastructure](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=Infrastructure&countryCode=us)  | 7 | Yes
[Landcover](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=LandCover&countryCode=us) | 7 | Yes
[Landscape Facts](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=LandscapeFacts&countryCode=us) | 9 | Yes
[Public Lands](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=PublicLands&countryCode=us) | 8 | Yes
[Soils](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=Soils&countryCode=us)  | 9 | Yes
[Water and Wetlands](http://esri.github.io/developer-support/web-js/data-collection-brower-natstat/index.html?collection=WaterWetlands&countryCode=us)  | 6 | Yes

## Dependencies
NatSTAT for SPSS requires an ArcGIS Online subscription.  If you do not have access to an ArcGIS Online subscription the good news is that you can register for a free evaluation here.  The free evaluation gives you 200 credits which can be used to support SPSS analysis.
This requires IBM SPSS Modeler 17.1 (it may work on newer SPSS versions if so please update this documentation).

## Data Apportionment
The location values passed into NatSTAT are converted into geographic points.  These points are then buffered according to the distance chosen.  Demographic data that intersects with the area is summarized using Esri’s spatial data apportionment logic.

## Recommendations
When running this tool it’s recommended to initially pass in a small number of records (3-5 records) containing location data before processing large datasets.   This workflow helps ensure that ArcGIS Online credits consumed while processing large datasets will be meaningful.  If the output of the small data stream is not meaningful do not process the large dataset.

## Full US Data Catalog
For the full catalog of U.S. Esri Demographic and Business Data, download the [2015 Esri Demographic and Business Data List (XLS)](http://links.esri.com/data-catalog).

## Need International Data
It would be pretty easy to modify this tool to generate national statistic data for countries outside the US by referencing the proper 2-digit country code and by changing the dropdown values. The dropdown values will need to be 
changed because not every country has the same data availability.  To determine available for each  country use this [data browser tool](http://la.arcgis.com/databrowser).

![ArcGIS Online Data Browser](https://github.com/phpmaps/national-statistics-generator/blob/master/Screenshot/databrowser.png?raw=Yes)

## Contributing

Anyone and everyone is welcome to contribute. 

## Licensing
Copyright 2016 Esri

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

A copy of the license is available in the repository's [license.txt]( https://github.com/Esri/national-statistics-generator/blob/master/license.txt) file.

[](Esri Tags: IBM SPSS)
[](Esri Language: R)