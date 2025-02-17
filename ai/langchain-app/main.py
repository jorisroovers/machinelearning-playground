from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from langchain import LangChain

app = FastAPI()

class ChatRequest(BaseModel):
    user_input: str

class ChatResponse(BaseModel):
    response: str

langchain = LangChain()

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    try:
        response = langchain.process_input(request.user_input)
        return ChatResponse(response=response)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
