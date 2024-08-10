temp_raw <- readr::read_csv("data/mintemp_20170101-20221231.csv")
districts_raw <- readr::read_csv("data/districts_2017census.csv")

iquitos <- temp_raw |> 
  dplyr::filter(ubigeo == "160101") |> 
  tidyr::pivot_longer(
    cols = !ubigeo,
    names_prefix = "mintemp_",
    names_to = "fecha",
    values_to = "temp_min"
  ) |> 
  dplyr::mutate(fecha = lubridate::ymd(fecha)) |> 
  dplyr::filter(fecha >= as.Date("2022-01-01"))

readr::write_csv(iquitos, "data/iquitos.csv")
