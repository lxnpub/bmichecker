library(shiny)

textInput3<-function(inputId, label, value = "",...) 
{
    div(style="display:inline-block",
        tags$label(label, `for` = inputId), 
        tags$input(id = inputId, type = "text", value = value,...))
}

shinyUI(pageWithSidebar(
    headerPanel(h3("Body mass index checker (US age 2 to 20)")),
    
    sidebarPanel(
        #h4("Your input"),
        radioButtons('gender', label = h4("Gender"),
                     choices = list("Male"=1, "Female"=2),
                     selected=1, inline=T),
        
        #numericInput('age', label = h4('Age (month)'), 120, min=24, max=240, step=0.5),
        div(style="display:inline-block",textInput3(inputId="year", label=h4("Age year"), value = 10, class="input-small")),
        div(style="display:inline-block",textInput3(inputId="month", label=h4("month old"), value = 5, class="input-small")),
        
        #numericInput('height', label = h4('Height (inch)'), 20, min=10, max=80, step=0.5),
        selectInput('height', label = h4('Height (ft\'in)'),
                    list(
                        "0'5"=5,       "0'5.5"=5.5,   "0'6"=6,      
                        "0'6.5"=6.5,   "0'7"=7,       "0'7.5"=7.5,  
                        "0'8"=8,       "0'8.5"=8.5,   "0'9"=9,      
                        "0'9.5"=9.5,   "0'10"=10,     "0'10.5"=10.5,
                        "0'11"=11,     "0'11.5"=11.5, "1'0"=12,     
                        "1'0.5"=12.5,  "1'1"=13,      "1'1.5"=13.5, 
                        "1'2"=14,      "1'2.5"=14.5,  "1'3"=15,     
                        "1'3.5"=15.5,  "1'4"=16,      "1'4.5"=16.5, 
                        "1'5"=17,      "1'5.5"=17.5,  "1'6"=18,     
                        "1'6.5"=18.5,  "1'7"=19,      "1'7.5"=19.5, 
                        "1'8"=20,      "1'8.5"=20.5,  "1'9"=21,     
                        "1'9.5"=21.5,  "1'10"=22,     "1'10.5"=22.5,
                        "1'11"=23,     "1'11.5"=23.5, "2'0"=24,     
                        "2'0.5"=24.5,  "2'1"=25,      "2'1.5"=25.5, 
                        "2'2"=26,      "2'2.5"=26.5,  "2'3"=27,     
                        "2'3.5"=27.5,  "2'4"=28,      "2'4.5"=28.5, 
                        "2'5"=29,      "2'5.5"=29.5,  "2'6"=30,     
                        "2'6.5"=30.5,  "2'7"=31,      "2'7.5"=31.5, 
                        "2'8"=32,      "2'8.5"=32.5,  "2'9"=33,     
                        "2'9.5"=33.5,  "2'10"=34,     "2'10.5"=34.5,
                        "2'11"=35,     "2'11.5"=35.5, "3'0"=36,     
                        "3'0.5"=36.5,  "3'1"=37,      "3'1.5"=37.5, 
                        "3'2"=38,      "3'2.5"=38.5,  "3'3"=39,     
                        "3'3.5"=39.5,  "3'4"=40,      "3'4.5"=40.5, 
                        "3'5"=41,      "3'5.5"=41.5,  "3'6"=42,     
                        "3'6.5"=42.5,  "3'7"=43,      "3'7.5"=43.5, 
                        "3'8"=44,      "3'8.5"=44.5,  "3'9"=45,     
                        "3'9.5"=45.5,  "3'10"=46,     "3'10.5"=46.5,
                        "3'11"=47,     "3'11.5"=47.5, "4'0"=48,     
                        "4'0.5"=48.5,  "4'1"=49,      "4'1.5"=49.5, 
                        "4'2"=50,      "4'2.5"=50.5,  "4'3"=51,     
                        "4'3.5"=51.5,  "4'4"=52,      "4'4.5"=52.5, 
                        "4'5"=53,      "4'5.5"=53.5,  "4'6"=54,     
                        "4'6.5"=54.5,  "4'7"=55,      "4'7.5"=55.5, 
                        "4'8"=56,      "4'8.5"=56.5,  "4'9"=57,     
                        "4'9.5"=57.5,  "4'10"=58,     "4'10.5"=58.5,
                        "4'11"=59,     "4'11.5"=59.5, "5'0"=60,     
                        "5'0.5"=60.5,  "5'1"=61,      "5'1.5"=61.5, 
                        "5'2"=62,      "5'2.5"=62.5,  "5'3"=63,     
                        "5'3.5"=63.5,  "5'4"=64,      "5'4.5"=64.5, 
                        "5'5"=65,      "5'5.5"=65.5,  "5'6"=66,     
                        "5'6.5"=66.5,  "5'7"=67,      "5'7.5"=67.5, 
                        "5'8"=68,      "5'8.5"=68.5,  "5'9"=69,     
                        "5'9.5"=69.5,  "5'10"=70,     "5'10.5"=70.5,
                        "5'11"=71,     "5'11.5"=71.5, "6'0"=72,     
                        "6'0.5"=72.5,  "6'1"=73,      "6'1.5"=73.5, 
                        "6'2"=74,      "6'2.5"=74.5,  "6'3"=75,     
                        "6'3.5"=75.5,  "6'4"=76,      "6'4.5"=76.5, 
                        "6'5"=77,      "6'5.5"=77.5,  "6'6"=78,     
                        "6'6.5"=78.5,  "6'7"=79,      "6'7.5"=79.5, 
                        "6'8"=80),
                    selected=40),
        
        sliderInput('weight', label=h4('Weight (lb)'), value=40, min=2, max=120, step=0.1),
        
        checkboxGroupInput("viewpt", label = h4("View Percentiles"),
                           c(" 3rd Percentile"="Pt_3rd",
                             " 5th Percentile"="Pt_5th",
                             "10th Percentile"="Pt_10th",
                             "25th Percentile"="Pt_25th",
                             "50th Percentile"="Pt_50th",
                             "75th Percentile"="Pt_75th",
                             "85th Percentile"="Pt_85th",
                             "90th Percentile"="Pt_90th",
                             "95th Percentile"="Pt_95th",
                             "97th Percentile"="Pt_97th"),
                           selected=c("Pt_5th", "Pt_50th", "Pt_95th"), inline=T)
        
        #submitButton('Submit')
    ),
    
    mainPanel(
        h4("Instruction on how to use:"),
        wellPanel(
            helpText("This is the place you can monitor you or your child's BMI. Please enter age, height and weight, you will find the BMI. If you are interested in the rough percentile of the BMI, please select the percentiles you want to displace.")
        ),
        h4("Your BMI comparing with others"),
        plotOutput('newBMI'),
        h4("Your BMI is", inline=TRUE),
        textOutput('calculated_bmi', inline=TRUE)
    )
    

))
