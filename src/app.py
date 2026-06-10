from fastapi import FastAPI

app = FastAPI(
    title="Food-delivery-application",
    version ="0.1.0",
    description="A food delivery application build with FastAPI framework"
)

@app.get("/health")
async def health():
    "Health check for Application load balancer(ALB) target group"
    return {"status": "healthy", "service": "food-delivery-backend"}

@app.get("/")
async def root():
    return {"mesage": "Welcome to Food delivery application"}

# from src.modules.auth.router import auth_router
# app.include_router(auth_router, prefix="/auth", tags=["Authentication"])





