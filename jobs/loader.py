import os
import boto3
from dotenv import load_dotenv

class S3Uploader:
    def __init__(self, bucket_name):
        # Inicialização do cliente S3 e nome do bucket.
        # Lê as credenciais da AWS do arquivo .env
        load_dotenv()
        aws_access_key_id = os.getenv('AWS_ACCESS_KEY_ID')
        aws_secret_access_key = os.getenv('AWS_SECRET_ACCESS_KEY')

        self.s3_client = boto3.client(
                                's3', 
                                aws_access_key_id=aws_access_key_id, 
                                aws_secret_access_key=aws_secret_access_key
                            )
        self.bucket_name = bucket_name
  

    def upload_file(self, local_file_path, s3_key):
        # Faz o upload de um arquivo local para o S3.

        # Verifica se o arquivo local existe.
        if not os.path.isfile(local_file_path):
            raise FileNotFoundError(f"O arquivo {local_file_path} não foi encontrado.")

        try:
            # Faz o upload do arquivo para o S3.
            self.s3_client.upload_file(local_file_path, self.bucket_name, s3_key)
            print(f"Arquivo {local_file_path} enviado com sucesso para o S3.")
        except Exception as e:
            print(f"Erro ao enviar o arquivo {local_file_path} para o S3: {e}")
