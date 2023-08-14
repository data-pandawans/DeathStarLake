from jobs.base.loader import S3Loader
from jobs.base.swapi_client import SWAPIClient

def lambda_handler(event, context):

    sw_client = SWAPIClient()
    s3 = S3Loader()
    
    s3.create_database('raw-anakin')

    tables = ['films','people','planets','species','starships','vehicles']
    for table_name in tables:
        print(f"Iniciando o carregamento da tabela {table_name}...")
        df = sw_client.extract_data(table_name)
        if df is None:
            print("Dataframe vazio, pulando ingestão")
            continue
        print(f"Subindo {table_name} para o S3...")
        s3.load_data(
            data=df,
            path=f's3://bronze-raw-anakin/{table_name}/',
            layer='raw',
            database_name = 'raw-anakin', 
            table_name = table_name
        )
        print(f"Finalizado o carregamento da tabela {table_name}.")
    
    
    return {
        'statusCode': 200,
        'body': 'Ok'
    }
