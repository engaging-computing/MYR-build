FROM quay.io/umlecg/myr-frontend:master AS frontend
FROM quay.io/umlecg/myr-admin:master AS admin

FROM quay.io/umlecg/myr-backend:master

ENV MONGO_CONN_STR="mongodb://localhost:27017/ecg-myr"
ENV GOOGLE_OAUTH2_CLIENTID="Needs to be defined"

COPY --from=frontend /app/build /app/public/myr
COPY --from=frontend /app/docs /app/public/docs

COPY --from=admin /app/build /app/public/admin

EXPOSE 1337

ENTRYPOINT [ "npm", "start" ]
