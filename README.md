# Zomato Data Engineering

A local data-engineering project combining Snowflake, dbt, Apache Airflow, and two Streamlit AI apps for natural-language SQL and review search.

## Project Layout

- `airflow/`: Docker Compose setup and the `zomato_batch` orchestration DAG.
- `zomato/`: dbt models, tests, seeds, and transformations.
- `ai/`: Streamlit apps and review-enrichment script.
- `data/`: local source CSVs; intentionally excluded from Git because the files are large. Upload the source data to your approved storage/stage separately.

## Local Setup

Use Python 3.12 or newer and Docker Compose. Create local environment files from the examples and replace every placeholder with credentials stored securely on your machine:

```powershell
Copy-Item .\ai\.env.example .\ai\.env
Copy-Item .\airflow\.env.example .\airflow\.env
```

The AI apps use Snowflake key-pair authentication and an OpenAI API key. Airflow uses the Snowflake key mounted at `SNOWFLAKE_PRIVATE_KEY_HOST_PATH`. Never commit `.env` files, private keys, dbt profiles with credentials, or real API keys.

Run the text-to-SQL app:

```powershell
Set-Location .\ai
streamlit run .\text_to_sql.py
```

Run the review chat app:

```powershell
Set-Location .\ai
streamlit run .\rag_chat.py
```

Start local Airflow from the `airflow/` directory:

```powershell
docker-compose up -d
```

Open Airflow at `http://localhost:8080`. Starting the containers does not trigger a DAG run; use the Airflow UI or the configured schedule.

## Deployment Notes

The included Compose setup is for local development. For hosted use, deploy Airflow and Streamlit separately, use a dedicated Snowflake service identity with least-privilege grants, and inject secrets through the hosting platform's secret manager. Do not copy developer `.env` files or laptop paths into production.