#!/bin/bash
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RESET='\033[0m'

printf "\n${CYAN}📁 Preparando o ambiente para o dataset COCO 2017...${RESET}\n\n"

# Diretório dinâmico 
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Criando uma pasta dedicada 
mkdir -p "$SCRIPT_DIR/coco_2017"
cd "$SCRIPT_DIR/coco_2017"

printf "${BLUE}⬇️  Baixando Anotações (Train/Val 2017) [~241 MB]...${RESET}\n"
wget -c http://images.cocodataset.org/annotations/annotations_trainval2017.zip

# printf "\n${BLUE}⬇️  Baixando Imagens de Validação (Val 2017) [~1 GB]...${RESET}\n"
# wget -c http://images.cocodataset.org/zips/val2017.zip

printf "\n${BLUE}⬇️  Baixando Imagens de Treinamento (Train 2017) [~18 GB]...${RESET}\n"
printf "${YELLOW}⚠️  Aviso: Este download é pesado e pode demorar. A flag -c garante que ele pode ser retomado em caso de queda.${RESET}\n\n"
wget -c http://images.cocodataset.org/zips/train2017.zip

printf "\n${YELLOW}⏳ Extraindo arquivos... Isso vai levar um tempo, vá tomar um café! ☕${RESET}\n\n"

printf "Extraindo anotações...\n"
unzip -q annotations_trainval2017.zip

# printf "Extraindo imagens de validação...\n"
# unzip -q val2017.zip

printf "Extraindo imagens de treinamento...\n"
unzip -q train2017.zip

printf "\n${YELLOW}🧹 Removendo arquivos compactados originais para liberar espaço...${RESET}\n\n"
rm *.zip

printf "\n${GREEN}✅ Download e extração do COCO 2017 concluídos com sucesso em $SCRIPT_DIR/coco_2017!${RESET}\n\n"