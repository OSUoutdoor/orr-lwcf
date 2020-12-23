library(readr)
## The file name needs to be changed
LandWCF <- read_csv("~/Downloads/LandWCF_November 19, 2020_14.10")
LandWCF$Q6_1[LandWCF$Q1_2_TEXT=="City of Farmington"]<-"New Mexico"
LandWCF$Q6_2[LandWCF$Q1_2_TEXT=="City of Farmington"]<-"San Juan County"
## Remove Columns and Identifiable Rows
test <- LandWCF[-c(1:2),] 
test <- test[-c(1:17)] 

## Change Name of Columns
library(dplyr)
test= test %>% 
  rename(
    State = Q6_1,
    County = Q6_2
  )
map$program<-map$`Program?`

library(readr)
##  Merge on State/County
centroidsUS <- read_csv("~/workspace/lwcf/assets/centroidsUS.csv")
tester<-merge(centroidsUS, test, by.x=c('State','County'), all=FALSE)

##Finding those thatt didn't fill in County
t<-map[- grep("", map$County),]
tester1<-merge(centroidstates, t, by.x='State', all=FALSE)
tester1$StateAp<-NULL

## Bind together
tester=rbind(tester,tester1)



## Clean up some of the strings in the data so easier to view on C3.js

tester$Q10<- gsub("(trail resurfacing, bridge construction, multi-use paths)|(parking areas, electrical, roads, ADA accessibility, shelters, water treatment, waste management)|(surface upgrades and rehabilitation, lighting, running tracks)|(including ADA accessibility)|(boathouses, beaches piers/pavilions, boat launches)", "", tester$Q10)
tester$Q10<-gsub("\\(State Comprehensive Outdoor Recreation Plans \\(SCORPs) and Master Plans)", "", tester$Q10)
tester$Q10<-gsub("\\(please describe on next page)", "", tester$Q10)
tester$Q10<-gsub("\\ ()", "", tester$Q10)
tester$Q10<-gsub("\\()", "", tester$Q10)
tester$Q10<-gsub("\\:", "", tester$Q10)
tester$Q9<-gsub("\\(please describe)", "", tester$Q9)
tester$Q15<-gsub("\\(please describe)", "", tester$Q15)
tester$Q9<-gsub("\\:", "", tester$Q9)
tester$Q15<-gsub("\\:", "", tester$Q15)
tester$Q15<-gsub("Campground \\+ Hospitality", "Campground/Hospitality", tester$Q15)
tester$Q15<-gsub("Kayaking and Rafting", "Kayaking/Rafting", tester$Q15)

tester$best<-"No"
tester$best[tester$Project=="Homestead"| 
               tester$Project=="Fishing Pier, Delaware City Branch Channel of the C&D Canal"|
               tester$Project=="Rebuild ATV/Snowmobile Trail from Dollar Bay to Lake Linden"|
               tester$Project=="All Abilities Park"|
               tester$Project=="Port of Anacortes--Developing the Cap Sante Marina RV Park"|
               tester$Project=="Bluewater Creek ACEC"|
               tester$Project=="Eastview/Westview Park Improvements"|
               tester$Project=="Junction City Fishing Access Improvement"|
               tester$Project=="Yellowjacket Reservoir Access Enhancement"|
               tester$Project=="North Delaware River Greenway"|
               tester$Project=="Chelan-Renovating Lakeside Park" ]<-"Yes"




#Write CSV file
write.csv(tester, file="lwcfsurvey.csv")

#Write GeoJson File 
library("geojsonio", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
geojson_write(tester, file = "lwcf.geojson")


