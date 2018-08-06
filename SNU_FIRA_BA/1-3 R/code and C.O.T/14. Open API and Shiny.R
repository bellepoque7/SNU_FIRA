rm(list = ls()); gc(reset = T)

# --------------------------------
if(!require(httr)){install.packages("httr"); library(httr)}
if(!require(rvest)){install.packages("rvest"); library(rvest)}

# --------------------------------교육자료에는 ****로 표시되어 있습니다.
service_key = "%2FTx8UW5QkXse141bToOh9SO%2FbpFMoFAm4th151RoR4VW75y%2BGv3XzlqxeF80oGKEcWZ8pSoXvEi6%2BNnzlR%2FRrQ%3D%3D"

# --------------------------------
url = paste0("http://openapi.airkorea.or.kr/openapi/services/rest/",
             "ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?",
             "sidoName=서울",
             "&searchCondition=DAILY",
             "&pageNo=",1,
             "&numOfRows=",25,
             "&ServiceKey=",service_key)

# --------------------------------
if(!require(httr)){install.packages("httr"); library(httr)}

url_get = GET(url)

# --------------------------------
if(!require(xml2)){install.packages("xml2"); library(xml2)}

url_xml = read_xml(url_get)
url_xml

# --------------------------------
if(!require(rvest)){install.packages("rvest"); library(rvest)}

item_list = xml_nodes(url_xml, 'items item')

item_list[[1]]

# --------------------------------
tmp_item = xml_children(item_list[[1]])
tmp_item

# --------------------------------
tmp_item = xml_text(tmp_item)
tmp_item

# --------------------------------
item_list = lapply(item_list, function(x) return(xml_text(xml_children(x))))
item_list[[1]]
item_list[[2]]

# --------------------------------
item_dat = do.call('rbind',item_list)
item_dat = data.frame(item_dat, stringsAsFactors = F)
head(item_dat)

tmp = xml_nodes(url_xml, 'items item') 
colnames_dat = html_name(xml_children(tmp[[1]]))
colnames_dat

# --------------------------------
colnames(item_dat) = colnames_dat
head(item_dat)

# --------------------------------
air_data = NULL
for(i in 1:24)
{
  url = paste0("http://openapi.airkorea.or.kr/openapi/services/rest/",
               "ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?",
               "sidoName=서울",
               "&searchCondition=DAILY",
               "&pageNo=",i,
               "&numOfRows=",25,
               "&ServiceKey=",service_key)
  url_xml = read_xml(GET(url))
  item_list = url_xml %>% xml_nodes('items item')
  item_list = lapply(item_list, function(x) return(xml_text(xml_children(x))))
  item_dat = do.call('rbind',item_list)
  item_dat = data.frame(item_dat, stringsAsFactors = F)
  air_data = rbind(item_dat, air_data)
}

# --------------------------------
# 샤이니 코드
library(shiny)

ui = fluidPage(
  titlePanel("Welcome shiny!"),
  sidebarLayout(
    sidebarPanel(
      textInput("input_text", "텍스트를 입력하세요.")
    ),
    mainPanel(
      textOutput("output_text")
    )
  )
)

server = function(input, output)
{
  return(NULL)
}

shinyApp(ui = ui, server= server)

# --------------------------------
library(shiny)

ui = fluidPage(
  titlePanel("Welcome shiny!"),
  sidebarLayout(
    sidebarPanel(
      textInput("input_text", "텍스트를 입력하세요.")
    ),
    mainPanel(
      textOutput("output_text")
    )
  )
)


server = function(input, output)
{
  output$output_text = renderText({
    input$input_text
  })
}

shinyApp(ui = ui, server= server)

# --------------------------------
ui = fluidPage(
  headerPanel('Iris k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(iris)),
    selectInput('ycol', 'Y Variable', names(iris),
                selected=names(iris)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    checkboxInput('center_tf','Center points')
  ),
  mainPanel(
    plotOutput('plot1')
  )
)

server = function(input, output)
{
  return(NULL)
}

shinyApp(ui = ui, server = server)

# --------------------------------
ui = fluidPage(
  headerPanel('Iris k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(iris)),
    selectInput('ycol', 'Y Variable', names(iris),
                selected=names(iris)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    checkboxInput('center_tf','Center points')
  ),
  mainPanel(
    plotOutput('plot1')
  )
)

server = function(input, output)
{
  selectedData = reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    if(input$center_tf) points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
}

shinyApp(ui = ui, server = server)


# --------------------------------
url = paste0("http://openapi.airkorea.or.kr/openapi/services/rest/",
             "ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?",
             "sidoName=서울",
             "&searchCondition=DAILY",
             "&pageNo=",1,
             "&numOfRows=",600,
             "&ServiceKey=",service_key)
url_xml = xml(GET(url))
item_list = url_xml %>% xml_nodes('items item')
item_list = lapply(item_list, function(x) return(xml_text(xml_children(x))))
item_dat = do.call('rbind',item_list)
item_dat = data.frame(item_dat, stringsAsFactors = F)
item_dat[item_dat == '-'] = 0
tmp = xml_nodes(url_xml, 'items item') 
colnames_dat = xml_tag(xml_children(tmp[[1]]))
colnames(item_dat) = colnames_dat

library(ggmap)
uniq_region = unique(item_dat$cityName)
geo_dat = geocode(paste("서울특별시", uniq_region))
geo_dat = cbind(cityName = uniq_region, geo_dat)
head(geo_dat)

geo_dat = read.csv('geo_dat.csv', stringsAsFactors = F)
head(geo_dat)

item_dat = merge(item_dat, geo_dat, by = "cityName")
head(item_dat)
write.csv(item_dat, 'air_quality.csv', row.names = F)

dat = read.csv('air_quality.csv', stringsAsFactors = F)
head(dat)

# --------------------------------
library(shiny)

ui = fluidPage(
  titlePanel("Air quality data visualization"),
  sidebarLayout(
    sidebarPanel(
      selectInput('region', 'cityName', choices = sort(unique(dat$cityName))),
      selectInput('date', 'dataTime', choices = sort(unique(dat$dataTime))),
      selectInput('category', 'category', choices = colnames(dat)[3:8])
    ),
    mainPanel(
      plotOutput("hist1"),
      plotOutput("hist2")
    )
  )
)

server = function(input, output)
{
  return(NULL)
}

shinyApp(ui = ui, server = server)

# --------------------------------
library(shiny)

ui = fluidPage(
  titlePanel("Air quality data visualization"),
  sidebarLayout(
    sidebarPanel(
      selectInput('region', 'cityName', choices = sort(unique(dat$cityName))),
      selectInput('date', 'dataTime', choices = sort(unique(dat$dataTime))),
      selectInput('category', 'category', choices = colnames(dat)[3:8])
    ),
    mainPanel(
      plotOutput("hist1"),
      plotOutput("hist2")
    )
  )
)

server = function(input, output)
{
  selectedData1 = reactive({
    dat[dat$dataTime == input$date, c(input$category)]
  })
  selectedData2 = reactive({
    dat[dat$cityName == input$region, c(input$category)]
  })
  output$hist1 = renderPlot({
    hist(selectedData1(), main = "선택된 시간의 미세먼지", xlab = "", ylab = "")
  })
  output$hist2 = renderPlot({
    hist(selectedData2(), main = "선택된 구의 미세먼지", xlab = "", ylab = "")
  })
}

shinyApp(ui = ui, server = server)

# --------------------------------
library(shiny)

ui = fluidPage(
  titlePanel("Air quality data visualization"),
  sidebarLayout(
    sidebarPanel(
      selectInput('date', 'dataTime', choices = sort(unique(dat$dataTime))),
      selectInput('category', 'category', choices = colnames(dat)[3:8]),
      sliderInput('bins', 'detalied density', min = 5, max = 30, value = 10)
    ),
    mainPanel(
      plotOutput("mapplot"),
      tableOutput("tt")
    )
  )
)

server = function(input, output)
{
  return(NULL)
}
shinyApp(ui = ui, server = server)


# --------------------------------
library(shiny)

ui = fluidPage(
  titlePanel("Air quality data visualization"),
  sidebarLayout(
    sidebarPanel(
      selectInput('date', 'dataTime', choices = sort(unique(dat$dataTime))),
      selectInput('category', 'category', choices = colnames(dat)[3:8]),
      sliderInput('bins', 'detalied density', min = 5, max = 30, value = 10)
    ),
    mainPanel(
      plotOutput("mapplot"),
      tableOutput("tt")
    )
  )
)

library(ggmap)
server = function(input, output)
{
  map_dat = reactive({
    tmp_dat = dat[dat$dataTime == input$date, c(input$category, "lon", "lat")]
    
    values = tmp_dat[,c(input$category)]
    min_value = min(values[values != 0])
    values = values / min_value  
    tmp_dat[,c(input$category)] = values
    with(tmp_dat, tmp_dat[rep(1:nrow(tmp_dat), tmp_dat[,c(input$category)]),])
  })
  map = ggmap(get_googlemap(center = c(lon = 127.02, lat = 37.53),
                            zoom = 11,
                            maptype = "roadmap",
                            color = "bw"))
  output$mapplot = renderPlot({
    map  + stat_density2d(aes(x = lon, y = lat, alpha = ..level..),
                          data = map_dat(),
                          size= 2,
                          bins= input$bins,
                          geom="polygon") +
      scale_alpha(range = c(0, 0.3))
  }, height = 1200, width = 1024)
}

shinyApp(ui = ui, server = server)















