-- Gerar inteiros no intervalo de -50 a 50.

-- FOR
DO $$
DECLARE
		i INT;
		numero INT;
		contador INT := 0;
BEGIN
	FOR i IN 1..6 LOOP
		numero := valor_aleatorio_entre(-50,50);
		RAISE NOTICE ' %',numero;
		IF numero > 0 THEN
			contador := contador + 1;
		END IF;	
	END LOOP;
	  IF contador > 2 THEN
        RAISE NOTICE '% Números positivos', contador;
    ELSIF contador = 1 THEN
        RAISE NOTICE '1 Número positivo';
    ELSE
        RAISE NOTICE 'Nenhum positivo';
    END IF;
END;
$$

-- WHILE
DO $$
DECLARE
		i INT := 0;
		numero INT;
		contador INT := 0;
BEGIN
	WHILE i < 6 loop
		numero := valor_aleatorio_entre(-50,50);
		RAISE NOTICE '%',numero;
		IF numero > 0 THEN
			contador := contador + 1;
		END IF;
		i := i + 1;
	END LOOP;
	IF contador > 2 THEN
		RAISE NOTICE '% Números positivos', contador;
	ELSIF contador = 1 THEN
		RAISE NOTICE '1 Número positivo';
	ELSE
		RAISE NOTICE 'Nenhum positivo';
 END IF;
END;
$$;

--FOREACH
DO $$
DECLARE
	numeros INTEGER[] := ARRAY[
        valor_aleatorio_entre(-50, 50),
        valor_aleatorio_entre(-50, 50),
        valor_aleatorio_entre(-50, 50),
        valor_aleatorio_entre(-50, 50),
        valor_aleatorio_entre(-50, 50),
		valor_aleatorio_entre(-50, 50)];
	numero INT;
	contador INT := 0;
	i INT := 1;
BEGIN
	FOREACH numero IN ARRAY numeros LOOP
		RAISE NOTICE '%',numero;
	IF numero > 0 THEN
		contador := contador + 1;
	END IF;
	i := i + 1;
	END LOOP;
	IF contador > 2 THEN
	 	RAISE NOTICE '% Números positivos', contador;
     ELSIF contador = 1 THEN
	 	RAISE NOTICE '1 Número positivo';
	 ELSE
	 	RAISE NOTICE 'Nenhum positivo';
	 END IF;
END;
$$

-- Gerar inteiros no intervalo de 20 a 50.

-- LOOP
DO $$
DECLARE
    x INT := valor_aleatorio_entre(20, 50);
    y INT := valor_aleatorio_entre(20, 50);
    soma INT := 0;
    menor INT;
    maior INT;
    i INT;
BEGIN
    menor := LEAST(x, y) + 1;		-- Determina limites(menores)
    maior := GREATEST(x, y) - 1;	-- Determina limites(maiores)

    i := menor;
    LOOP
        EXIT WHEN i > maior;
        IF i % 2 != 0 THEN
            soma := soma + i;
        END IF;
        i := i + 1;
    END LOOP;

    RAISE NOTICE 'X: %, Y: %, Soma dos ímpares: %', x, y, soma;
END;
$$

-- WHILE
DO $$
DECLARE
    x INT := valor_aleatorio_entre(20, 50);
    y INT := valor_aleatorio_entre(20, 50);
    soma INT := 0;
    i INT;
    menor INT;
    maior INT;
BEGIN
    menor := LEAST(x, y) + 1;
    maior := GREATEST(x, y) - 1;

    i := menor;
    WHILE i <= maior LOOP
        IF i % 2 != 0 THEN
            soma := soma + i;
        END IF;
        i := i + 1;
    END LOOP;

    RAISE NOTICE 'X: %, Y: %, Soma dos ímpares: %', x, y, soma;
END;
$$