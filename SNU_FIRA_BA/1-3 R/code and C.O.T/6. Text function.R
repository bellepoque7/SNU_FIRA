rm(list = ls()); gc(reset = T)

# -----------------------------
paste("감자로","만든","감자칩", sep='-')
paste("감자로","만든","감자칩", sep='')
paste("감자로","만든","감자칩")

# -----------------------------
paste(c("감자로 만든","고구마로 만든"), c("감자칩", "고구마칩"), sep=' ')

# -----------------------------
paste0(1:12, c("st", "nd", "rd", rep("th", 9)))

# -----------------------------
paste0(1:12, collapse = "-")
paste(1:4,5:8, sep = ';')
paste(1:4,5:8, sep = ';', collapse = '-')

# -----------------------------
grep("pole", c("Equator", "North Pole", "South pole", "poles"))

# -----------------------------
nchar(c("South Pole", "한글 문자열", NA))

# -----------------------------
substr("Equator", start=2, stop=4)
substr("한글 문자열 추출", start=2,stop=4)
substring("한글 문자열 추출", first=2)

# -----------------------------
strsplit("6-16-2011", split = '-')

# -----------------------------
strsplit("6*16*2011", split = '*')

# -----------------------------
strsplit("6*16*2011", split = '*', fixed = TRUE)
strsplit("6*16*2011", split = '\\*')

# -----------------------------
regexpr("감자", "맛있는 감자칩")

# -----------------------------
a <- regexpr("감자", "맛있는 감자칩")
attr(a, 'match.length')
attr(a, 'useBytes')

# -----------------------------
a <- gregexpr("감자", "머리를 감자마자 감자칩을 먹었다.")
a
attr(a[[1]], 'match.length')

# -----------------------------
gsub(pattern = "감자", replacement='고구마',
     x= "머리를 감자마자 감자칩을 먹었다.")

gsub(pattern = "<br>", replacement='',
     x= "머리를 감자마자 <br>감자칩을 먹었다.")


# -----------------------------
strsplit('감자, 고구마, 양파 그리고 파이어볼', split ='(,)|(그리고)')

# -----------------------------
grep(pattern = '^(감자)', x = '감자는 고구마를 좋아해')
grep(pattern = '^(감자)', x = '고구마는 감자를 안 좋아해')

# -----------------------------
grep(pattern = '(좋아해)$', x = '감자는 고구마를 좋아해')
grep(pattern = '(좋아해)$', x = '고구마는 감자를 안 좋아해')

# -----------------------------
gregexpr(pattern = '[아자차카]', text = '고구마는 감자를 안 좋아해')

# -----------------------------
gregexpr(pattern = '[(사과)(감자)(양파)]', text = '고구마는 감자를 안 좋아해')

gregexpr(pattern = '^[(사과)(감자)(양파)]', text = '고구마는 감자를 안 좋아해')

# -----------------------------
grep(pattern = '^[^(사과)(감자)(양파)]', x = '감자는 고구마를 좋아해')

# -----------------------------
grep(pattern = '^ab{2,3}', x = 'ab')
grep(pattern = '^ab{2,3}', x = 'abab')
grep(pattern = '^ab{2,3}', x = 'abbb')
grep(pattern = '^(ab){2,3}', x = 'abab')

# -----------------------------
^[1-9][0-9]*$
  
# -----------------------------
^[1-9][0-9]*$
  
# -----------------------------
^(0|([1-9][0-9]*))$
  
# -----------------------------
^[0-9]+(\\.[0-9]{1,2})?$
  
# -----------------------------
^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*$
  
# -----------------------------
if(!require(stringr)){install.packages("stringr"); library(stringr)}
hw <- "Hadley Wickham"
str_sub(hw, 1, 6)
str_sub(hw, -5)
str_sub(hw, -5, -2)

# -----------------------------
fruits <- c("apples and oranges and pears and bananas",
            "pineapples and mangos and guavas")
str_split(fruits, " and ")

# -----------------------------
str_split(fruits, " and ", n = 2)

# -----------------------------
str_split_fixed(fruits, " and ", 4)

# -----------------------------
fruit <- c("apple", "banana", "pear", "pinapple")
str_detect(fruit, "^a")

# -----------------------------
str_count(fruit, c("a", "b", "p", "p"))

# -----------------------------
str_locate(fruit, "e")

# -----------------------------
shopping_list <- c("apples x4", "flour", "sugar", "milk x2")
str_extract(shopping_list, "\\d")

# -----------------------------
fruits <- c("one apple", "two pears", "three bananas")
str_replace(fruits, "[aeiou]", "-")

1
  