# Increase Exercise
Una empresa de finanzas desea integrar su sistema de saldos de sus clientes a un sistema de
transacciones. Dichas transacciones son obtenidas mediante una API que informa los últimos
movimientos de las cuentas de los clientes.
Los movimientos pueden estar aprobados (van a ser pagados) o rechazados (no se van a pagar
al cliente) y se pagarán en una fecha en el futuro (entre 2 y 20 días en adelante).

URL de la API de transacciones: https://increase-transactions.herokuapp.com/

Esta API consta de 2 endpoints:
* GET /file.txt para obtener el archivo TXT que contiene las transacciones.
* GET /clients/:id para obtener la información de los clientes.

Para comunicarse con esta API es necesario enviar un token en el header Authorization con el
valor Bearer 1234567890qwertyuiopasdfghjklzxcvbnm.

Restricciones de la API:
* El archivo que devuelve tiene la información de las transacciones ocurridas en los
últimos 10 minutos.
* La API utiliza un caché que expira cada 10 minutos, por lo tanto la información que no
fue consumida en ese lapso se pierde.

# Instalacion

* bundle install
* rails db:create db:migrate
* rails server
* redis-server start
* bundle exec sidekiq

# Requirements

* Ruby 2.7.1
* Rails 6.0.3.5
* Redis server v=4.0.9
* Sidekiq 6.1.3
