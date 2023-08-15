from loader import S3Loader
import awswrangler as wr

def lambda_handler(event, context):

    tables = ['films','people','planets'] #,'species','starships','vehicles']
    raw_database = 'raw-anakin'
    database_name = 'silver-darthvader'
    layer = 'clean'
    

    s3 = S3Loader()    
    s3.create_database(database_name)

    for table_name in tables:
        file = f"/Users/arthur/DeathStarLake/transformations/{table_name}.sql"
        path = 's3://silver-clean-darthvader'

        print(f"Iniciando o carregamento da tabela {table_name}...")
        with open(file) as f:  
            query = f.read()
        df = wr.athena.read_sql_query(sql=query, database=raw_database, boto3_session=s3.session)
        
        if df is None:
            print("Dataframe vazio, pulando ingestão")
            continue
        
        print(f"Subindo {table_name} para o S3...")
        s3.load_data(
            data=df,
            path=f'{path}/{table_name}/',
            layer=layer,
            database_name = database_name, 
            table_name = table_name
        )
        print(f"Finalizado o carregamento da tabela {table_name}.")
    
    
    return {
        'statusCode': 200,
        'body': 'Ok'
    }


if __name__ == '__main__':
    lambda_handler(None, None)