# SWAPI 
O Script destina-se a extração dos dados da `https://swapi.dev` dos endpoints `/films` e `/starships`, e está documentado aqui para referência. 
Foram utilizas as bibliotecas `requests` e `pandas` para realizar requisições com os dados desejados e armazenamento em um DataFrame.

## `def extrair_dados(endpoint):`
A função `extrair_dados` é responsável por extrair dados de um endpoint específico com paginação. Ela recebe o parâmetro endpoint, que é a parte final da URL para o endpoint desejado. Caso ocorra algum erro durante a extração dos dados, a função retornará `None`.

![Alt text](2.png)

## `def extracao_filme():`
A função extracao_films é responsável por extrair os dados dos filmes do endpoint /films e armazená-los em um arquivo CSV chamado films.csv.

![Alt text](3.png)

Certifique-se de ter chamado a função extrair_dados corretamente para obter os dados do endpoint /films. Os dados extraídos são processados e armazenados em uma lista de dicionários chamada films, onde cada dicionário contém os campos relevantes de um filme.

Em seguida, os dados são exibidos no console, um DataFrame do pandas é criado a partir da lista films. Além disso, o DataFrame é exportado para um arquivo CSV chamado films.csv.

## `def extracao_starships():`
A função extracao_starships é responsável por extrair os dados das naves espaciais do endpoint /starships e armazená-los em um arquivo CSV chamado starships.csv.

![Alt text](4.png)
![Alt text](5-2.png)

Certifique-se de ter chamado a função extrair_dados corretamente para obter os dados do endpoint /starships. Os dados extraídos são processados e armazenados em uma lista de dicionários chamada starships, onde cada dicionário contém os campos relevantes de uma nave espacial.

Em seguida, os dados são exibidos no console, um DataFrame do pandas é criado a partir da lista starships. Além disso, o DataFrame é exportado para um arquivo CSV chamado starships.csv.

## `def main():`
A função main é responsável por chamar as funções extracao_films e extracao_starships para realizar a extração dos dados dos filmes e das naves espaciais.

![Alt text](6.png)

Ao executar a função main, os dados dos filmes serão extraídos e armazenados no arquivo CSV films.csv, e em seguida, os dados das naves espaciais serão extraídos e armazenados no arquivo CSV starships.csv.

Certifique-se de ter as bibliotecas requests e pandas instaladas e importadas corretamente antes de chamar a função main.

## `if __name__ == "__main__":`
![Alt text](7.png)

Este trecho de código `if __name__ == "__main__":` verifica se o script está sendo executado diretamente e não sendo importado como um módulo. Se for o caso, a função main será chamada para iniciar a extração dos dados.

Isso permite que o script possa ser executado diretamente, por exemplo, quando você o executa no terminal ou na linha de comando. Quando o script é importado como um módulo em outro script, a função main não será executada automaticamente, mas você poderá chamá-la explicitamente, se necessário.