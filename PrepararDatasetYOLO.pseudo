ALGORITMO PrepararDatasetYOLO

// ==========================================
// FASE 1: Inicialização e Regras de Negócio
// ==========================================
INICIO
    DEFINIR Meta_Balanceamento = 3000
    DEFINIR Classes_Alvo = [Pessoa, Bicicleta, Carro, Moto, Ônibus]
    
    LIMPAR E CRIAR diretórios base ("Yolo_dataset/images", "Yolo_dataset/labels")

    // ==========================================
    // FASE 2: Mineração Lógica (Algoritmo Guloso na RAM)
    // ==========================================
    CARREGAR arquivo "annotations.json" NA MEMÓRIA
    
    INICIALIZAR Lista_Imagens_Selecionadas = VAZIO
    INICIALIZAR Contadores_Classes = ZEROS

    // O Cérebro do algoritmo de balanceamento
    PARA CADA Classe EM Classes_Alvo FACA:
        PARA CADA Imagem NO JSON FACA:
            
            // Freio de mão: Meta atingida?
            SE Contadores_Classes[Classe] >= Meta_Balanceamento ENTAO:
                INTERROMPER busca para esta Classe
            
            // Se a foto serve e ainda não foi pega
            SE Imagem CONTÉM a Classe ATUAL E Imagem NÃO ESTÁ NA Lista_Imagens_Selecionadas ENTAO:
                ADICIONAR Imagem À Lista_Imagens_Selecionadas
                
                // Como as fotos têm múltiplas classes, atualizamos todos os contadores
                PARA CADA Objeto NA Imagem FACA:
                    SE Objeto PERTENCE A Classes_Alvo ENTAO:
                        INCREMENTAR Contadores_Classes[Objeto]
                FIM PARA
            FIM SE
            
        FIM PARA
    FIM PARA

    // ==========================================
    // FASE 3: Extração Física e Conversão Matemática (HD)
    // ==========================================
    PARA CADA Imagem NA Lista_Imagens_Selecionadas FACA:
        COPIAR arquivo de imagem (.jpg) PARA diretório "images"
        CRIAR arquivo de texto (.txt) NO diretório "labels"
        
        PARA CADA Objeto NA Imagem FACA:
            SE Objeto PERTENCE A Classes_Alvo ENTAO:
                // Normaliza de Pixels Absolutos para Porcentagem (0 a 1)
                Coordenadas_YOLO = CONVERTER_COCO_YOLO(Objeto.Coordenadas_Absolutas)
                
                ESCREVER ID_da_Classe e Coordenadas_YOLO NO arquivo de texto (.txt)
            FIM SE
        FIM PARA
    FIM PARA

    // ==========================================
    // FASE 4: Fatiamento Estrutural e MLOps
    // ==========================================
    DEFINIR Semente_Matemática = 42
    EMBARALHAR Lista_Imagens_Selecionadas usando a Semente
    
    // Divisão 80/10/10
    SEPARAR 80% das imagens PARA pasta "train"
    SEPARAR 10% das imagens PARA pasta "val"
    SEPARAR 10% das imagens PARA pasta "test"
    
    GERAR arquivo "data.yaml" COM os caminhos das pastas e quantidade de classes
    
    COMPACTAR diretório "Yolo_dataset" PARA arquivo ".zip"
    
FIM ALGORITMO