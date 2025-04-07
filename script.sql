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
