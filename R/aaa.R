#' @rdname ggraph-extensions
#' @format NULL
#' @usage NULL
#' @importFrom ggplot2 ggproto StatIdentity
#' @export
StatFilter <- ggproto('StatFilter', StatIdentity,
    setup_data = function(data, params) {
        if (any(names(data) == 'filter')) {
            if (!is.logical(data$filter)) {
                stop('filter must be logical')
            }
            data <- data[data$filter, names(data) != 'filter']
        }
        data
    }
)

aesIntersect <- function(aes1, aes2) {
    structure(
        c(as.list(aes1), aes2[!names(aes2) %in% names(aes1)]),
        class = 'uneval'
    )
}
