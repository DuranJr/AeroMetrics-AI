CREATE TEMPORARY VIEW vra_marcado AS
WITH aerodromo AS (
  SELECT DISTINCT icao FROM voebem.silver.aerodromos
  WHERE icao IS NOT NULL AND icao <> ''
),
empresa AS (
  SELECT DISTINCT icao FROM voebem.silver.empresas
  WHERE icao IS NOT NULL AND icao <> ''
)
SELECT
  v.*,
  (ao.icao IS NOT NULL) AS origem_no_cadastro,
  (ad.icao IS NOT NULL) AS destino_no_cadastro,
  (em.icao IS NOT NULL) AS empresa_no_cadastro
FROM voebem.silver.vra v
LEFT JOIN aerodromo ao ON v.icao_origem  = ao.icao
LEFT JOIN aerodromo ad ON v.icao_destino = ad.icao
LEFT JOIN empresa   em ON v.icao_empresa = em.icao;