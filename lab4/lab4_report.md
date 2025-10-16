University: [ITMO University](https://itmo.ru/ru/)<br />
Faculty: [FICT](https://fict.itmo.ru)<br />
Course: [Introduction in routing](https://github.com/itmo-ict-faculty/introduction-in-routing)<br />
Year: 2025/2026<br />
Group: K3323<br />
Author: Krestyanova Elisaveta Fedorovna<br />
Lab: Lab4<br />
Date of create: 13.10.2025<br />
Date of finished: -<br />

# Задание

Вам необходимо сделать IP/MPLS сеть связи для "RogaIKopita Games" изображенную на рисунке 1 в ContainerLab. Необходимо создать все устройства указанные на схеме и соединения между ними.

<img src="images/task.png" width=600px>

- Помимо этого вам необходимо настроить IP адреса на интерфейсах.
- Настроить OSPF и MPLS.
- Настроить iBGP с route reflector кластером

И вот тут лабораторная работа работа разделяется на 2 части, в первой части вам надо настроить L3VPN, во второй настроить VPLS, но при этом менять топологию не требуется. Вы можете просто разобрать VRF и на их месте собрать VPLS.

Первая часть:
- Настроить iBGP RR Cluster.
- Настроить VRF на 3 роутерах.
- Настроить RD и RT на 3 роутерах.
- Настроить IP адреса в VRF.
- Проверить связность между VRF
- Настроить имена устройств, сменить логины и пароли.

Вторая часть:
- Разобрать VRF на 3 роутерах (или отвязать их от интерфейсов).
- Настроить VPLS на 3 роутерах.
- Настроить IP адресацию на PC1,2,3 в одной сети.
- Проверить связность.

# Схема

Схема, построенная в draw.io:

<img src="images/graph-1.png" width=600px>

Схема, построенная ContainerLab:

<img src="images/graph-2.png" width=600px>


# Конфиг yaml

Конфигурация сети аналогична вариантом предыдущим лабораторным работам. 6 роутеров, 3 компьютера.

Сеть управления: 172.16.16.0/24.

# Конфиги

## Роутеры

### OSPF + MPLS

Настройка OSPF + MPLS берётся из предыдущей работы с небольшими изменениями портов и подключённых сетей в соответствии с изменённой схемой сети.

### iBGP c Route Reflector кластером
 
1. Выбираем ASN

AS — система сетей под управлением единственной административной зоны. У нас только 1 такая зона, поэтому выбираем 1 приватное (64512-65534) число, например 65000.

2. Настраиваем iBGP

Мы работаем в рамках 1 зоны, поэтому мы используем протокол iBGP. Т.е. в конфигах мы будем указывать номер зоны конфигурируемого роутера как 65000, и в пирах/соседях тоже будет номер зоны 65000.

- `/routing bgp instance` (set default, номер AS и айди роутера. Здесь снова пользуемся айди таким же, что и у loopback. Cluster-id для наших RR роутеров в центре)
- `/routing bgp peer` (remote-address, remote-as, route-reflect между RR роутерами)
- `/routing bgp network` (свой loopback адрес)

## Компьютеры

Аналогично предыдущим работам, компьютеры запрашивают айпи у соответствующего dhcp-сервера на eth1.

# Результаты

## 1: OSPF

Проверяем динамическую маршрутизацию... через таблицы маршрутизации!

<img src="images/ospf-1.png" width=600px>
<img src="images/ospf-2.png" width=600px>
<img src="images/ospf-3.png" width=600px>
<img src="images/ospf-4.png" width=600px>
<img src="images/ospf-5.png" width=600px>
<img src="images/ospf-6.png" width=600px>

Как можно заметить, нигде статические маршруты не были прописаны, всё настроено динамически.

## 2: MPLS

<img src="images/mpls-1.png" width=600px>
<img src="images/mpls-2.png" width=600px>
<img src="images/mpls-3.png" width=600px>
<img src="images/mpls-4.png" width=600px>
<img src="images/mpls-5.png" width=600px>
<img src="images/mpls-6.png" width=600px>

## 3: iBGP

В `ip route print where bgp` показана метрика 200, когда как у ospf метрики были 110, то есть ospf будет в приоритете.

В `routing bgp peer print status` можно заметить флаг E - established. По нему можно увидеть, что все конфиги были настроены без ошибок.

<img src="images/ibgp-1.png" width=600px>
<img src="images/ibgp-2.png" width=600px>
<img src="images/ibgp-3.png" width=600px>
<img src="images/ibgp-4.png" width=600px>
<img src="images/ibgp-5.png" width=600px>
<img src="images/ibgp-6.png" width=600px>

# Заключение

# Источники

1. BGP on a mikrotik a complete configuration: https://tech.layer-x.com/bgp-on-mikrotik-a-complete-configuration-guide/

2. Route Reflector: https://linkmeup.gitbook.io/sdsm/8.1.-ibgp/2.-problema-n-kvadrat/0.-route-reflector