##  Bash scripting 

# Extract
mkdir raw
cd raw
curl -o data.csv "(https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv)"

# Transforming Data
   # Renaming the column named Variable_code to variable_code.
         nano data.csv
    # selected only the following columns: year, Value, Units, and variable_code.
         awk -F, '{print $1, $5, $6, $9}' data.csv >  2023_year_finance.csv
    # Saving the content of these selected columns into a file named 2023_year_finance.csv.
    # The file was saved in a folder called # Transformed

# Load
mkdir Gold 
mv 2023_year_finance.csv Gold