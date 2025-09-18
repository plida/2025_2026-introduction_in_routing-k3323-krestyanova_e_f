University: [ITMO University](https://itmo.ru/ru/)<br />
Faculty: [FICT](https://fict.itmo.ru)<br />
Course: [Introduction in routing](https://github.com/itmo-ict-faculty/introduction-in-routing)<br />
Year: 2025/2026<br />
Group: K3323<br />
Author: Krestyanova Elisaveta Fedorovna<br />
Lab: Lab2<br />
Date of create: 16.09.2025<br />
Date of finished: -<br />

# Схема

Схема, построенная в draw.io:

<img src="images/graph-1.png" width=500px>

Схема, построенная ContainerLab:

<img src="images/graph-2.png" width=500px>

# Выбор диапазона частных IP-адресов

Между роутерами сети могут позволить себе маску /30, так как такие сети соединяют только 2 устройства (сами роутеры). При этом, гипотетически, при расширении этой корпоративной сети сетей между роутерами будет больше, чем их самих, и хочется  

# Конфиг yaml

Конфиг во многом похож на конфиг предыдущей лабораторной, разве что добавился ещё один компьютер, а также связи по другому проведены. В этот раз каждый роутер подсоединён к своему компьютеру через eth3 и между собой через eth1 & eth2.

