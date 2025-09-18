University: [ITMO University](https://itmo.ru/ru/)<br />
Faculty: [FICT](https://fict.itmo.ru)<br />
Course: [Introduction in routing](https://github.com/itmo-ict-faculty/introduction-in-routing)<br />
Year: 2025/2026<br />
Group: K3323<br />
Author: Krestyanova Elisaveta Fedorovna<br />
Lab: Lab2<br />
Date of create: 16.09.2025<br />
Date of finished: -<br />

# Задание


Вам необходимо сделать сеть связи в трех геораспределенных офисах "RogaIKopita Games".

<img src="images/task.png" width=500px>

Необходимо создать все устройства указанные на схеме и соединения между ними.

- Помимо этого вам необходимо настроить IP адреса на интерфейсах.
- Создать DHCP сервера на роутерах в сторону клиентских устройств.
- Настроить статическую маршрутизацию.
- Настроить имена устройств, сменить логины и пароли.


# Схема

Схема, построенная в draw.io:

<img src="images/graph-1.png" width=500px>

Схема, построенная ContainerLab:

<img src="images/graph-2.png" width=500px>

# Конфиг yaml

Конфиг во многом похож на конфиг предыдущей лабораторной, разве что добавился ещё один компьютер, а также связи по другому проведены. В этот раз каждый роутер подсоединён к своему компьютеру через eth3 и между собой через eth1 & eth2.

# Конфиги

## Роутеры

В этой лабораторной вместо vlan-ов необходимо прописывать статические руты. Задание DHCP аналогично R01 из предыдущей работы.

В конфигах роутера указывается:

1. /ip address (на всех 3 портах, в сторону компьютера 10.x.0.1/16 адрес)
2. /ip pool
3. /ip dhcp-server
4. /ip dhcp-server network
5. /ip route (сети 10.x.0.0 за другими 2 роутерами)
6. /user (добавляем plida, убираем admin)
7. /system identity

## Компьютеры

Компьютерам выдаются айпи адреса через dhcp: `udhcpc -i eth1`. Но ещё в этом задании возникла проблема, что в Containerlab у них выставляется дефолтный маршрут от сети управления в yaml конфиге, и он в приоритете. Из-за этого любые попытки послать запрос на другой компьютер заканчиваются передачью запроса на роутер моего провайдера, где этот запрос теряется. Поэтому на стартапе у компьютеров мы удаляем этот дефолтный рут `ip route del default via 172.16.16.1 dev eth0`. При надобности его можно добавлять обратно, но с большим значением metric.

# Результаты

## Раздача IP-адресов

<img src="images/dhcpmsk.png" width=500px>

<img src="images/dhcpfrt.png" width=500px>

<img src="images/dhcpbrl.png" width=500px>


## Соединение роутеров

<img src="images/r01msk.png" width=500px>

<img src="images/r01frt.png" width=500px>

<img src="images/r01brl.png" width=500px>


## Соединение компьютеров

<img src="images/pc1.png" width=500px>

<img src="images/pc2.png" width=500px>

<img src="images/pc3.png" width=500px>

# Заключение

В ходе работы были созданы все устройства, указанные на схеме, и соединены через настройку IP адресов на интерфейсах. Были созданы DHCP сервера в сторону клиентских устройств. Наконец, была настроена статическая маршрутизация.

Цель создания сети связи в 3 геораспределенных офисах "RogaIKopita Games" была выполнена.



