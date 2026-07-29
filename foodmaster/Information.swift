import Foundation
import SwiftUI


class Information: ObservableObject{
    //@EnvironmentObject var FPlistViewModel: FPViewModel
    //@EnvironmentObject var TRlistViewModel: TRViewModel
    
    //constants of the app
    let ranks = ["Beginner","Great","Expert","Veteran","Ultra","Master"]
    let rank_xp: [CGFloat] = [100, 300, 600, 1000, 1500]
    
    let foodprofile_xp: CGFloat = 10
    let travelrecord_xp: CGFloat = 15
    let trivia_factor: CGFloat = 3
    
    //user Information
    @Published var userID: String = "000001" //save
    @Published var username: String = "" //save
    @Published var xp: CGFloat = 0 //save
    @Published var trivia_xp: CGFloat = 0 //save
    
    @Published var foods_awards = [0,0,0] //initialize from API
    @Published var travel_awards = [0,0,0] //initialize from API
    @Published var trivia_awards = [0,0,0] //save
    //@Published var foods_shot = 0
    @Published var trivia_highscore = 0 //save
    @Published var trivia_fullmarks = 0 //save
    @Published var awards = 0 //initialize from API
    
    @Published var r = 0 //initialize from xp
    @Published var dis = [0, 0]
    
    
    func update_xp(add: CGFloat){
        xp += add
        if xp>=rank_xp[0]{
            r=1
        }
        if xp>=rank_xp[1]{
            r=2
        }
        if xp>=rank_xp[2]{
            r=3
        }
        if xp>=rank_xp[3]{
            r=4
        }
        if xp>=rank_xp[4]{
            r=5
        }
    }
    
    func update_trivia_xp(add: CGFloat){
        trivia_xp+=add
    }
    
    func update_foodawards(len: Int){
        if len>=10 && foods_awards[0]==0{
            foods_awards[0]=1
            awards+=1
        }
        /*else{
            foods_awards[0]=0
        }*/
        if len>=20 && foods_awards[1]==0{
            foods_awards[1]=1
            awards+=1
        }
        /*else{
            foods_awards[1]=0
        }*/
        if len>=50 && foods_awards[2]==0{
            foods_awards[2]=1
            awards+=1
        }
        /*else{
            foods_awards[2]=0
        }*/
    }
    
    func update_travelawards(len: Int){
        if len>=10 && travel_awards[0]==0{
            travel_awards[0]=1
            awards+=1
        }
        /*else{
            travel_awards[0]=0
        }*/
        if len>=30 && travel_awards[1]==0{
            travel_awards[1]=1
            awards+=1
        }
        /*else{
            travel_awards[1]=0
        }*/
        if len>=50 && travel_awards[2]==0{
            travel_awards[2]=1
            awards+=1
        }
        /*else{
            travel_awards[2]=0
        }*/
    }
    
    func update_triviaawards(){
        trivia_fullmarks += 1
        
        if trivia_fullmarks>=10 && trivia_awards[0]==0{
            trivia_awards[0]=1
            awards+=1
        }
        /*else{
            trivia_awards[0]=0
        }*/
        if trivia_fullmarks>=30 && trivia_awards[1]==0{
            trivia_awards[1]=1
            awards+=1
        }
        /*else{
            trivia_awards[1]=0
        }*/
        if trivia_fullmarks>=50 && trivia_awards[2]==0{
            trivia_awards[2]=1
            awards+=1
        }
        /*else{
            trivia_awards[2]=0
        }*/
    }
    
    func update_triviahighscore(score: Int){
        if score > trivia_highscore{
            trivia_highscore = score
        }
    }
}

//var Info = Information()


/*
 if Info.xp < 100 {Info.r=0}
 else if Info.xp < 300{Info.r=1}
 else if Info.xp < 600{Info.r=2}
 else if Info.xp < 1000{Info.r=3}
 else if Info.xp < 1500 {Info.r=4}
 else {Info.r=5}
 */
