sudo apt update && sudo apt install --yes lshw

if command -v ollama &> /dev/null
then
    echo "ollama command is available"
else
    echo "ollama command is not available : installing it "
    curl -fsSL https://ollama.com/install.sh | sh
    echo "ollama : end of install "
fi

cd ~/work/ollama-langchain-notebook/ 
uv venv .venv
source .venv/bin/activate
uv pip install notebook ipykernel
uv pip install -r requirements.txt
python -m ipykernel install --user --name=my-uv-env --display-name "Python (uv)"

./load_run_ollama.sh &