# Schema-Compliant-Data-Integration-System-using-the-LLM-Mistral

## Overview
This framework utilises the ability of GenAI, LLMs typically, to automate the process of data entry, integration and onboarding as opposed to traditional ETL processes. 
The model receives the input data in JSON format to be transformed and the schema of the company's database as a guide to the LLM, leveraging the contextual and generative ability of LLMs to produce an output in JSON format that is 100% schema compliant.
This framework heralds privacy as a core value, therefore, all hosting and implementation was done locally, on a Local PC. The language model runs locally and is not hosted to the cloud.

## How To Run
First you need to set up  the necessary Python packages and pull down the Mistral model for Ollama.

The following was run in the terminal:
1. Install required Python libraries:
```bash
$ pip install requests pydantic

2. Install Ollama if not already done (macOS example):
```bash
$ brew install ollama

3. Pull the Mistral model locally:
```bash
$ ollama pull mistral

4. Start the Ollama server (in a separate terminal):
```bash
$ ollama serve --model mistral

Once the above is running on port 11434, the subsequent notebook cells can talk to the local LLM.

5. Install necessary libraries
```bash
$ pip install requests pydantic 
