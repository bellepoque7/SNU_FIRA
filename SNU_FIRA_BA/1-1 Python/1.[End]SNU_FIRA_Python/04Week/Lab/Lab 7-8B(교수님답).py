from os import path

file = input('파일 이름을 입력하세요...: ')

if path.isfile(file):
    directory, filename = path.split(file)
else:
    raise FileNotFoundError

outfile = path.join(directory, 'UPPER' + filename)

with open(file, encoding='utf-8') as fin:
    with open(outfile, mode='w', encoding='utf-8') as fout:
        for line in fin:
            fout. write(line.upper())

print('"{}" 파일이 {} 디렉토리에 생성되었습니다.'.format(path.basename(outfile), path.dirname(path.abspath(outfile))))