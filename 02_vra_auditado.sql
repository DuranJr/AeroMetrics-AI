CREATE LIVE VIEW vra_auditado (
  -- === completude ===
  CONSTRAINT horarios_previstos_presentes
    EXPECT (partida_prevista IS NOT NULL AND chegada_prevista IS NOT NULL),

  CONSTRAINT situacao_voo_conhecida
    EXPECT (situacao_voo IN ('REALIZADO', 'CANCELADO')),

  -- === coerencia temporal (NULL aprovado explicitamente) ===
  CONSTRAINT chegada_prevista_depois_da_partida_prevista
    EXPECT (partida_prevista IS NULL OR chegada_prevista IS NULL
            OR chegada_prevista > partida_prevista),

  CONSTRAINT chegada_real_depois_da_partida_real
    EXPECT (partida_real IS NULL OR chegada_real IS NULL
            OR chegada_real > partida_real),

  -- === faixa plausivel: -2h de antecipacao a 24h de atraso ===
  CONSTRAINT atraso_partida_plausivel
    EXPECT (atraso_partida_min IS NULL
            OR atraso_partida_min BETWEEN -120 AND 1440),

  CONSTRAINT atraso_chegada_plausivel
    EXPECT (atraso_chegada_min IS NULL
            OR atraso_chegada_min BETWEEN -120 AND 1440),

  -- === integridade referencial (a flag vem do passo 1) ===
  CONSTRAINT empresa_no_cadastro_anac
    EXPECT (empresa_no_cadastro),

  CONSTRAINT aeroporto_origem_no_cadastro_anac
    EXPECT (origem_no_cadastro),

  CONSTRAINT aeroporto_destino_no_cadastro_anac
    EXPECT (destino_no_cadastro)
)
COMMENT 'Contrato de dados de silver.vra. Nove expectations, todas em modo warn:
 medem qualidade sem descartar linha. A silver segue com a contagem original.'
AS SELECT * FROM vra_marcado;