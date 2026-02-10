# ¡Hola! Bienvenido al contenedor de Odoo ERP - Alicorp
# Este Dockerfile configura el entorno de Odoo con módulos personalizados

FROM odoo:17.0

USER root

# Copiar módulos personalizados
COPY ./addons /mnt/extra-addons

# Instalar dependencias adicionales si es necesario
# COPY requirements.txt /tmp/
# RUN pip3 install -r /tmp/requirements.txt

# Establecer permisos correctos
RUN chown -R odoo:odoo /mnt/extra-addons

USER odoo

# Configuración
ENV ODOO_RC=/etc/odoo/odoo.conf

# Puerto expuesto
EXPOSE 8069

# Comando por defecto
CMD ["odoo"]
