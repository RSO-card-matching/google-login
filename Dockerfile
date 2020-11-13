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

COPY ./fastapi-google-login /fastapi-google-login

EXPOSE 8080

CMD ["uvicorn", "fastapi-google-login.app:app", "--host", "0.0.0.0", "--port", "8080"]