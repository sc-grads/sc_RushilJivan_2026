import pandas
import logging

logging.basicConfig(
        filename='../output/pipeline.log',
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s'
    )


try:
        logging.info("Pipeline started")

        var = pandas.read_csv('../data/Messy_Sales_Data.csv')
        logging.info(f"Data loaded successfully. Rows: {len(var)}")

        print('FULL LIST')
        print(var)
        print ('--------------------------')
        print('NULL VALUES')
        print(var.isnull().sum())
        print ('--------------------------')
        print('DUPLICATED VALUES')
        print(var.duplicated().sum())
        print ('--------------------------')

        var = var.drop_duplicates()
        logging.info("Duplicates removed")
        print('AFTER DROPPING DUPLICATES')
        print(var)

        var['quantity'] = var['quantity'].fillna(0)
        var['quantity'] = var['quantity'].astype(int)
        var['salesperson'] = var['salesperson'].fillna('Unknown')
        var = var[var['quantity'] > 0]
        logging.info("Missing values handled and invalid rows removed")

        print("Missing values after filling")
        print(var.isnull().sum())
        print('--------------------------')



        var['date'] = pandas.to_datetime(var['date'])

        var['quantity'] = pandas.to_numeric(var['quantity'])

        var['price'] = pandas.to_numeric(var['price'])

        var['product'] = var['product'].str.strip()

        var['category'] = var['category'].str.strip()

        var['region'] = var['region'].str.strip()

        var['salesperson'] = var['salesperson'].str.strip()

        logging.info("Data standardized")


        print("Data types after standardization")
        print(var.dtypes)

        print('--------------------------')
        print("Final preview:")
        print('--------------------------')
        print('--------------------------')
        print('--------------------------')
        print(var)


        var['revenue'] = var['quantity'] * var['price']
        var['month'] = var['date'].dt.to_period('M')

        logging.info("Transformation complete (revenue & month added)")


        sales_by_region = var.groupby('region')['revenue'].sum().reset_index()
        print(sales_by_region)
        print('----------------------------------')

        sales_by_product = var.groupby('product')['revenue'].sum().reset_index()
        print(sales_by_product)
        print('----------------------------------')

        monthly_revenue = var.groupby('month')['revenue'].sum().reset_index()
        print(monthly_revenue)
        print('----------------------------------')

        salesperson_performance = var.groupby('salesperson')['revenue'].sum().reset_index()
        print(salesperson_performance)
        print('----------------------------------')

        logging.info("Aggregation complete")


        var.to_csv('../output/clean_sales.csv', index=False)


        sales_by_region.to_csv('../output/sales_by_region.csv', index=False)
        sales_by_product.to_csv('../output/sales_by_product.csv', index=False)
        monthly_revenue.to_csv('../output/monthly_revenue.csv', index=False)
        salesperson_performance.to_csv('../output/salesperson_performance.csv', index=False)

        #var.to_excel('../reports/sales_analysis.xlsx', index=False)
        logging.info("Files exported successfully")

except Exception as e:logging.error(f"Pipeline failed: {e}")