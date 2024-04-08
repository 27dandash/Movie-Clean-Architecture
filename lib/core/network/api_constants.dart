class ApiConstants{
  // https://api.themoviedb.org/3/movie/now_playing?api_key=1e4eab4f8b2f9be9759fec1cd35b5f8b
  static const baseUrl="https://api.themoviedb.org/3";
  static const apiKey="1e4eab4f8b2f9be9759fec1cd35b5f8b";
  static const nowPlayingMoviesPath="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const popularMoviesPath="$baseUrl/movie/popular?api_key=$apiKey";
  static const topRatedPath="$baseUrl/movie/top_rated?api_key=$apiKey";
  static String movieDetailsPath(int movieId)=>"$baseUrl/movie/$movieId?api_key=$apiKey";
  static String recomnadionPath(int movieId)=>"$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

}
