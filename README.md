<img width="1671" height="941" alt="ChatGPT Image 21 de set  de 2026, 13_53_53" src="https://github.com/user-attachments/assets/0385397a-6fa8-4739-90f6-95cc7246b3c0" />


# AeroMetrics AI

Agente de IA para análise de pontualidade, atrasos e cancelamentos de voos no Brasil, utilizando dados públicos do VRA (Voo Regular Ativo) da ANAC entre agosto de 2025 e julho de 2026.

## Sobre o projeto

O projeto foi construído no Databricks, usando um Genie Agent conectado a um pipeline de dados estruturado em camadas (arquitetura medalhão), que trata os dados brutos da ANAC até chegar em uma base pronta para consultas em linguagem natural.

## Estrutura do pipeline

- **Bronze** (`bronze_vra`, `bronze_referencias`): ingestão dos dados brutos do VRA e das tabelas de referência da ANAC.
- **Silver** (`silver_espelho`): limpeza e padronização dos dados.
- **Gold** (`governanca_gold`): consolidação e regras de governança para os dados usados pelo agente.
- **SQL** (`01_vra_marcado`, `02_vra_auditado`, `03_vra_quarentena`): etapas de marcação, auditoria e quarentena de registros.

## O que o agente responde

- Distribuição de atrasos de decolagem
- Volume mensal de voos
- Distribuição de voos por companhia aérea
- Estrutura e relação entre as tabelas do pipeline

## Tecnologias

Databricks, SQL, Python, Genie Agents

---

*Projeto em desenvolvimento como parte de estudos e portfólio pessoal.*    

## Créditos

Projeto desenvolvido com base no curso Imersão Engenharia de Dados com IA da Alura, adaptado e implementado por mim.
