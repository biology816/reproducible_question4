# To save the plot as a png and define the size, resolution, and scaling.
save_penguins_plot_png <- function(penguins_1, filename, size, res, scaling){
  agg_png(filename, 
          width = size, 
          height = size,    #setting dimensions
          units = "cm",    #setting units
          res = res,    #setting resolution
          scaling = scaling)    #setting scaling factor
  penguins_figure <- plot_figure(penguins_1)   
  print(penguins_figure)   #printing figure to an empty file
  dev.off()   #ends the plotting functionality
}

# To save the plot as a svg and define the size and scaling.
save_penguins_plot_svg <- function(penguins_1, filename, size, scaling){
  size_inches = size/2.54   #converting size into inches
  svglite(filename, 
          width = size_inches, 
          height = size_inches,   #setting dimensions 
          scaling = scaling)   #setting scaling factor
  penguins_figure <- plot_figure(penguins_1)
  print(penguins_figure)   #printing figure to an empty file
  dev.off()   #ends the plotting functionality
}