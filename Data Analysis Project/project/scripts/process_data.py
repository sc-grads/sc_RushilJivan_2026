import pandas
var = pandas.read_csv('../data/Messy_Sales_Data.csv')
print('Full list')
print(var)
print ('--------------------------')
print('HEAD')
print(var.head())
print ('--------------------------')
print('SHAPE')
print(var.shape)
print ('--------------------------')
print('NULL VALUES')
print(var.isnull().sum())
print ('--------------------------')
print('DUPLICATED VALUES')
print(var.duplicated().sum())
print ('--------------------------')

var = var.drop_duplicates()
print(var)

var['quantity'] = var['quantity'].fillna(0)
var['salesperson'] = var['salesperson'].fillna('Unknown')

print("Missing values after filling:")
print(var.isnull().sum())
print('--------------------------')



var['date'] = pandas.to_datetime(var['date'])
var['quantity'] = pandas.to_numeric(var['quantity'])
var['price'] = pandas.to_numeric(var['price'])
var['product'] = var['product'].str.strip()
var['category'] = var['category'].str.strip()
var['region'] = var['region'].str.strip()
var['salesperson'] = var['salesperson'].str.strip()


print("Data types after standardization:")
print(var.dtypes)

print('--------------------------')
print("Final preview:")
print(var.head())
print('--------------------------')
print('--------------------------')
print('--------------------------')
print(var)

var.to_csv('../output/clean_sales.csv', index=False)
