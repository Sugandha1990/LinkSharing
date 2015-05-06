package dto

import linksharingapplication.Resource

/**
 * Created by intelligrape on 25/4/15.
 */
class HomeDTO {
    List<Resource> recentResources
    List<Resource> topResources
    HomeDTO(Map homeMap){
        this.recentResources=homeMap.recentResources
        this.topResources=homeMap.topResources
    }
}
