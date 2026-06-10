from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    model_config= SettingsConfigDict(env_file= ".env", extra = "ignore")

    # Application
    app_env:str = "local"
    app_port:int = 8000
    log_level:str = "INFO"

    # Database
    database_url:str = ""

    # Redis
    redis_url:str = ""
    celery_broker_url:str = ""

    #JWT (local_default; prod = Secret Manager via env var)
    jwt_secret:str = 
    jwt_algorithm:str = 
    jwt_access_token_expiry_minutes:int = 
    jwt_refresh_token_expiry_days:int = 

    # AWS 
    aws_region:str = ""
    s3_images_bucket:str = ""
    s3_uploads_bucker:str = ""

    # Sentry (set via env in deployed envs)
    sentry_dsn:str = ""
    sentry_environment:str = ""

settings = Settings()






