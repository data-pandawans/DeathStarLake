from dotenv import load_dotenv
import requests 
import pandas as pd
import awswrangler as wr
import boto3
import os

class S3Loader:
    def __init__(self):
        load_dotenv()
        aws_access_key_id = os.getenv("aws_access_key_id")
        aws_secret_access_key = os.getenv("aws_secret_access_key")
        self.session = boto3.session.Session(aws_access_key_id=aws_access_key_id,
                                        aws_secret_access_key=aws_secret_access_key, 
                                        region_name='us-east-1')
        
    def create_database(self, database_name):
        # TO-DO: criar os logs e checar erro
        wr.catalog.create_database(database_name, exist_ok=True, boto3_session=self.session)

    def load_data(self, data, path, layer, database_name, table_name):
        # TO-DO: criar os logs e checar erro
        if layer == 'raw':
            res = wr.s3.to_csv(
                df=data,
                sep='|',
                path=path,
                dataset=True,
                mode="overwrite",
                database=database_name,
                table=table_name,
                boto3_session=self.session
            )
        else:
            # TO-DO: criar para próximas camadas
            pass
            

        return res