
library(shiny)
library(reshape)
library(ggplot2)

bf <- read.csv("b.txt")
gf <- read.csv("g.txt")

df <- bf
title <- "BMI for boys"

# weight (kg), height (m)
calculate_bmi <- function(wt, ht) {
    wt / (ht^2)
}

shinyServer(
    function(input, output, session) {

        output$newBMI <- renderPlot({
            is_boy <- (input$gender == "1")
            if (is_boy) {
                df <<- bf
                title <<- "BMI for boys"
            } else {
                df <<- gf
                title <<- "BMI for girls"
            }
            
            #age <- as.numeric(input$age)
            age <- as.numeric(input$year) * 12 + as.numeric(input$month)
            ht <- as.numeric(input$height) * 0.0254   # inch to meter
            wt <- as.numeric(input$weight) * 0.453592 # lb to km
            my_bmi <- calculate_bmi(wt, ht)
            
            pct <- input$viewpt
            
            msg <- paste(title, age, ht, wt, length(pct), my_bmi)
            cls <- c("Age", pct)
            
            df_sel <- df[, cls]
            df_long <- melt(df_sel, id="Age")  # convert to long format
            names(df_long) <- c("Age", "Percentile", "bmi")
            
            pt_df <- data.frame(age=age, bmi=my_bmi)
            
            p1 <- ggplot(data=df_long,
                         aes(x=Age, y=bmi, colour=Percentile)) +
                xlab("Age (month)") +
                ylab("BMI percentile") +
                scale_x_continuous(breaks = seq(24, 240, 12)) +
                #ggtitle(msg) +
                ylim(12, 35) +
                geom_line()
            
            p1 + geom_point(data=pt_df, aes(x=age, y=bmi),
                            color="blue", shape=8, size=3)
            #opts(legend.position = "none")
        })
        
        output$calculated_bmi <- renderPrint({
            ht <- as.numeric(input$height) * 0.0254   # inch to meter
            wt <- as.numeric(input$weight) * 0.453592 # lb to km
            calculate_bmi(wt, ht)
        })
    }
)
