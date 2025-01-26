from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from db_connection import  execut_query

# for testing 
class ActionFetchAllProducts(Action):

    def name(self) -> Text:
        return "action_fetch_all_products"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

            
        query="SELECT * FROM products" 
        result=execut_query(query)  
             
        if result:
            products_list = "\n".join([f"- {row['name']}" for row in result])
            message = f"Here are the available products:\n\n{products_list}"       
        else:
            message="Sorry there is no products available at moment"
        
        dispatcher.utter_message(text=message)

        return []

 