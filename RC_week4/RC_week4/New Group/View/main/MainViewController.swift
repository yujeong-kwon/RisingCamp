//
//  MainViewController.swift
//  RC_week4
//
//  Created by 권유정 on 2022/10/13.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var cat: UIImageView!
    @IBOutlet weak var catDotori: UIImageView!
    @IBOutlet weak var chip: UIImageView!
    @IBOutlet weak var chipDotori: UIImageView!
    @IBOutlet weak var rabbit: UIImageView!
    @IBOutlet weak var rabbitDotori: UIImageView!
    @IBOutlet weak var bear: UIImageView!
    @IBOutlet weak var bearDotori: UIImageView!
    @IBOutlet weak var dog: UIImageView!
    @IBOutlet weak var dogDotori: UIImageView!
    @IBOutlet weak var ham: UIImageView!
    @IBOutlet weak var hamDotori: UIImageView!
    
    @IBOutlet weak var invite: UIImageView!
    @IBOutlet weak var dotori: UILabel!
    
    var chipTimer: Timer?
    var chipTimerNum: Int = -1
    var catTimer: Timer?
    var catTimerNum: Int = -1
    var rabbitTimer: Timer?
    var rabbitTimerNum: Int = -1
    var bearTimer: Timer?
    var bearTimerNum: Int = -1
    var dogTimer: Timer?
    var dogTimerNum: Int = -1
    var hamTimer: Timer?
    var hamTimerNum: Int = -1
    
    var chipDotoriCount: Int = 0
    var catDotoriCount: Int = 0
    var rabbitDotoriCount: Int = 0
    var dogDotoriCount: Int = 0
    var hamDotoriCount: Int = 0
    var bearDotoriCount: Int = 0
    var dotoriCount: Int = 0
    
    var inviteCount: Int = 0
    //var timer: Timer?
    //var timerNum: Int = 0
    private var animal: SettingAnimal = SettingAnimal.shared
    
    //var List: [Setting] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //settingList에 있는 동물만 작동
        dotoriCount = Int(dotori.text!) ?? 0
        animal.settingList.forEach{
            i in
            switch i.name{
            case "냐옹":
                cat.alpha = 1
                catTimerNum = 1
                catDotoriCount = i.dotori
              
            case "댕이":
                dog.alpha = 1
                dogTimerNum = 1
                dogDotoriCount = i.dotori
                
            case "다람이":
                chip.alpha = 1
                chipTimerNum = 1
                chipDotoriCount = i.dotori
                
            case "우피":
                bear.alpha = 1
                bearTimerNum = 1
                bearDotoriCount = i.dotori
                
            case "토로리":
                rabbit.alpha = 1
                rabbitTimerNum = 1
                rabbitDotoriCount = i.dotori
                
            case "지지":
                ham.alpha = 1
                hamTimerNum = 1
                hamDotoriCount = i.dotori
            
            default:
                print("")
            }
        }
        /*
        List.forEach{
            i in
            
        }
         */
        //self.startCatTimer()
        
        
        startAnimalTimer()
        
    }
    //타이머 비동기 처리
    private func startAnimalTimer(){
        
        DispatchQueue.main.async {
            //self.startCatTimer()
            if(self.catTimerNum != -1){
                self.timerCat{
                    self.catDotori.alpha = 1
                    self.catTimer?.invalidate()
                    self.catTimer = nil
                }
            }
        }
        DispatchQueue.main.async {
            if(self.chipTimerNum != -1){
                self.timerChip{
                    self.chipDotori.alpha = 1
                    self.chipTimer?.invalidate()
                    self.chipTimer = nil
                }
            }
        }
        DispatchQueue.main.async {
            if(self.bearTimerNum != -1){
                self.timerBear{
                    self.bearDotori.alpha = 1
                    self.bearTimer?.invalidate()
                    self.bearTimer = nil
                }
            }
        }
        DispatchQueue.main.async {
            if(self.rabbitTimerNum != -1){
                self.timerRabbit{
                    self.rabbitDotori.alpha = 1
                    self.rabbitTimer?.invalidate()
                    self.rabbitTimer = nil
                }
            }
        }
        DispatchQueue.main.async {
            if(self.hamTimerNum != -1){
                self.timerHam{
                    self.hamDotori.alpha = 1
                    self.hamTimer?.invalidate()
                    self.hamTimer = nil
                }
            }
        }
        DispatchQueue.main.async {
            if(self.dogTimerNum != -1){
                self.timerDog{
                    self.dogDotori.alpha = 1
                    self.dogTimer?.invalidate()
                    self.dogTimer = nil
                }
            }
        }
            
    }
    func timerCat(complition: @escaping () -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            complition()
        }
    }
    func timerChip(complition: @escaping () -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 9){
            complition()
        }
    }
    func timerDog(complition: @escaping () -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            complition()
        }
    }
    func timerBear(complition: @escaping () -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 8){
            complition()
        }
    }
    func timerHam(complition: @escaping () -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            complition()
        }
    }
    func timerRabbit(complition: @escaping () -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 6){
            complition()
        }
    }
    
    func timerInvite(complition: @escaping () -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 10){
            complition()
        }
    }
    
    
    @IBAction func inviteAnimal(_ sender: UITapGestureRecognizer) {
        //테이블 뷰 update를 위해 동작 -> 추가되는 인데스로 자유롭게 활용 불가능
        invite.alpha = 0
        if(self.inviteCount==0){
            self.timerInvite {
                //온천탕에 새로운 동물 추가
                self.bear.alpha = 1
                //테이블 뷰에 추가된 동물 업데이트
                self.animal.update(at: 3, newImg: UIImage(named: "우피.png"), newName: "우피", newDotori: 8)
                self.inviteCount += 1
                self.timerBear {
                    self.bearDotori.alpha = 1
                    self.bearTimer?.invalidate()
                    self.bearTimer = nil
                }
                self.invite.alpha = 1
            }
        }else if(self.inviteCount==1){
            self.timerInvite{
                self.chip.alpha = 1
                self.animal.update(at: 4, newImg: UIImage(named: "다람이.png"), newName: "다람이", newDotori: 9)
                self.inviteCount += 1
                self.timerChip {
                    self.chipDotori.alpha = 1
                    self.chipTimer?.invalidate()
                    self.chipTimer = nil
                }
                self.invite.alpha = 1
            }
        }else if(self.inviteCount == 2){
            self.timerInvite {
                self.rabbit.alpha = 1
                self.animal.update(at: 5, newImg: UIImage(named: "토로리.png"), newName: "토로리", newDotori: 6)
                self.inviteCount += 1
                self.timerRabbit {
                    self.rabbitDotori.alpha = 1
                    self.rabbitTimer?.invalidate()
                    self.rabbitTimer = nil
                }
                self.invite.alpha = 1
                
            }
        }else{
            invite.alpha = 1
        }
        
    }
    
    
    @IBAction func chipTap(_ sender: UITapGestureRecognizer) {

        if(chipDotori.alpha==1){
            timerChip {
                self.chipDotori.alpha = 1
                self.chipTimer?.invalidate()
                self.chipTimer = nil
            }
            chipDotori.alpha = 0
            dotoriCount += chipDotoriCount
            updateDotori()
            chipTimerNum = 9
            //startChipTimer()
        }
    }
    @IBAction func catTap(_ sender: UITapGestureRecognizer) {
        if(catDotori.alpha==1){
            //아래가 실행된후 실행?
            timerCat {
                self.catDotori.alpha = 1
                self.catTimer?.invalidate()
                self.catTimer = nil
            }
            catDotori.alpha = 0
            dotoriCount += catDotoriCount
            updateDotori()
            catTimerNum = 2
            
        }
    }
    @IBAction func rabbitTap(_ sender: UITapGestureRecognizer) {
        if(rabbitDotori.alpha==1){
            timerRabbit {
                self.rabbitDotori.alpha = 1
                self.rabbitTimer?.invalidate()
                self.rabbitTimer = nil
            }
            rabbitDotori.alpha = 0
            dotoriCount += rabbitDotoriCount
            updateDotori()
            rabbitTimerNum = 6
            //startRabbitTimer()
        }
    }
    @IBAction func bearTap(_ sender: UITapGestureRecognizer) {
        if(bearDotori.alpha==1){
            timerBear {
                self.bearDotori.alpha = 1
                self.bearTimer?.invalidate()
                self.bearTimer = nil
            }
            bearDotori.alpha = 0
            dotoriCount += bearDotoriCount
            updateDotori()
            bearTimerNum = 8
            //startBearTimer()
        }
    }
    @IBAction func hamTap(_ sender: UITapGestureRecognizer) {
        if(hamDotori.alpha==1){
            timerHam {
                self.hamDotori.alpha = 1
                self.hamTimer?.invalidate()
                self.hamTimer = nil
            }
            hamDotori.alpha = 0
            dotoriCount += hamDotoriCount
            updateDotori()
            hamTimerNum = 5
            //startHamTimer()
        }
    }
    @IBAction func dogTap(_ sender: UITapGestureRecognizer) {
        if(dogDotori.alpha==1){
            timerDog {
                self.dogDotori.alpha = 1
                self.dogTimer?.invalidate()
                self.dogTimer = nil
            }
            dogDotori.alpha = 0
            dotoriCount += dogDotoriCount
            updateDotori()
            dogTimerNum = 3
            //startDogTimer()
        }
    }
    
    @IBAction func catLong(_ sender: UILongPressGestureRecognizer) {
        cat.alpha = 0
        catDotori.alpha = 0
        catTimer?.invalidate()
        catTimer = nil
        animal.delete(name: "냐옹")
    }
    
    @IBAction func chipLong(_ sender: UILongPressGestureRecognizer) {
        chip.alpha = 0
        chipDotori.alpha = 0
        chipTimer?.invalidate()
        chipTimer = nil
        animal.delete(name: "다람이")
    }
    
    @IBAction func rabbitLong(_ sender: UILongPressGestureRecognizer) {
        rabbit.alpha = 0
        rabbitDotori.alpha = 0
        rabbitTimer?.invalidate()
        rabbitTimer = nil
        animal.delete(name: "토로리")
    }
    
    @IBAction func bearLong(_ sender: UILongPressGestureRecognizer) {
        bear.alpha = 0
        bearDotori.alpha = 0
        bearTimer?.invalidate()
        bearTimer = nil
        animal.delete(name: "우피")
    }
    
    @IBAction func hamLong(_ sender: UILongPressGestureRecognizer) {
        ham.alpha = 0
        hamDotori.alpha = 0
        hamTimer?.invalidate()
        hamTimer = nil
        animal.delete(name: "지지")
    }
    
    @IBAction func dogLong(_ sender: UILongPressGestureRecognizer) {
        dog.alpha = 0
        dogDotori.alpha = 0
        dogTimer?.invalidate()
        dogTimer = nil
        animal.delete(name: "댕이")
    }
    
    func updateDotori(){
        DispatchQueue.main.async {
            self.dotori.text = String(self.dotoriCount)
        }
        
    }
    @IBAction func tableViewBtn(_ sender: UITapGestureRecognizer) {
        let animal = storyboard?.instantiateViewController(withIdentifier: "tableVC") as! TableViewController
        
        self.present(animal, animated: true, completion: nil)
    }
    /* 동기처리 전 타이머 코드
    private func startCatTimer(){
        catTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(catTimerCallback), userInfo: nil, repeats: true)
    }
    @objc func catTimerCallback(){
       
            if(self.catTimerNum==0){
                self.catDotori.alpha = 1
                self.catTimer?.invalidate()
                self.catTimer = nil
            }else if(self.catTimerNum < 0){
                self.catTimerNum = -1
            }
            self.catTimerNum-=1
        
    }
    
    private func startChipTimer(){
        chipTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(chipTimerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func chipTimerCallback(){
            if(self.chipTimerNum == -1){
                self.chipTimer?.invalidate()
                self.chipTimer = nil
            }else{
                self.chipTimerNum-=1
            }
            if(self.chipTimerNum==0){
                self.chipDotori.alpha = 1
                self.chipTimer?.invalidate()
                self.chipTimer = nil
            }
    }
    private func startRabbitTimer(){
        rabbitTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(rabbitTimerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func rabbitTimerCallback(){
            if(self.rabbitTimerNum==0){
                self.rabbitDotori.alpha = 1
                self.rabbitTimer?.invalidate()
                self.rabbitTimer = nil
            }
            self.rabbitTimerNum-=1
    }
    private func startDogTimer(){
        dogTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(dogTimerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func dogTimerCallback(){
            if(self.dogTimerNum==0){
                self.dogDotori.alpha = 1
                self.dogTimer?.invalidate()
                self.dogTimer = nil
            }
            self.dogTimerNum-=1
    }
    private func startBearTimer(){
        bearTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(bearTimerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func bearTimerCallback(){
            if(self.bearTimerNum==0){
                self.bearDotori.alpha = 1
                self.bearTimer?.invalidate()
                self.bearTimer = nil
            }
            self.bearTimerNum-=1
    }
    private func startHamTimer(){
        hamTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hamTimerCallback), userInfo: nil, repeats: true)
    }
    
    @objc func hamTimerCallback(){
        
            if(self.hamTimerNum==0){
                self.hamDotori.alpha = 1
                self.hamTimer?.invalidate()
                self.hamTimer = nil
            }
            self.hamTimerNum-=1
        
    }
     
     private func startTimer(){
         timerNum = 30
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerCallback), userInfo: nil, repeats: true)
         
     }
     @objc private func TimerCallback(){
         if(timerNum < 20){
             //그림은 보이게할 수 있음
             //테이블 뷰 업데이트
             //테이블 뷰에 미리 없는 애들도 추가해두기
             bear.alpha = 1
             bearTimerNum = 8
             //startBearTimer()
             
             //동기 처리 못한거 설명
         }else if(timerNum < 10){
             chip.alpha = 1
             chipTimerNum = 9
             //startChipTimer()
         }else if(timerNum == 0){
             rabbit.alpha = 1
             rabbitTimerNum = 6
             //startRabbitTimer()
         }
         timerNum -= 1
         
     }
    */
    
}
