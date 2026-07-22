# syntax=docker/dockerfile:1

ARG MKDOCS_CONFIG=mkdocs.yml

FROM python:3.12-slim AS builder
ARG MKDOCS_CONFIG
WORKDIR /docs
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY mkdocs.yml mkdocs-internal.yml ./
COPY docs/ docs/
RUN mkdocs build -f "${MKDOCS_CONFIG}" -d site

FROM nginx:alpine AS runtime
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /docs/site /usr/share/nginx/html
EXPOSE 80
