##  Bash scripting 

# Extract
mkdir raw
mkdir Gold
cd raw
mkdir Transformed
link="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
curl -o data.csv $link 

# Transform the CSV file 


# Transform the CSV file 
awk -F, '
BEGIN {
   OFS = ",";
}
NR == 1 {
   gsub("Variable_code", "variable_code", $0);
   print $1, $5, $6, $9;
}
NR > 1 {
    print $1, $5, $6, $9;
}' data.csv > Transformed/2023_year_finance.csv



# Transform the CSV file 
# csvcut -c year,Value,Units,variable_code raw/data.csv | \
# csvformat -U 1 | \
# csvsql --query "SELECT year, Value, Units, Variable_code as variable_code FROM stdin" > Gold/2023_year_finance.csv


# Transforming Data
#    Renaming the column named Variable_code to variable_code.
#          nano data.csv
#     selected only the following columns: year, Value, Units, and variable_code.
#          awk -F, '{print $1, $5, $6, $9}' data.csv >  2023_year_finance.csv
#     Saving the content of these selected columns into a file named 2023_year_finance.csv.
#     The file was saved in a folder called # Transformed

#Load
mv Transformed/2023_year_finance.csv ../Gold