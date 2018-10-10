import logging

import azure.functions as func
import spacy
import json
import os

def main(req: func.HttpRequest) -> func.HttpResponse:

    logging.basicConfig(filename='/opt/mylog2.txt',format='%(asctime)s %(levelname)s: %(message)s',level=logging.DEBUG)

    #name = req.params.get('name')
    text = req.params.get('text')
    pageID = req.params.get('pageid') #"5bbb793f1c9d444f2c0b6c7c" #
    documentID = req.params.get('documentid') #"5bbb79221c9d444f2c0b6c7b" #
    # cosmosID = "65b2fab6-fe47-4148-ba18-89e85ed11f84" #req.params.get('cosmosid')

    logging.info("NLPFunction %s %s %s" % (text, pageID, documentID))

    # Read Cosmosdb document given from ENV variable named 'inputCosmosdb' - Name for Input CosmosDB binding
    file_data = json.loads(open(os.environ['inputDocument'],'r').read())[0]
    logging.info("... document loading complete.")

    # Construct full text as a string
    regions = file_data.get("body").get("json").get("regions")
    num_regions = len(regions)
    logging.info("... %s" % (num_regions))

    # Run spacy on full text
    nlp = spacy.load('en')
    logging.info("... spacy en loaded")
    doc = nlp(text)
    num_tokens = doc.__len__()

    res = "{ \"num_tokens\": \"%s\",  \"num_regions\": \"%s\"}" % (num_tokens, num_regions)
    logging.info("... final response = %s" % (res) )
    return func.HttpResponse(f"{res}")

