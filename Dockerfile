ARG ODOO_VERSION=17.0

FROM odoo:${ODOO_VERSION}

USER root

COPY odoo/odoo.conf /etc/odoo/odoo.conf

COPY odoo/addons /mnt/extra-addons

COPY odoo/wait-for-psql.py /usr/local/bin/

RUN chmod +x /usr/local/bin//wait-for-psql.py

COPY odoo/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8069 8071 8072

ENTRYPOINT ["/entrypoint.sh"]

CMD ["odoo"]

USER odoo
