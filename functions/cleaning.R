# To clean column names, remove empty rows and columns and remove columns called delta and comments.
cleaning <- function(data_raw){  
  data_raw %>%
    clean_names() %>%   #cleaning names
    remove_empty(c("rows", "cols")) %>%   #removing empty rows and columns
    select(-starts_with("delta")) %>%   #removing columns that start with delta
    select(-comments)   #removing comments column
}

# To subset the data to only include penguins that are not NA for culmen length or body mass.
remove_empty_rows <- function(data_clean){
  data_clean %>%
    filter(!is.na(culmen_length_mm)) %>%   #removing rows NA for culmen length
    filter(!is.na(body_mass_g)) %>%   #removing rows NA for body mass
    select(species, culmen_length_mm, body_mass_g) #selecting only species, culmen length and body mass columns
}