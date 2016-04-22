# Artist-api

Artist-api is an API, that fetching info from Itunes with rake-task, that do next things

  - search artist by name
  - fetch all albums for current artist

##### Example
You need to do next:

```sh
$ rake artist[artistname]
```
### Installation
```sh
$ git clone https://github.com/lissyaka/artist-api.git
$ cd artist-api
$ bundle install
$ rails s
```
### URL
 - Fetch all artists -- GET: /artists
 - Fetch all albums by artist -- GET: /artists/:artist_id/albums