import sys
import pandas as pd

full_data = pd.read_csv('forecasts.csv')
quarter = str(sys.argv[1])
quarter_slice = full_data[['Date', quarter]].dropna().reset_index(drop=True)
quarter_slice.columns = ['Date', 'Data']
quarter_slice.to_csv('quarter_slice.csv', index=False)
