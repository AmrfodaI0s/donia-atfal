//
//  AnimeDetailsVC + DataService.swift
//  Cool Kids
//
//  Created by Eslam on 4/14/20.
//  Copyright © 2020 ioslam. All rights reserved.
//
import Foundation

//MARK: - Extention - API Fetching Methods
extension AnimeDetailsVC {
    
    //MARK: - get Videos if isConnectedToNetwork
    func getVideosIfConnected(){
        if Reachability.isConnectedToNetwork(){
            Helper.showSpinner(onView: view)
            //get all videos for selected categories
            handleVideos()
            handlRelatedVideos()
            Helper.removeSpinner()
        } else {
            Alert.noInternetConnection(self) {
                self.getVideosIfConnected()
            }
        }
    }
    
    //MARK: - get all videos by category id
    func handleVideos() {
        API.getAnimeByID(categoryID: self.selected_anime?.id ?? 80) { (error, videos) in
            self.videos = videos
            DispatchQueue.main.async {
                self.anime.collectionView?.reloadData()
            }
        }
    }
    
    //MARK: - get all related videos by category id
    func handlRelatedVideos() {
        API.getRelatedVideos(id: selected_anime?.id ?? 0) { (error, videos) in
            self.related_videos = videos
            DispatchQueue.main.async {
                self.anime.collectionView?.reloadData()
            }
        }
    }
}
