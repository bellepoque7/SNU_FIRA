install.packages('scatterplot3d')
library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt, disp, mpg, main="3D Scatterplot")


 # plotly는 강의 안함.
if(!require(plotly)) {install.packages("plotly"); library(plotly)}
plot_ly(mtcars, x = ~wt, y = ~disp, z = ~mpg) %>% add_markers()
plot_ly(mtcars, x = ~wt, y = ~disp, z = ~mpg, color = ~factor(cyl), 
        colors = c("red", "blue", "green")) %>% add_markers()


a = matrix(1:25,5,5)
image(a)                  # 숫자가 클수록 흰색에 가깝게.
a                         # 행을 x축 열을  y축으로 


dim(volcano)  # x좌표 87개, y좌표, 61개

z <- 2 * volcano        
x <- 10 * (1:nrow(z))  
y <- 10 * (1:ncol(z))    
## Don't draw the grid lines :  border = NA
par(bg = "slategray")
persp(x, y, z, theta = 135, phi = 30,   # x, y, z값을 가져와서그린다. 
      col = "green3", scale = FALSE,
      ltheta = -120, shade = 0.75, border = NA, box = FALSE)

persp3d(x, y, z, col = "green3")
contour(x,y,z)                   #등고선 그리는 함ㅅ
