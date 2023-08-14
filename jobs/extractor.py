import requests 
import pandas as pd
from loader import S3Loader

class SWAPIClient:
    def __init__(self):
        # Constrói a URL completa para o endpoint especificado
        self.base_url = f"https://swapi.dev/api/"
    # Função para extrair dados de um endpoint específico com paginação
    def extract_data(self, endpoint):
        # TO-DO: colocar os logs nas etapas de requisição
        url = self.base_url + endpoint
        # Cria uma uma sessão em cada interação, permitindo que a conexão seja mantida aberta
        ## Envia uma solicitação GET para a URL usando a biblioteca 'requests'
        session = requests.Session()
        response = session.get(url)
        # Verifica se a reposta tem um status code 200 (indicando uma resposta bem sucedida)
        if response.status_code == 200:
            # Extrai os dados da resposta em formato JSON
            data = response.json()
            # Inicializa uma lista chamada 'results' com os resultados extraídos 
            results = data['results']
            # Verifica se há um link para a próxima página nos dados extraídos
            while data['next']:
                # Havendo próxima página, envia uma nova solicitação GET 
                response = session.get(data['next'])
                data = response.json()
                # Adiciona os dados da próxima página à lista 'results'
                results.extend(data['results'])
            # Retorna a lista completa de resultados extraídos
            df = pd.DataFrame(results)
            df.replace(to_replace=[r"\t|\n|\r"], value=[""], regex=True, inplace=True)
            return df
        else:
            # Se a resposta inicial não for bem-sucedida (status code diferente de 200),
            ## exibe uma mensagem de erro indicando o endpoint e o status code da resposta
            print(f"Erro ao extrair dados do endpoint {endpoint}. Status code: {response.status_code}")
            # Retorna None para indicar que ocorreu um erro na extração dos dados
            return None

def main():
    sw_client = SWAPIClient()
    s3 = S3Loader()

    tables = ['films','people','planets','species','starships','vehicles']
    for table_name in tables:
        print(f"Iniciando o carregamento da tabela {table_name}...")
        df = sw_client.extract_data(table_name)
        print(f"Subindo {table_name} para o S3...")
        s3.create_database('raw-anakin')
        s3.load_data(
            data=df,
            path=f's3://bronze-raw-anakin/{table_name}/',
            layer='raw',
            database_name = 'raw-anakin', 
            table_name = table_name
        )
        print(f"Finalizado o carregamento da tabela {table_name}.")

if __name__ == "__main__":
    main()