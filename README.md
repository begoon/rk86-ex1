8080/8085 CPU Exerciser для Радио-86РК
--------------------------------------

Данный проект является адаптацией теста [8080/8085 CPU Exerciser][] для
Радио-86РК. Ядро теста без каких-либо изменений. Добавлены подпрограммы
для эмуляции BDOS: вывод символа и вывод строки. В первой подпрограмме
также производится перевод печатаемых символов в верхний регистр. Вторая
подпрограмма заменяет символ конца строки '$' на 0. По адресу 0000 добавлен
переход на "мягкий" старт Монитора.

Так как количество выводимой информации может превышать размер экрана РК,
то для избежания ее утери, подпрограмма вывода символа на экран также
сохраняет копию всего выведенного на экран по адресу 4000h. После окончания
теста и выхода в Монитор результы можно распечатать командой "G80".

Единственным минимальным изменением в ядре теста является замена команды
"EI" на "NOP" для предотвращения постоянного пищания. На результаты теста
на платформе РК данное изменение не влияет. Также начальное пожение стека
изменено со считавания из ячейки 0006 на абсолютный адрес 5000.

Для сборки теста из исходников нужен ассемблер [AS][]. Можно сразу скачать
собранный тест - [rk86ex1.bin][].

[rk86ex1.bin]: https://github.com/downloads/begoon/rk86-ex1/rk86ex1.bin

Тест загружается с адреса 0. Запускается командой "G100". После окончания
результаты можно распечатать повторно командой "G80".

Время работы теста на частоте 2MHz около трех часов.

[8080/8085 CPU Exerciser]: https://github.com/begoon/8080ex1
[AS]: https://github.com/begoon/asl
