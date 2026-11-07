# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261106212220607), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Versionado de Infraestructura de Servicio de Notificaciones con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial de Terraform — objetivo: Configurar el entorno de Terraform para aprovisionar la infraestructura del servicio de notificaciones. — entregable (NO resolver): Archivo de configuración de Terraform inicial que incluye proveedores y recursos básicos.
- Fase 2: Aprovisionamiento de la Red — objetivo: Aprovisionar la red necesaria para el servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Configuración de Terraform que aprovisiona la red del servicio de notificaciones y documentación de los pasos y decisiones tomadas.
- Fase 3: Aprovisionamiento del Cómputo — objetivo: Aprovisionar el cómputo necesario para el servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Configuración de Terraform que aprovisiona el cómputo del servicio de notificaciones y documentación de los pasos y decisiones tomadas.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: variables.tf ===
# Declaración de variables globales utilizadas en la configuración de Terraform.
# Estas variables serán utilizadas en los módulos de red y cómputo.

variable "region" {
  description = "La región de AWS donde se aprovisionará la infraestructura."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "El ambiente en el que se desplegará la infraestructura (dev, prod, etc.)."
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "El bloque CIDR para la VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "El tipo de instancia EC2 para el servicio de notificaciones."
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "El ID de la AMI para las instancias EC2."
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
}

variable "key_name" {
  description = "El nombre de la clave SSH para acceder a las instancias."
  type        = string
  default     = "notifications-key"
}

variable "min_size" {
  description = "El tamaño mínimo del grupo de autoescalado."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "El tamaño máximo del grupo de autoescalado."
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "La capacidad deseada del grupo de autoescalado."
  type        = number
  default     = 2
}

// === ARCHIVO: providers.tf ===
# Configuración de los proveedores de Terraform con versiones flexibles.
# Este archivo define los proveedores requeridos y sus versiones.

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del proveedor AWS.
provider "aws" {
  region = var.region

  # Configuración de tags por defecto para todos los recursos.
  default_tags {
    tags = {
      Environment = var.environment
      Terraform   = "true"
      Service     = "notifications"
    }
  }
}

# Validación de la región proporcionada.
locals {
  valid_regions = [
    "us-east-1", "us-west-1", "us-west-2", "eu-west-1",
    "eu-central-1", "ap-southeast-1", "ap-northeast-1"
  ]

  # Validación de que la región proporcionada es válida.
  region_validation = contains(local.valid_regions, var.region) ? null : file("ERROR: La región proporcionada no es válida.")
}

# Validación del ambiente proporcionado.
locals {
  valid_environments = ["dev", "staging", "prod"]

  # Validación de que el ambiente proporcionado es válido.
  environment_validation = contains(local.valid_environments, var.environment) ? null : file("ERROR: El ambiente proporcionado no es válido.")
}

// === ARCHIVO: modules/network/variables.tf ===
# Declaración de variables específicas del módulo de red.
# Estas variables serán utilizadas para configurar la red del servicio de notificaciones.

variable "vpc_cidr" {
  description = "El bloque CIDR para la VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas."
  type        = list(string)
}

variable "environment" {
  description = "El ambiente en el que se desplegará la infraestructura (dev, prod, etc.)."
  type        = string
}

variable "region" {
  description = "La región de AWS donde se aprovisionará la infraestructura."
  type        = string
}

// === ARCHIVO: modules/compute/variables.tf ===
# Declaración de variables específicas del módulo de cómputo.
# Estas variables serán utilizadas para configurar el cómputo del servicio de notificaciones.

variable "instance_type" {
  description = "El tipo de instancia EC2 para el servicio de notificaciones."
  type        = string
}

variable "ami_id" {
  description = "El ID de la AMI para las instancias EC2."
  type        = string
}

variable "key_name" {
  description = "El nombre de la clave SSH para acceder a las instancias."
  type        = string
}

variable "min_size" {
  description = "El tamaño mínimo del grupo de autoescalado."
  type        = number
}

variable "max_size" {
  description = "El tamaño máximo del grupo de autoescalado."
  type        = number
}

variable "desired_capacity" {
  description = "La capacidad deseada del grupo de autoescalado.
  type        = number
}

variable "vpc_id" {
  description = "El ID de la VPC donde se desplegarán las instancias."
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes donde se desplegarán las instancias."
  type        = list(string)
}

variable "environment" {
  description = "El ambiente en el que se desplegará la infraestructura (dev, prod, etc.)."
  type        = string
}

variable "security_group_id" {
  description = "El ID del grupo de seguridad para las instancias."
  type        = string
}

// === ARCHIVO: main.tf ===
terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Proveedor de AWS configurado desde providers.tf
provider "aws" {
  region = var.aws_region
}

# Módulo de red para el servicio de notificaciones
module "network" {
  source = "./modules/network"

  environment           = var.environment
  vpc_cidr_block        = var.vpc_cidr_block
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
}

# Módulo de compute para el servicio de notificaciones
module "compute" {
  source = "./modules/compute"

  environment           = var.environment
  vpc_id                = module.network.vpc_id
  private_subnet_ids    = module.network.private_subnet_ids
  instance_type         = var.instance_type
  ami_id                = var.ami_id
  min_size              = var.min_size
  max_size              = var.max_size
  desired_capacity      = var.desired_capacity
}

// === ARCHIVO: outputs.tf ===
# Outputs del módulo de red
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.network.private_subnet_ids
}

# Outputs del módulo de compute
output "launch_template_id" {
  description = "ID del Launch Template"
  value       = module.compute.launch_template_id
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.asg_name
}

output "asg_arn" {
  description = "ARN del Auto Scaling Group"
  value       = module.compute.asg_arn
}

// === ARCHIVO: .gitignore ===
# Terraform
.terraform/
*.tfstate
*.tfstate.backup
*.tfvars
*.tfplan
*.lock*

# Terraform directories
.terraform.lock.hcl

# IDE
.idea/
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Certificados y secretos (no deben estar en repo)
*.pem
*.key
credentials.json
secrets/

// === ARCHIVO: README.md ===
# Versionado de Infraestructura de Servicio de Notificaciones con Terraform

Este proyecto contiene la definición de infraestructura como código para el servicio de notificaciones, aprovisionando los recursos de red y cómputo necesarios mediante Terraform.

## Estructura del Proyecto

```
.
├── environments/                 # Configuraciones por ambiente
│   ├── dev/
│   │   └── terraform.tfvars     # Variables para desarrollo
│   └── prod/
│       └── terraform.tfvars     # Variables para producción
├── modules/                      # Módulos reutilizables
│   ├── network/                 # Módulo de red
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── compute/                 # Módulo de cómputo
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── scripts/                      # Scripts auxiliares
│   └── healthcheck.sh           # Script de verificación de salud
├── main.tf                       # Configuración principal
├── outputs.tf                    # Outputs del root module
├── providers.tf                  # Configuración de providers
├── variables.tf                  # Variables del root module
├── .gitignore                    # Archivos ignorados por Git
└── README.md                     # Este archivo
```

## Requisitos Previos

- Terraform >= 1.5 instalado en el sistema
- Credenciales de AWS configuradas (variables de entorno, archivo de credenciales o perfil)
- Acceso a la consola de AWS con permisos para crear recursos

## Configuración Inicial

### 1. Inicializar Terraform

Ejecutar el siguiente comando para inicializar el backend y descargar los proveedores:

```bash
terraform init
```

Para ambientes que no usan backend remoto, usar:

```bash
terraform init -backend=false
```

### 2. Validar la Configuración

Verificar que los archivos de Terraform son sintácticamente correctos:

```bash
terraform validate
```

### 3. Planificar los Cambios

Para ver los recursos que se crearán sin aplicarlos:

```bash
terraform plan
```

Para un ambiente específico, especificar el archivo de variables:

```bash
terraform plan -var-file=environments/dev/terraform.tfvars
```

## Despliegue de Infraestructura

### Desarrollo

```bash
cd environments/dev
terraform init -backend=false
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

### Producción

```bash
cd environments/prod
terraform init -backend=false
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Verificación del Despliegue

Después de aplicar los recursos, ejecutar el script de healthcheck para verificar que la infraestructura está operativa:

```bash
bash scripts/healthcheck.sh
```

## Módulos

### Módulo de Red (modules/network)

Este módulo aprovisiona los componentes de red necesarios:
- VPC con CIDR configurable
- Subnets públicas y privadas
- Internet Gateway
- Tablas de enrutamiento
- NAT Gateways para acceso a internet desde subnets privadas

### Módulo de Cómputo (modules/compute)

Este módulo aprovisiona los recursos de cómputo:
- Auto Scaling Group
- Launch Template
- Balanceador de carga (Application Load Balancer)
- Security Groups para el servicio

## Outputs

Los siguientes valores se exponen después del despliegue:
- IDs de VPC y subnets
- ARN del balanceador de carga
- ARN del Auto Scaling Group
- URLs de acceso al servicio

## Limpieza de Recursos

Para destruir todos los recursos creados:

```bash
terraform destroy -var-file=environments/dev/terraform.tfvars
```

**Advertencia**: Esta acción eliminará todos los recursos de AWS creados por Terraform. Asegurarse de que no hay datos importantes antes de ejecutar.

## Mejores Prácticas

1. **Gestión de estados**: En producción, configurar un backend remoto (S3 con DynamoDB para locking)
2. **Secrets**: Nunca almacenar secretos en archivos tfvars versionados. Usar AWS Secrets Manager o Parameter Store
3. **Control de versiones**: Los archivos .tf deben estar versionados; los archivos .tfstate no
4. **Documentación**: Mantener este README actualizado con cambios en la infraestructura
5. **Pipeline CI/CD**: Integrar Terraform en el pipeline de despliegue con análisis estático (tfsec, checkov)

## Troubleshooting

### Error de autenticación con AWS

Verificar que las credenciales están configuradas correctamente:

```bash
aws sts get-caller-identity
```

### Error de versión de Terraform

Asegurarse de tener Terraform 1.5 o superior instalado:

```bash
terraform version
```

### Conflictos de estado

Si hay conflictos de estado en un entorno compartido, verificar que no hay múltiples ejecuciones simultáneas de Terraform.

// === ARCHIVO: modules/network/main.tf ===
terraform {
  required_version = ">= 1.5"
}

# ------------------------------------------------------------
# Configuración de red para el servicio de notificaciones
# Módulo que aprovisiona VPC, subredes y recursos de red
# ------------------------------------------------------------

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "availability_zones" {
  description = "Zonas de disponibilidad para las subredes"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetado"
  type        = string
}

# VPC del servicio de notificaciones
resource "aws_vpc" "notification_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.project_name}-vpc-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Internet Gateway para acceso externo
resource "aws_internet_gateway" "notification_igw" {
  vpc_id = aws_vpc.notification_vpc.id

  tags = {
    Name        = "${var.project_name}-igw-${var.environment}"
    Environment = var.environment
  }
}

# Tabla de rutas pública
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.notification_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.notification_igw.id
  }

  tags = {
    Name        = "${var.project_name}-public-rt-${var.environment}"
    Environment = var.environment
  }
}

# Subredes públicas
resource "aws_subnet" "public_subnets" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.notification_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-public-subnet-${count.index + 1}-${var.environment}"
    Environment = var.environment
    Type        = "public"
  }
}

# Asociación de subredes públicas con tabla de rutas
resource "aws_route_table_association" "public_associations" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

// === ARCHIVO: modules/network/outputs.tf ===
# ------------------------------------------------------------
# Outputs del módulo de red
# Exponen IDs y ARNs de recursos creados para consumo
# ------------------------------------------------------------

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.notification_vpc.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.notification_vpc.cidr_block
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.notification_igw.id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public_subnets[*].id
}

output "public_subnet_arns" {
  description = "ARNs de las subredes públicas"
  value       = aws_subnet.public_subnets[*].arn
}

output "route_table_public_id" {
  description = "ID de la tabla de rutas pública"
  value       = aws_route_table.public_rt.id
}

// === ARCHIVO: modules/compute/main.tf ===
terraform {
  required_version = ">= 1.5"
}

# ------------------------------------------------------------
# Configuración de cómputo para el servicio de notificaciones
# Módulo que aprovisiona instancias EC2 y grupos de seguridad
# ------------------------------------------------------------

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.medium"
}

variable "ami_id" {
  description = "ID de la AMI para las instancias"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se aprovisionarán las instancias"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subredes donde se aprovisionarán las instancias"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetado"
  type        = string
}

variable "key_name" {
  description = "Nombre del par de claves SSH"
  type        = string
  default     = ""
}

variable "instance_count" {
  description = "Número de instancias a crear"
  type        = number
  default     = 2
}

# Grupo de seguridad para el servicio de notificaciones
resource "aws_security_group" "notification_sg" {
  name        = "${var.project_name}-sg-${var.environment}"
  description = "Grupo de seguridad para el servicio de notificaciones"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    description = "Salida a Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-sg-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Instancias EC2 para el servicio de notificaciones
resource "aws_instance" "notification_instances" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[count.index % length(var.subnet_ids)]

  vpc_security_group_ids = [aws_security_group.notification_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.project_name}-instance-${count.index + 1}-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Grupo de Auto Scaling
resource "aws_launch_template" "notification_lt" {
  name_prefix   = "${var.project_name}-lt-${var.environment}"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.notification_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.project_name}-lt-${var.environment}"
      Environment = var.environment
      Project     = var.project_name
    }
  }
}

// === ARCHIVO: modules/compute/outputs.tf ===
# Outputs del módulo de cómputo
# Superficie de práctica: completar con los outputs de los recursos creados

# Output: ID de la instancia EC2
output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.notification_service.id
}

# Output: IP privada de la instancia
output "private_ip" {
  description = "IP privada de la instancia"
  value       = aws_instance.notification_service.private_ip
}

# Output: IP pública de la instancia (si aplica)
output "public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.notification_service.public_ip
}

// === ARCHIVO: environments/dev/terraform.tfvars ===
# Valores deVariables para el ambiente de desarrollo
# Configuración específica para pruebas y desarrollo

environment = "dev"

# Región de AWS para desarrollo
aws_region = "us-east-1"

# Tipo de instancia para desarrollo (más económica)
instance_type = "t3.micro"

# Configuración de red - IDs de VPC y subnets creadas en el módulo network
vpc_id     = "vpc-xxxxxxxx"
subnet_ids = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]

# Configuración del servicio de notificaciones
service_name = "notification-service"
environment_name = "development"

# Configuración de seguridad
allowed_cidr_blocks = ["10.0.0.0/16"]

# Tags específicos para desarrollo
common_tags = {
  Environment = "development"
  Project     = "notification-service"
  ManagedBy   = "terraform"
}

// === ARCHIVO: environments/prod/terraform.tfvars ===
# Valores de variables para el ambiente de producción
# Configuración con alta disponibilidad y mayor capacidad

environment = "prod"

# Región de AWS para producción
aws_region = "us-east-1"

# Tipo de instancia para producción (mayor capacidad)
instance_type = "t3.medium"

# Configuración de red - IDs de VPC y subnets en producción
vpc_id     = "vpc-yyyyyyyy"
subnet_ids = ["subnet-zzzzzzzz", "subnet-aaaaaaaa"]

# Configuración del servicio de notificaciones
service_name = "notification-service"
environment_name = "production"

# Configuración de seguridad - más restrictiva para producción
allowed_cidr_blocks = ["10.0.0.0/8"]

# Tags específicos para producción
common_tags = {
  Environment = "production"
  Project     = "notification-service"
  ManagedBy   = "terraform"
  CostCenter  = "notifications-team"
  Compliance  = "required"
}

// === ARCHIVO: scripts/healthcheck.sh ===
#!/bin/bash
# ==============================================================================
# Script de verificación de estado de recursos aprovisionados
# Este script valida que la infraestructura desplegada esté operativa
# ==============================================================================

set -euo pipefail

# ------------------------------------------------------------------------------
# Configuración inicial
# ------------------------------------------------------------------------------
REGION="${AWS_REGION:-us-east-1}"
ENVIRONMENT="${ENVIRONMENT:-dev}"
VPC_NAME="notificaciones-vpc-${ENVIRONMENT}"
INSTANCE_NAME="notificaciones-compute-${ENVIRONMENT}"
TIMEOUT=30
INTERVAL=5

# Colores para输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ------------------------------------------------------------------------------
# Funciones de utilidad
# ------------------------------------------------------------------------------
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_aws_credentials() {
    log_info "Verificando credenciales de AWS..."
    if ! aws sts get-caller-identity &>/dev/null; then
        log_error "Credenciales de AWS no configuradas o inválidas"
        return 1
    fi
    local account_id
    account_id=$(aws sts get-caller-identity --query 'Account' --output text)
    log_info "Credenciales válidas. Cuenta: ${account_id}, Región: ${REGION}"
}

# ------------------------------------------------------------------------------
# Verificación de recursos de red
# -------------------------------------------------------------------------------
check_vpc() {
    log_info "Verificando VPC..."
    
    local vpc_id
    vpc_id=$(aws ec2 describe-vpcs \
        --filters "Name=tag:Name,Values=${VPC_NAME}" \
        --query 'Vpcs[0].VpcId' \
        --output text 2>/dev/null || echo "NOT_FOUND")
    
    if [[ "${vpc_id}" == "NOT_FOUND" || -z "${vpc_id}" ]]; then
        log_error "VPC '${VPC_NAME}' no encontrada"
        return 1
    fi
    
    local vpc_state
    vpc_state=$(aws ec2 describe-vpcs \
        --vpc-ids "${vpc_id}" \
        --query 'Vpcs[0].State' \
        --output text)
    
    if [[ "${vpc_state}" != "available" ]]; then
        log_error "VPC no está en estado 'available': ${vpc_state}"
        return 1
    fi
    
    log_info "VPC '${vpc_id}' verificada correctamente (estado: ${vpc_state})"
    echo "VPC_ID=${vpc_id}"
    return 0
}

check_subnets() {
    local vpc_id="$1"
    log_info "Verificando subnets..."
    
    local subnet_count
    subnet_count=$(aws ec2 describe-subnets \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(Subnets)' \
        --output text)
    
    if [[ "${subnet_count}" -lt 2 ]]; then
        log_error "Se requieren al menos 2 subnets, encontradas: ${subnet_count}"
        return 1
    fi
    
    local available_subnets
    available_subnets=$(aws ec2 describe-subnets \
        --filters "Name=vpc-id,Values=${vpc_id}" "Name=state,Values=available" \
        --query 'length(Subnets)' \
        --output text)
    
    if [[ "${available_subnets}" -lt 2 ]]; then
        log_error "No hay suficientes subnets disponibles: ${available_subnets}"
        return 1
    fi
    
    log_info "Subnets verificadas: ${available_subnets} disponibles de ${subnet_count} totales"
    return 0
}

check_security_groups() {
    local vpc_id="$1"
    log_info "Verificando security groups..."
    
    local sg_count
    sg_count=$(aws ec2 describe-security-groups \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(SecurityGroups)' \
        --output text)
    
    if [[ "${sg_count}" -lt 1 ]]; then
        log_error "No se encontraron security groups en la VPC"
        return 1
    fi
    
    log_info "Security groups encontrados: ${sg_count}"
    return 0
}

check_internet_gateway() {
    local vpc_id="$1"
    log_info "Verificando Internet Gateway..."
    
    local igw_id
    igw_id=$(aws ec2 describe-internet-gateways \
        --filters "Name=attachment.vpc-id,Values=${vpc_id}" \
        --query 'InternetGateways[0].InternetGatewayId' \
        --output text 2>/dev/null || echo "NOT_FOUND")
    
    if [[ "${igw_id}" == "NOT_FOUND" || -z "${igw_id}" ]]; then
        log_error "Internet Gateway no asociado a la VPC"
        return 1
    fi
    
    log_info "Internet Gateway '${igw_id}' verificado correctamente"
    return 0
}

# ------------------------------------------------------------------------------
# Verificación de recursos de cómputo
# -------------------------------------------------------------------------------
check_ec2_instances() {
    log_info "Verificando instancias EC2..."
    
    local instance_count
    instance_count=$(aws ec2 describe-instances \
        --filters "Name=tag:Name,Values=${INSTANCE_NAME}" \
        --query 'length(Reservations[].Instances[])' \
        --output text)
    
    if [[ "${instance_count}" -eq 0 ]]; then
        log_warn "No se encontraron instancias EC2 con nombre '${INSTANCE_NAME}'"
        return 0
    fi
    
    local instance_ids
    instance_ids=$(aws ec2 describe-instances \
        --filters "Name=tag:Name,Values=${INSTANCE_NAME}" \
        --query 'Reservations[].Instances[].InstanceId' \
        --output text)
    
    for instance_id in ${instance_ids}; do
        local instance_state
        instance_state=$(aws ec2 describe-instances \
            --instance-ids "${instance_id}" \
            --query 'Reservations[0].Instances[0].State.Name' \
            --output text)
        
        if [[ "${instance_state}" != "running" ]]; then
            log_warn "Instancia ${instance_id} en estado: ${instance_state}"
        else
            log_info "Instancia ${instance_id} en estado: ${instance_state}"
        fi
    done
    
    return 0
}

check_elastic_ips() {
    log_info "Verificando Elastic IPs..."
    
    local eip_count
    eip_count=$(aws ec2 describe-addresses \
        --filters "Name=tag:Environment,Values=${ENVIRONMENT}" \
        --query 'length(Addresses)' \
        --output text)
    
    log_info "Elastic IPs asociados al entorno '${ENVIRONMENT}': ${eip_count}"
    return 0
}

check_load_balancer() {
    log_info "Verificando Load Balancer..."
    
    local lb_count
    lb_count=$(aws elbv2 describe-load-balancers \
        --query 'length(LoadBalancers)' \
        --output text)
    
    if [[ "${lb_count}" -gt 0 ]]; then
        local lb_arn
        lb_arn=$(aws elbv2 describe-load-balancers \
            --query 'LoadBalancers[0].LoadBalancerArn' \
            --output text)
        
        local lb_state
        lb_state=$(aws elbv2 describe-load-balancers \
            --load-balancer-arns "${lb_arn}" \
            --query 'LoadBalancers[0].State.Code' \
            --output text)
        
        if [[ "${lb_state}" == "active" ]]; then
            log_info "Load Balancer activo: ${lb_arn}"
        else
            log_warn "Load Balancer en estado: ${lb_state}"
        fi
    else
        log_warn "No se encontró Load Balancer"
    fi
    
    return 0
}

# ------------------------------------------------------------------------------
# Verificación de conectividad
# -------------------------------------------------------------------------------
check_connectivity() {
    local vpc_id="$1"
    log_info "Verificando conectividad de red..."
    
    # Verificar que las subnets tienen rutas hacia internet
    local route_table_count
    route_table_count=$(aws ec2 describe-route-tables \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(RouteTables)' \
        --output text)
    
    if [[ "${route_table_count}" -lt 1 ]]; then
        log_error "No se encontraron route tables para la VPC"
        return 1
    fi
    
    log_info "Route tables verificadas: ${route_table_count}"
    
    # Verificar que existe al menos una ruta hacia Internet Gateway
    local has_igw_route
    has_igw_route=$(aws ec2 describe-route-tables \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'RouteTables[].Routes[?DestinationCidrBlock==`0.0.0.0/0` && GatewayId!=`local`].GatewayId' \
        --output text | wc -w)
    
    if [[ "${has_igw_route}" -lt 1 ]]; then
        log_warn "No se encontró ruta por defecto (0.0.0.0/0) hacia Internet Gateway"
    else
        log_info "Ruta hacia Internet Gateway configurada correctamente"
    fi
    
    return 0
}

# ------------------------------------------------------------------------------
# Verificación de estado general de salud
# -------------------------------------------------------------------------------
verify_overall_health() {
    local vpc_id="$1"
    log_info "=========================================="
    log_info "Verificación de salud de infraestructura"
    log_info "=========================================="
    log_info "Entorno: ${ENVIRONMENT}"
    log_info "Región: ${REGION}"
    log_info "VPC: ${vpc_id}"
    log_info "=========================================="
    
    local failed_checks=0
    
    # Verificaciones de red
    check_subnets "${vpc_id}" || ((failed_checks++))
    check_security_groups "${vpc_id}" || ((failed_checks++))
    check_internet_gateway "${vpc_id}" || ((failed_checks++))
    check_connectivity "${vpc_id}" || ((failed_checks++))
    
    # Verificaciones de cómputo
    check_ec2_instances || ((failed_checks++))
    check_elastic_ips || ((failed_checks++))
    check_load_balancer || ((failed_checks++))
    
    echo ""
    log_info "=========================================="
    if [[ "${failed_checks}" -eq 0 ]]; then
        log_info "Resultado: TODAS LAS VERIFICACIONES PASARON"
        log_info "=========================================="
        return 0
    else
        log_error "Resultado: ${failed_checks} VERIFICACIONES FALLARON"
        log_error "=========================================="
        return 1
    fi
}

# ------------------------------------------------------------------------------
# Punto de entrada principal
# -------------------------------------------------------------------------------
main() {
    log_info "Iniciando healthcheck de infraestructura..."
    
    # Verificar credenciales
    check_aws_credentials || exit 1
    
    # Verificar VPC
    local vpc_output
    vpc_output=$(check_vpc) || exit 1
    
    local vpc_id
    vpc_id=$(echo "${vpc_output}" | grep "VPC_ID=" | cut -d'=' -f2)
    
    # Ejecutar verificación completa
    verify_overall_health "${vpc_id}"
    
    if [[ $? -eq 0 ]]; then
        log_info "Healthcheck completado exitosamente"
        exit 0
    else
        log_error "Healthcheck completado con errores"
        exit 1
    fi
}

# Ejecutar función principal
main "$@"

// === ARCHIVO: Dockerfile ===
# Stage 1: Build stage - compile the application artifact
FROM golang:1.21-alpine AS builder

# Install build dependencies
RUN apk add --no-cache git make

# Set working directory for the application source
WORKDIR /build

# Copy application source code
COPY . .

# Build the notification service binary
# This creates a minimal binary optimized for the final image
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o notifications-service .

# Stage 2: Production stage - minimal runtime image
FROM alpine:3.18

# Install runtime dependencies: ca-certificates for TLS, and curl for health checks
RUN apk add --no-cache ca-certificates curl

# Create non-root user for security best practices
RUN adduser -D -u 1000 appuser

# Set working directory
WORKDIR /app

# Copy the compiled binary from builder stage
COPY --from=builder /build/notifications-service /app/

# Copy configuration files that Terraform would provision
COPY configs/ /app/configs/

# Change ownership to non-root user
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose notification service port
EXPOSE 8080

# Health check endpoint for container orchestration
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Set default command to run the notification service
CMD ["/app/notifications-service"]
```
