sku = []
for gender in 'FM':
    for size in 'SMLX':
        if gender == 'F' and size == 'X':   #FX는 제외시켜라...
            continue
        for color in 'WGRB':
            sku.append(gender+size+color)
print(sku)

#축약 형식으로변환하기. 잘모르겠는데..

print([gender + size + color for gender in 'FM' for size in 'SMLX' for color in 'WGRB' if gender != 'F' or size != 'X'])
