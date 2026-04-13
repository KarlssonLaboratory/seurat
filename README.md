[![Build and Deploy Docker Image](https://github.com/KarlssonLaboratory/seurat/actions/workflows/deploy_package.yml/badge.svg)](https://github.com/KarlssonLaboratory/seurat/actions/workflows/deploy_package.yml)

A rocker/r-ver:4.4.0 container with Seurat R-package (and some dependencies). Mainly used for single cell RNA-sequencing analysis.

> [!NOTE]
> Every push to `main` automatically builds and pushes the image to GitHub Container Registry. Tagged releases (e.g. `v1.0.0`) produce versioned image tags.

## Included softwares

`Seurat`, `tidyverse`, `Matrix`, `patchwork`, `remotes`, `DoubletFinder`, and some system dependencies.

## Include in nextflow process

```groovy
process PROCESS_NAME {
	
	. . .

	container "${workflow.containerEngine == 'singularity' ?
  	'docker://ghcr.io/karlssonlaboratory/seurat' :
  	'ghcr.io/karlssonlaboratory/seurat'}"

  . . .
}
```

The container definition uses an [elvis operator](https://www.nextflow.io/docs/latest/reference/syntax.html#unary-expressions) = `<statement> ? <TRUE> : <FALSE>`

## Pull from GitHub Container Registry

```bash
docker pull ghcr.io/KarlssonLaboratory/seurat
```

## Run interactively

```bash
docker run -it --rm -v $(pwd):/data ghcr.io/KarlssonLaboratory/seurat
```

## Build locally

```bash
git clone https://github.com/KarlssonLaboratory/seurat.git
cd seurat
docker build -t seurat .
```