'use strict'

class PersonagemController{

    constructor(){        
        this.personagens = [0];
        this.listCounter = 0;              
    }

    add(p){
        this.personagens[this.listCounter] = p;
        this.listCounter = this.listCounter+1;
    }

    get(nome){
        var i = 0;
        for(i = 0; i<this.personagens.length; i++){
            if( (this.personagens[i].nome.localeCompare(nome))==0 ){
                return this.personagens[i];
            }
        }
    }
}




class Personagem {  
  constructor(nome,spriteSheet,sizeIndv,vetorParado,vetorEsquerda,vetorDireita,posIniX,posIniY,speed,moveSpeed,defaultPlay,isNPC,moveRange) {
    this.spriteSheet = spriteSheet;//Caminho para a imagem do spritesheet do personagem
    this.sizeIndv = sizeIndv;//Tamanho de cada sprite do spritesheet
    this.nome = nome;
    this.vetorParado = vetorParado;//Vetor do spritesheet para quando o personagem esta parado
    this.vetorEsquerda = vetorEsquerda;//Vetor do spritesheet para quando o personagem esta a esquerda
    this.vetorDireita = vetorDireita;//Vetor do spritesheet para quando o personagem esta a direita
    this.posIniX = posIniX;
    this.posIniY = posIniY;
    this.speed = speed;//Velocidade de troca das imagens do spritesheet
    this.defaultPlay=defaultPlay;//Sprite que por padrao e executada
    this.moveSpeed = moveSpeed;//Velocidade que o NPC se move
    this.phaserObject = 0;//Objeto do jogo
    this.npcTween = 0;
    this.isNPC=isNPC;//0=NAO,1=SIM
    this.moveRange = moveRange;
    this.colosionCounter = 0;
  } 

  doPreload(game){
    game.load.spritesheet(this.nome,this.spriteSheet,this.sizeIndv[0],this.sizeIndv[1]);    
  }

  doCreate(game){
    this.phaserObject = game.add.sprite(this.posIniX, this.posIniY, this.nome);
    this.phaserObject.anchor.setTo(0, 0);       
    game.physics.arcade.enable(this.phaserObject);     
    if(this.isNPC==1){
        //this.npcTween = game.add.tween(this.phaserObject.body).to( { x: game.width/2 }, this.moveSpeed).loop(0).start();
        var side
        if(this.defaultPlay.localeCompare('esquerda')){
            side = Phaser.ANGLE_RIGHT;
        }else{
            side = Phaser.ANGLE_LEFT;
        }
        this.phaserObject.body.moveTo(this.moveSpeed,this.moveRange , side);
    }  
    this.phaserObject.frame=2;
    this.phaserObject.animations.add('parado',this.vetorParado,this.speed,true);
    this.phaserObject.animations.add('esquerda',this.vetorEsquerda,this.speed,true);
    this.phaserObject.animations.add('direita',this.vetorDireita,this.speed,true);
    this.phaserObject.animations.play(this.defaultPlay);    
  }


  doUpdate(){       
    this.doUpdateRyuuku();  
  }
 
  doUpdateRyuuku(){
    if((this.nome.localeCompare('ryuuku'))!=0 ){ 
        return 0;
    }        
    var side = -5
    if (upKey.isDown ) {
        this.phaserObject.animations.play('parado');
    } else
    if (downKey.isDown) {
        this.phaserObject.animations.play('parado');
    }
    if (leftKey.isDown && this.phaserObject.x > 0 + 48) {        
        this.phaserObject.animations.play('esquerda');
        side = Phaser.ANGLE_LEFT
    } else
    if (rightKey.isDown && this.phaserObject.x < gameWidth-(gameWidth*0.01)-96) {
        this.phaserObject.animations.play('direita');
        side = Phaser.ANGLE_RIGHT        
    }
    if(side != -5){
        this.phaserObject.body.moveTo(this.moveSpeed,this.moveRange , side);
    }    
    var i = 0;
    for(i=1;i<characterCtrl.personagens.length;i++){
        game.physics.arcade.collide(this.phaserObject, characterCtrl.personagens[i].phaserObject,characterCtrl.personagens[i].destroyItself);
    }        
  }
  destroyItself(killer,victim){
    victim.kill();    
        
  }
}


var characterCtrl = new PersonagemController();
var gameWidth = 900
var gameHeight = 313
var player;
var background;
var upKey;
var downKey;
var leftKey;
var rightKey;
var speed = 5;
var game = new Phaser.Game(gameWidth, gameHeight, Phaser.CANVAS,'game-container', {
        preload: preload, 
        create: create,
        update: update, 
        render: render
    }
);

function startCharacters(){
    //nome,spriteSheet,sizeIndv,vetorParado,vetorEsquerda,vetorDireita,posIniX,posIniY,speed,moveSpeed,defaultPlay,isNPC,moveRange
    var P1 = new Personagem('ryuuku','assets/ryuuku.png',[48,64],[0,1,2,3],[4,5,6,7],[8,9,10,11],gameWidth/2,gameHeight-gameHeight*0.3,5,10,'parado',0,5);
    var P2 = new Personagem('demon','assets/demon.png',[80,80],[0,1,2,3],[4,5,6,7],[8,9,10,11],(gameWidth-gameWidth*0.10),(gameHeight-gameHeight*0.3)-14,3,7500,'esquerda',1,1000);
    var P3 = new Personagem('bahamuth','assets/bahamuth.png',[96,96],[0,1,2,3],[4,5,6,7],[8,9,10,11],(gameWidth*0.01),(gameHeight-gameHeight*0.3)-30,2,7500,'direita',1,1000);
    characterCtrl.add(P1);
    characterCtrl.add(P2);
    characterCtrl.add(P3);    
}

function startDefaults(){
    startCharacters();    
    game.load.image('background', 'assets/background1.jpg');
}


function preload() {
    startDefaults();    
    var i = 0;
    for(i=0;i<characterCtrl.personagens.length;i++){
        characterCtrl.personagens[i].doPreload(game);
    }
}

function create() {
    game.physics.startSystem(Phaser.Physics.ARCADE);
    background = game.add.sprite(0, 0, 'background');
    game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;//FULLSCREEN
    var i = 0;
    for(i=0;i<characterCtrl.personagens.length;i++){
        characterCtrl.personagens[i].doCreate(game);        
    }
    upKey = game.input.keyboard.addKey(Phaser.Keyboard.UP);
    downKey = game.input.keyboard.addKey(Phaser.Keyboard.DOWN);
    leftKey = game.input.keyboard.addKey(Phaser.Keyboard.LEFT);
    rightKey = game.input.keyboard.addKey(Phaser.Keyboard.RIGHT);

    var fullScreenButton = game.input.keyboard.addKey(Phaser.Keyboard.ONE)
    fullScreenButton.onDown.add(toggleFullScreen);
}


function update() {
    var i = 0;
    for(i=0;i<characterCtrl.personagens.length;i++){
        characterCtrl.personagens[i].doUpdate();        
    }        
}

function render() {
}


function toggleFullScreen() {
    game.scale.fullScreenScaleMode = Phaser.ScaleManager.SHOW_ALL
    if (game.scale.isFullScreen) {
        game.scale.stopFullScreen()
    } else {
        game.scale.startFullScreen(false);
    }
}








