
# This file is a generated template, your changes will not be overwritten

ttestClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "ttestClass",
    inherit = ttestBase,
    private = list(
        .run = function() {

            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)
            formula <- paste(self$options$dep, '~', self$options$group)
            formula <- as.formula(formula)
            
            results <- t.test(formula, self$data)
            
            self$results$text$setContent(results)
            
            table <- self$results$table
            table$setRow(rowNo=1, values=list(
                var=self$options$dep,
                t=results$statistic,
                `degrés de liberté`=results$parameter,
                p=results$p.value
            ))
            
            # preparing data for plotting
            means  <- aggregate(formula, self$data, mean)[,2]
            ses    <- aggregate(formula, self$data, function(x) sd(x)/sqrt(length(x)))[,2]
            sel    <- means - ses  # standard error lower bound
            seu    <- means + ses  # standard error upper bound
            levels <- base::levels(self$data[[self$options$group]])
            plotData <- data.frame(level=levels, mean=means, sel=sel, seu=seu)
            
            image <- self$results$plot
            image$setState(plotData)
        },
        .plot=function(image, ...) {
            plotData <- image$state
            plot <- ggplot(plotData, aes(x=level, y=mean)) +
                geom_errorbar(aes(ymin=sel, ymax=seu, width=.1)) +
                geom_point(aes(x=level, y=mean)) +
                labs(title=self$options$dep)
            print(plot)
            TRUE
        })
    
)
