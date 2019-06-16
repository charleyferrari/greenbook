load("http.star", "http")
load("encoding/csv.star", "csv")
load("zipfile.star", "ZipFile")
load("qri.star", "qri")

def download(ctx):
    # perform an HTTP GET request to greenbook data I have saved on github
    res = http.get("https://raw.githubusercontent.com/charleyferrari/greenbook/master/quarter_slice.csv")
    return res.body()

def transform(ds, ctx):
    rawCsvData = ctx.download

    parsedCsv = csv.read_all(rawCsvData, lazy_quotes=True, fields_per_record=-1)

    csvString = csv.write_all(parsedCsv)

    ds.set_body(csvString, raw=True, data_format='csv')
