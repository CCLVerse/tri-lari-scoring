# Extracting the last 14 columns for analysis
last_14_columns = decisive_data.iloc[:, -14:]

# Calculating descriptive statistics for these columns
descriptive_stats = last_14_columns.describe()

# Displaying the descriptive statistics
descriptive_stats
