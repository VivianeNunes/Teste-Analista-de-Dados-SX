# Teste Analista de Dados SX - Viviane Nunes Evangelista

### MySQL
Para as questões de indicadores gerei script SQL no MySQL(Scripts MySQL.sql) com as queries das atividades propostas. Segue arquivo.
São eles:
    Indicadores MySQL aluno com maior nota;
    Indicadores MySQL inscritos;
    Indicadores MySQL media por disciplina;
    Indicadores MySQL media por etnia;
    Indicadores MySQL media por sexo.

#### Tableau
Gostaria de salientar que, na medida do possível, inclui as seguintes acessibilidades consideradas nas práticas de UX na elaboração das visões no painel analítico.
    paleta de cores para os daltônicos;
    informações reunidas em telas únicas para facilitar a navegação de pessoas com necessidades especiais. 

Para as analises elaboradas no Tableau realizei a importação da tabela MICRODADOS_ENEM_2020.csv através dos recursos fornecidos pela própria ferramenta. 
    Vide Fonte de Dados Tableau.
Para as atividades de visualizações gráficas elaborei os painéis analíticos no Tableau.

São eles: 
    Painel Tableau Notas Enem;
        visões:
            qtde de inscritos;
            média de notas;
            média de notas por genero e tipo de escola;
            média das notas por qtde de inscritos por UF.
    Painel Tableau dispersão nota individual Enem;
        visões:
            dispersão dos candidatos por notas de prova;
            média de notas por tipo de escola.
    Painel Tableau Notas Redação;
        visões:
            media de notas da redação por faixa etária;
            média das notas da redação por UF.
    Painel Tableau Questionario socio economico.
        visões:
            questionário sócio econômico - internet em casa;
            questionário sócio econômico - computador em casa.

    Os paineis possuem filtros dinamicos (que interagem entre si):
        UF da prova;
        tipo de escola (particular ou pública);
        genero(masculino ou feminino);
        faixa etária. 

### Insights 
    Ao analisar os painéis, percebe-se, que a média das notas para os inscritos que declararam ter estudado nas escolas particulares é consideravelmente superior as notas dos inscritos que declararam estudar nas escolas públicas;
    Este feito se repete nas notas da redação;
    Para as médias de notas de redação percebe-se que a menor faixa de idade possui as maiores médias e a medida que as faixas de idades aumentam as notas da redação caem consideravelmente;
    Para os questionários sócio economicos, fica claro que ter internet em casa contribui para uma boa média de notas. Em contra partida, ter computador em casa não fez real diferença  para as médias de notas. Podemos antecipadamente atribuir este feito ao uso do celular como recurso de estudo.
    De acordo com os mapas nota-se que a região sudeste tem a maior concentração de quantidade de inscritos, mas a média das notas é relativamente uniforme por todas as regiões.
    A quantidade de inscritos é relativamente uniforme para ambos os generos (masculinos e femininos), no entanto, é alta a quantidade de genero não informado.







