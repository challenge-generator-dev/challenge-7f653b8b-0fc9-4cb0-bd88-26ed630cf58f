# Versionado de Infraestructura de Servicio de Notificaciones con Terraform

El equipo de notificaciones necesita aprovisionar y versionar su infraestructura utilizando Terraform. El objetivo es asegurar que la infraestructura del servicio de notificaciones esté correctamente configurada y versionada para soportar las operaciones del servicio. Los actores involucrados son el equipo de desarrollo de notificaciones y el equipo de operaciones. La infraestructura incluye la red y el cómputo necesarios para el servicio de notificaciones.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para aprovisionar la infraestructura del servicio de notificaciones.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los recursos necesarios para la red y el cómputo del servicio de notificaciones.
- Configurar el archivo principal de Terraform para incluir los proveedores y recursos necesarios.
- Verificar que la configuración inicial de Terraform esté correctamente establecida.

**Entregable:** Archivo de configuración de Terraform inicial que incluye proveedores y recursos básicos.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de bloques provider y resource en Terraform.
- Importancia de la versiónado en el desarrollo de infraestructura.

</details>

### Fase 2: Aprovisionamiento de la Red

**Objetivo:** Aprovisionar la red necesaria para el servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir los recursos de red necesarios (VPC, subredes, rutas, etc.) en Terraform.
- Aplicar la configuración para crear la red y verificar que se haya creado correctamente.
- Documentar los pasos y decisiones tomadas durante el aprovisionamiento de la red.

**Entregable:** Configuración de Terraform que aprovisiona la red del servicio de notificaciones y documentación de los pasos y decisiones tomadas.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de recursos de red en Terraform (aws_vpc, aws_subnet, etc.).
- Verificación de la creación de recursos utilizando comandos de Terraform.

</details>

### Fase 3: Aprovisionamiento del Cómputo

**Objetivo:** Aprovisionar el cómputo necesario para el servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir los recursos de cómputo necesarios (instancias EC2, grupos de seguridad, etc.) en Terraform.
- Aplicar la configuración para crear el cómputo y verificar que se haya creado correctamente.
- Documentar los pasos y decisiones tomadas durante el aprovisionamiento del cómputo.

**Entregable:** Configuración de Terraform que aprovisiona el cómputo del servicio de notificaciones y documentación de los pasos y decisiones tomadas.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de recursos de cómputo en Terraform (aws_instance, aws_security_group, etc.).
- Verificación de la creación de recursos utilizando comandos de Terraform.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en el aprovisionamiento de infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la infraestructura con Terraform?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para aprovisionar recursos de red y cómputo?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el aprovisionamiento de infraestructura con Terraform y cómo se pueden justificar?

## Criterios de Evaluacion

- Configuración inicial de Terraform correctamente establecida.
- Red aprovisionada correctamente utilizando Terraform.
- Cómputo aprovisionado correctamente utilizando Terraform.
- Documentación de los pasos y decisiones tomadas durante el aprovisionamiento.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
