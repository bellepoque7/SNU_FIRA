rm(list = ls()); gc(reset = T)

# -----------------------------------
surveys <- read.csv(file = './data/surveys.csv')

# -----------------------------------
match(c("plot_id", "species_id", "weight"),  names(surveys))
surveys[, match(c("plot_id", "species_id", "weight"),  names(surveys)) ]

# -----------------------------------
surveys[,c("plot_id", "species_id", "weight") ]

# -----------------------------------
surveys[c("plot_id", "species_id", "weight")]

# -----------------------------------
surveys$year == 1995
surveys[surveys$year == 1995, ]
head(surveys[surveys$year == 1995, ])

# -----------------------------------
surveys[surveys$weight<5, c("species_id", "sex", "weight")]
surveys[which(surveys$weight<5), c("species_id", "sex", "weight")]

# -----------------------------------
surveys_ex <- surveys
surveys_ex$weight_kg <- surveys_ex$weight/1000
surveys_ex <- surveys_ex[!is.na(surveys_ex$weight_kg),] 

# -----------------------------------
u = unique(surveys$sex)
length(u)
class(surveys$sex)
levels(surveys$sex)

# -----------------------------------
mean( surveys$weight[surveys$sex == u[1]], na.rm = T )
mean( surveys$weight[surveys$sex == u[2]], na.rm = T )
mean( surveys$weight[surveys$sex == u[3]], na.rm = T )

# -----------------------------------
by( data = surveys$weight, INDICES =  surveys$sex, 
    FUN  = mean, na.rm = TRUE)

aggregate(formula = weight ~ sex, data = surveys,
          FUN = mean, na.rm = TRUE)

# -----------------------------------
aggregate(formula = weight ~ sex + species_id, 
          data = surveys, FUN = mean, na.rm = TRUE)

# -----------------------------------
table(surveys$sex)
table(surveys$sex, surveys$plot_id)

# -----------------------------------
surveys[order(surveys$plot_id),]

tmp <- surveys 
tmp <- tmp[order(tmp$plot_id),]
tmp <- tmp[order(tmp$month, decreasing = TRUE),]
head(tmp)

# -----------------------------------
if (!require(dplyr)) { install.packages("dplyr") ; library(dplyr) }

# -----------------------------------
select(.data = surveys, plot_id, species_id, weight)

head(select(surveys, plot_id, species_id, weight))
select(.data = surveys, plot_id, species_id, weight) %>% head()

# -----------------------------------
filter(.data = surveys, year == 1995) %>% head()

filter(.data = surveys, year >= 1995 & weight > 20) %>% head()
filter(.data = surveys, year >= 1995 , weight > 20) %>% head()

# -----------------------------------
surveys %>%
  filter( !is.na(weight) ) %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight) %>% head()

# -----------------------------------
surveys_ex <- surveys %>% filter( !is.na(surveys$weight)) %>%
  mutate(weight_kg = weight / 1000) 

# -----------------------------------
surveys %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

# -----------------------------------
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

# -----------------------------------
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            var_weight = var(weight),
            min_weight = min(weight),
            max_weight = max(weight)) %>%
  print(n = 5)

# -----------------------------------
surveys %>%
  group_by(sex) %>%
  tally()

surveys %>%
  group_by(plot_id, sex) %>%
  tally()

# -----------------------------------
surveys %>% arrange(month, plot_id) %>% head()

# -----------------------------------
surveys %>% arrange(desc(month), plot_id) %>% head()

# -----------------------------------
if (!require(dplyr)) { install.packages("dplyr") ; library(dplyr) }
if (!require(reshape2)) { install.packages("reshape2") ; library(reshape2) }

head(airquality, n = 3)

head(melt(airquality), n = 3)

# -----------------------------------
names(airquality) <-  tolower(names(airquality))
melt(data = airquality) %>% head(n=3)

# -----------------------------------
names(airquality) <-  tolower(names(airquality))
aql <- melt(data = airquality, id.vars= c("month","day"))
head(aql, n = 3)

# -----------------------------------
aql <- melt(airquality, id.vars = c("month", "day"),
            variable.name = "climate_variable", 
            value.name = "climate_value")
head(aql, n = 3)

# -----------------------------------
if (!require(reshape2)) { install.packages("reshape2") ; library(reshape2) }

aqw <- dcast(aql, month + day ~ climate_variable, 
             value.var ="climate_value")

dcast(aql, month ~ climate_variable, fun.aggregate = mean, 
      na.rm = TRUE, margins  = TRUE) %>% head(n=3)

