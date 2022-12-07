
# Script name: penguin_assignment.r

# Purpose of script: 
## Loads penguin data, cleans it, runs statistical test and creates and saves figure 
## For culmen length as a function of body mass and species


#---------
# Initial setup
#--------

# Load libraries from file
source("functions/libraries.R")

# Load cleaning, plotting and saving functions from file
source("functions/cleaning.R")
source("functions/plotting.R")
source("functions/saving.R")


#---------
# Load the data
#--------
penguins_raw <- read.csv("data_raw/penguins_raw.csv")


#---------
# Clean the data
#---------

# To clean column names, remove empty rows and columns and remove columns called delta and comments.
penguins_clean <- cleaning(penguins_raw)

## Check the cleaned data before saving
head(penguins_clean)

# Save the cleaned data 
write.csv(penguins_clean, "data_clean/penguins_clean.csv")

# Subset the data and remove the penguins with NA for culmen length or body mass
penguins_1 <- remove_empty_rows(penguins_clean)

## Check the cleaned and subsetted data
head(penguins_1)


#---------
# Statistical testing
#---------

# Create linear model 
penguins_model <- lm(culmen_length_mm ~ body_mass_g*species, data=penguins_1)


## Check assumption of normality needed
plot(penguins_model, which=2)
## Shows no systematic departures from normality. 

## Check assumption of homogeneity of variance needed
plot(penguins_model, which=1)
## Shows variance in Y remains relatively constant over all values of x.


# Carry out ANCOVA
anova(penguins_model)
## Important to check if there is a significant interaction first, before main effects can be interpreted biologically.
## As there is no significant interaction, re-run model without interaction.


# Create new linear model
penguins_model_2 <- lm(culmen_length_mm ~ body_mass_g+species, data=penguins_1)

## Check assumption of normality needed
plot(penguins_model_2, which=2)
## Again shows no systematic departures from normality. 

## Check assumption of homogeneity of variance needed
plot(penguins_model_2, which=1)
## Again shows variance in Y remains relatively constant over all values of x.


# Carry out ANCOVA
anova(penguins_model_2)
## Based on p-values (both p<2.2e-16) can see significant effect of species and body mass on culmen length.

# Summary table to see amount of variance explained by model
summary(penguins_model_2)
## Adjusted R-squared = 0.8063, meaning ~80% of variance in the data is explained by the model. 
## This is very high and shows the biological significance.



#---------
# Plot the data
#---------

# Plot culmen length as a linear regression of body mass and species
penguins_figure <- plot_figure(penguins_1)
## See as body mass increases, culmen length also increases.
## Grey areas surrounding linear regression lines represent 95% confidence interval - as they do not overlap, can see significant effect of species.


#---------
# Save the figure
#---------

## Save as a png for a report 
save_penguins_plot_png(penguins_1, "figures/fig01_report.png", 
                       size = 20, res = 700, scaling = 1.55)

## Save as a vector to avoid pixelation
save_penguins_plot_svg(penguins_1, "figures/fig01_vector.svg", 
                       size = 20, scaling = 1.55)



