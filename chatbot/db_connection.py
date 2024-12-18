import pymysql.cursors
import os

 
def establish_db_connection():
    
     """Establish a connection to the database using environment variables or defaults."""
    
     return pymysql.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", "7261"),
        database=os.getenv("DB_NAME", "askmart_db"),
        cursorclass=pymysql.cursors.DictCursor
    )
     
     
def execut_query(query):
    
    connection=establish_db_connection()   
    
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(query)
            result=cursor.fetchall()
            return result
        

if __name__ == "__main__":
    query="SELECT * FROM products WHERE category = \"Fruits\""
    result=execut_query(query)
    
    for row in result:
        # print(row)
        print(f"Product ID: {row['product_id']}")
        print(f"Name: {row['name']}")
        print(f"Description: {row['description']}")
        print(f"Price: {row['price']}")  
        print(f"Stock Quantity: {row['stock_quantity']}")
        print(f"Category: {row['category']}")
        print(f"Brand: {row['brand']}")
        print()
