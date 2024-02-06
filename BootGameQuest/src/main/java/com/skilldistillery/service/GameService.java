//package com.skilldistillery.service;
//
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;
//
//@Service
//public class GameService {
//
//    public String getGameData() {
//        try {
//            HttpHeaders headers = new HttpHeaders();
//            headers.setContentType(MediaType.APPLICATION_JSON);
//            headers.set("Client-ID", "5r9zwteebqsu0ocxlqa4tvabiqe1dv");
//            headers.set("Authorization", "Bearer hku0xm2b6b4h1gbolusquwjcxsqnlr");
//
//            HttpEntity<String> requestEntity = new HttpEntity<>("fields=age_ratings,aggregated_rating,aggregated_rating_count,alternative_names,artworks,bundles,category,checksum,collection,collections,cover,created_at,dlcs,expanded_games,expansions,external_games,first_release_date,follows,forks,franchise,franchises,game_engines,game_localizations,game_modes,genres,hypes,involved_companies,keywords,language_supports,multiplayer_modes,name,parent_game,platforms,player_perspectives,ports,rating,rating_count,release_dates,remakes,remasters,screenshots,similar_games,slug,standalone_expansions,status,storyline,summary,tags,themes,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos,websites;", headers);
//
//            ResponseEntity<String> responseEntity = new RestTemplate().exchange("https://api.igdb.com/v4/games", HttpMethod.POST, requestEntity, String.class);
//
//            String responseBody = responseEntity.getBody();
//            return responseBody;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//}
