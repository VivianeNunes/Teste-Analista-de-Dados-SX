								/*LEVANTAR INDICADORES*/

/* 1- QUAL A ESCOLA COM A MAIOR MEDIA DE NOTAS*/
    SELECT
		CONCAT('MUNICIPIO DA ESCOLA: ',NO_MUNICIPIO_ESC,
		', UF DA ESCOLA: ', SG_UF_ESC,
		', Dependência administrativa (Escola): ', TP_DEPENDENCIA_ADM_ESC,
		', Localização (Escola): ',TP_LOCALIZACAO_ESC ,
		', Situação de funcionamento (Escola): ', TP_SIT_FUNC_ESC ,
		', TIPO DE ESCOLA: ',TP_ESCOLA) AS 'DADOS DA ESCOLA COM MAIOR MEDIA',
		MAX((
			(CAST(NU_NOTA_CH AS DECIMAL(10,2))) +
			(CAST(NU_NOTA_CN AS DECIMAL(10,2))) +
			(CAST(NU_NOTA_LC AS DECIMAL(10,2))) +
			(CAST(NU_NOTA_MT AS DECIMAL(10,2))) +
			(CAST(NU_NOTA_REDACAO AS DECIMAL(10,2)))
			) / 5) AS MAIOR_MEDIA
	FROM 
	microdados_enem_2020.microdados_enem_2020
    WHERE
		((
        (CAST(NU_NOTA_CH AS DECIMAL(10,2))) +
		(CAST(NU_NOTA_CN AS DECIMAL(10,2))) +
        (CAST(NU_NOTA_LC AS DECIMAL(10,2))) +
        (CAST(NU_NOTA_MT AS DECIMAL(10,2))) +
        (CAST(NU_NOTA_REDACAO AS DECIMAL(10,2)))
        ) / 5) =
			(SELECT
				MAX((
                (CAST(NU_NOTA_CH AS DECIMAL(10,2))) +
				(CAST(NU_NOTA_CN AS DECIMAL(10,2))) +
				(CAST(NU_NOTA_LC AS DECIMAL(10,2))) +
				(CAST(NU_NOTA_MT AS DECIMAL(10,2))) +
				(CAST(NU_NOTA_REDACAO AS DECIMAL(10,2)))
				) / 5) FROM microdados_enem_2020.microdados_enem_2020)
        
	GROUP BY 
    CO_MUNICIPIO_ESC,
	NO_MUNICIPIO_ESC,
	CO_UF_ESC,
	SG_UF_ESC ,
	TP_DEPENDENCIA_ADM_ESC,
	TP_LOCALIZACAO_ESC,
	TP_SIT_FUNC_ESC,
	TP_ESCOLA;
	
/* 2- QUAL O ALUNO COM A MAIOR MEDIA DE NOTAS E QUAL É A MEDIA*/
	SELECT
		NU_INSCRICAO,
		MAX((
			(CAST(NU_NOTA_CH AS DECIMAL(10,2))) +
			(CAST(NU_NOTA_CN AS DECIMAL(10,2))) +
			(CAST(NU_NOTA_LC AS DECIMAL(10,2))) +
			(CAST(NU_NOTA_MT AS DECIMAL(10,2))) +
			(CAST(NU_NOTA_REDACAO AS DECIMAL(10,2)))
			) / 5) AS MAIOR_MEDIA
	FROM 
	microdados_enem_2020.microdados_enem_2020
    WHERE
		((
        (CAST(NU_NOTA_CH AS DECIMAL(10,2))) +
		(CAST(NU_NOTA_CN AS DECIMAL(10,2))) +
        (CAST(NU_NOTA_LC AS DECIMAL(10,2))) +
        (CAST(NU_NOTA_MT AS DECIMAL(10,2))) +
        (CAST(NU_NOTA_REDACAO AS DECIMAL(10,2)))
        ) / 5) =
			(SELECT
				MAX((
                (CAST(NU_NOTA_CH AS DECIMAL(10,2))) +
				(CAST(NU_NOTA_CN AS DECIMAL(10,2))) +
				(CAST(NU_NOTA_LC AS DECIMAL(10,2))) +
				(CAST(NU_NOTA_MT AS DECIMAL(10,2))) +
				(CAST(NU_NOTA_REDACAO AS DECIMAL(10,2)))
				) / 5) FROM microdados_enem_2020.microdados_enem_2020)
        
	GROUP BY NU_INSCRICAO;

/* 3- QUAL A MÉDIA GERAL*/
SELECT
		ROUND((
        (sum(CONVERT(NU_NOTA_CH, DECIMAL)) / 
        (SELECT COUNT(TP_PRESENCA_CH) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_CH = 1) ) +
		(sum(CONVERT(NU_NOTA_CN, DECIMAL)) /
        (SELECT COUNT(TP_PRESENCA_CN) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_CN = 1) )+
        (sum(CONVERT(NU_NOTA_LC, DECIMAL)) /
        (SELECT COUNT(TP_PRESENCA_LC) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_LC = 1)) +
        (sum(CONVERT(NU_NOTA_MT, DECIMAL)) /
        (SELECT COUNT(TP_PRESENCA_MT) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_MT = 1)) +
        (sum(CONVERT(NU_NOTA_REDACAO, DECIMAL))/
         (SELECT COUNT(TP_PRESENCA_CH) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_CH = 1) ) 
        ), 2) / 5 AS MEDIA_GERAL
FROM 
	microdados_enem_2020.microdados_enem_2020;
    

/* 5- QUAL o número total de inscritos*/
SELECT
	count(NU_INSCRICAO) AS 'Numero Total de Inscritos'
FROM 
	microdados_enem_2020.microdados_enem_2020;

/* 6- QUAL A MÉDIA POR disciplina*/
SELECT
	(sum(convert(NU_NOTA_CH, decimal)) / 
		(SELECT COUNT(TP_PRESENCA_CH) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_CH = 1) ) AS 'Media Notas Ciências Humanas',
	(sum(convert(NU_NOTA_CN, decimal)) / 
		(SELECT COUNT(TP_PRESENCA_CN) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_CN = 1) ) AS 'Media Notas Ciências da Natureza',
	(sum(convert(NU_NOTA_LC, decimal)) / 
		(SELECT COUNT(TP_PRESENCA_LC) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_LC = 1))AS 'Media Notas Linguagens e Códigos',
	(sum(convert(NU_NOTA_MT, decimal)) / 
		(SELECT COUNT(TP_PRESENCA_MT) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_MT = 1)) AS 'Media Notas Matemática',
	(sum(convert(NU_NOTA_REDACAO, decimal)) / 
		(SELECT COUNT(TP_PRESENCA_CH) FROM microdados_enem_2020.microdados_enem_2020 
			WHERE TP_PRESENCA_CH = 1) )  AS 'Media Notas Redação'
FROM 
	microdados_enem_2020.microdados_enem_2020;
    


/* 7- QUAL A MÉDIA POR SEXO*/
    SELECT
	CASE
		TP_SEXO
		WHEN 'M' THEN 'MASCULINO'
		ELSE 'FEMININO'
    END AS TIPO_SEXO,
		((sum(CAST(NU_NOTA_CH AS DECIMAL(10,2))) +
		sum(CAST(NU_NOTA_CN AS DECIMAL(10,2))) +
        sum(CAST(NU_NOTA_LC AS DECIMAL(10,2))) +
        sum(CAST(NU_NOTA_MT AS DECIMAL(10,2))) +
        sum(CAST(NU_NOTA_REDACAO AS DECIMAL(10,2))))
        / count(NU_INSCRICAO) /5)AS MEDIA_SEXO
FROM 
	microdados_enem_2020.microdados_enem_2020
group by 
	TP_SEXO;
/* 8- QUAL A MÉDIA POR ETNIA*/	
	SELECT
	CASE
		TP_COR_RACA
        WHEN 1	 THEN 'Branca'
		WHEN 2	 THEN 'Preta'
		WHEN 3	 THEN 'Parda'
		WHEN 4	 THEN 'Amarela'
		WHEN 5	 THEN 'Indígena'
        ELSE 'Não declarado'
    END AS TIPO_ETNIA,
	    ((sum(CAST(NU_NOTA_CH AS DECIMAL(10,2))) +
		sum(CAST(NU_NOTA_CN AS DECIMAL(10,2))) +
        sum(CAST(NU_NOTA_LC AS DECIMAL(10,2))) +
        sum(CAST(NU_NOTA_MT AS DECIMAL(10,2))) +
        sum(CAST(NU_NOTA_REDACAO AS DECIMAL(10,2))))
        / count(NU_INSCRICAO)/5) AS MEDIA_ETNIA
FROM 
	microdados_enem_2020.microdados_enem_2020
group by 
	TP_COR_RACA;
	