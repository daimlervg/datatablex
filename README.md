# Datatablex

Elixir project with Phoenix using [datatables.net](http://datatables.net/) server-side processing.

To run the project :

  * git clone https://github.com/daimlervg/datatablex.git
  * mix deps.get
  * Check dev.exs config database parameters (Validate Step)
  * mix ecto.create
  * mix ecto.migrate
  * npm install
  * mix phx.server

## Lot of data

(Optional but highly recommended for test purpose)
Insert multiple rows to our table at once

Open the terminal or SQL shell(psql)

```elixir
datatablex_dev=# create table t(zipcode character varying, city character varying, state character varying);
CREATE TABLE
```

Check the root file (In my case is under the root C:/)

```elixir
datatablex_dev=# COPY t FROM 'C:/zip_codes.csv' WITH DELIMITER ',';
COPY 42741
```
Execute the insert statement 

```elixir
datatablex_dev=# insert into zips SELECT nextval('zips_id_seq'), t.zipcode, t.city, t.state, now(), now() FROM t;
INSERT 0 42741
```

## Ready to run?

Now you can visit (http://localhost:4000/zips) from your browser.

## Credits

Data sources which provided code an some clues:  

* `phoenix_datatables`:  https://hexdocs.pm/phoenix_datatables/readme.html & https://github.com/smartmetals/phoenix_datatables
* `datatables`: https://github.com/fmcgeough/datatables 
