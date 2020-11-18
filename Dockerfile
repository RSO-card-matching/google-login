FROM alpine:latest

RUN apk add py-cryptography

RUN apk add py3-josepy

RUN apk add py3-bcrypt

# RUN apk add py3-passlib

RUN apk add py3-pip

RUN pip install fastapi uvicorn


RUN pip install python-multipart
RUN pip install python-jose[cryptography]
RUN pip install passlib[bcrypt]
RUN pip install starlette
RUN pip install authlib
RUN pip install itsdangerous
RUN pip install httpx

# COPY --from=builder /usr/local/lib /usr/local

# # ENV PATH=/root/.local:$PATH

ENV GOOGLE_CLIENT_ID=200852524174-fnppspt3c1kv4sjvkjvrijsqgn227d83.apps.googleusercontent.com
ENV GOOGLE_CLIENT_SECRET=2qWbuqWuCujCYEXNylwwDesy

COPY ./app /app

EXPOSE 8080

CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "8080"]