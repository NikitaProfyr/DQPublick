import time

# todo добавить скрипт выполняющий sql команды из файла script.txt

with open('script.txt') as file_script:
    queries = ''
    for string in file_script:
        if 'INSERT INTO' in string:
            queries = string
        else:
            queries = queries + string
        print(string)
