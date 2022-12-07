# To plot culmen length as a linear regression of body mass and species.
plot_figure <- function(penguins_1){
  penguins_1 %>% 
    ggplot(aes(x = body_mass_g, y = culmen_length_mm, colour=species)) +   #setting variables
    geom_point() +   #plotting data points
    scale_color_manual(values = c("steelblue","goldenrod", "deeppink"), 
                       labels=c("Adelie", "Chinstrap", "Gentoo")) +   
    #picking colours suitable for those with colour vision deficiencies 
    geom_smooth(method="lm") +    #adding linear regression line
    labs(title="Culmen length as a function of body mass and species", 
         x="Body mass (g)", y="Culmen length (mm)", 
         colour="Species") +   #setting title and axis labels
    theme_bw() +   #changing theme
    theme(legend.position="bottom")  #changing legend position
}