'use strict'

var characterCtrl = new PersonagemController();
var gameWidth = 900
var gameHeight = 313
var player;
var background;
var darkball;
var upKey;
var scoreText;
var downKey;
var leftKey;
var rightKey;
var time;
var leftKeyBasicAttack;
var rightKeyBasicAttack;
var leftKeyDarkBall;
var rightKeyDarkBall;
var speed = 5;
var skill;
var sprite;
var score=0;
var numEnemies=0;
var lastCreationMobTime=0;
var enemycode = 1;
var spawnTime = 2000;
var drop=0;
var game = new Phaser.Game(gameWidth, gameHeight, Phaser.CANVAS,'game-container', {
        preload: preload, 
        create: create,
        update: update, 
        render: render
    }
);


function startCharacters(){
    //game,nome,spriteSheet,sizeIndv,vetorParado,vetorEsquerda,vetorDireita,posIniX,posIniY,speed,moveSpeed,defaultPlay,moveRange
    //game,nome,spriteSheet,sizeIndv,vetorParado,vetorEsquerda,vetorDireita,vetorAtkDireita,vetorAtkEquerda,vetorMorrendo,posIniX,posIniY,speed,moveSpeed,defaultPlay,moveRange,posArary
    var P1 = new Player(game,'player','assets/redMage2.png',[49,80],[6,7,8,9,10,11],[6,7,8,9,10,11],[0,1,2,3,4],[12,13],[14,15],[17],[16],gameWidth/2,gameHeight-gameHeight*0.35,5,10,'parado',5);
    var P2 = new Demon(game,'demon',  'assets/demon.png',[80,80],[0,1,2,3],[4,5,6,7],[8,9,10,11],(gameWidth-gameWidth*0.10),(gameHeight-gameHeight*0.3)-14,3,4000,'esquerda',1000,1);
    var P3 = new Dragon(game,'bahamuth','assets/bahamuth.png',[96,96],[0,1,2,3],[4,5,6,7],[8,9,10,11],(gameWidth*0.01),(gameHeight-gameHeight*0.3)-30,2,7500,'direita',1000);
    //game,playerObject,nome,spriteSheet,sizeIndv,vetorEsquerda,vetorDireita,speed,moveSpeed,defaultPlay,moveRange,coldown,durationDivider
    skill = new Skill(game,P1,'blood','assets/blood.png',[79,84],[0],[1],10,0,'esquerda',0,500,3);
    darkball = new Darkball(game,P1,'darkball','assets/darkball.png',[65,34],[0],[1],10,7000,'esquerda',5000,0,3);
    numEnemies=0;
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
    time = game.time.now;    
    var i = 0;
    for(i=0;i<characterCtrl.personagens.length;i++){
        characterCtrl.personagens[i].doPreload(game);
    }
    skill.doPreload();
    darkball.doPreload();
    game.load.image('logo', 'assets/dude.png');
}

function create() {
    game.physics.startSystem(Phaser.Physics.ARCADE);
    background = game.add.sprite(0, 0, 'background');
    game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;//FULLSCREEN
    var i = 0;
    leftKey = game.input.keyboard.addKey(Phaser.Keyboard.LEFT);
    rightKey = game.input.keyboard.addKey(Phaser.Keyboard.RIGHT);

    leftKeyBasicAttack = game.input.keyboard.addKey(Phaser.Keyboard.A);
    rightKeyBasicAttack = game.input.keyboard.addKey(Phaser.Keyboard.D);

    leftKeyDarkBall = game.input.keyboard.addKey(Phaser.Keyboard.Q);
    rightKeyDarkBall = game.input.keyboard.addKey(Phaser.Keyboard.E);

    characterCtrl.personagens[0].doCreate(rightKey,leftKey);
    //for(i=1;i<characterCtrl.personagens.length;i++){
    //    characterCtrl.personagens[i].doCreate();        
    //}
    
    skill.doCreate(rightKeyBasicAttack,leftKeyBasicAttack);  
    darkball.doCreate(rightKeyDarkBall,leftKeyDarkBall);
    //var npcTween = game.add.tween(skill.phaserObject.body).to( { x: skill.phaserObject.body.x+10}, game.width/0.2 ).loop(0).start(); 
    //var npcTween = game.add.tween(skill.phaserObject).to( { alpha: 1 }, 2000, Phaser.Easing.Linear.None, true, 0, 1000, true); 
    var fullScreenButton = game.input.keyboard.addKey(Phaser.Keyboard.ONE);
    fullScreenButton.onDown.add(toggleFullScreen);

    sprite = game.add.sprite(game.world.centerX, game.world.centerY, 'logo');

    sprite.anchor.setTo(0.5, 0.5);
    //sprite.alpha = 0;
    game.time.events.add(Phaser.Timer.SECOND/6, fadePicture , this);
    scoreText = game.add.text(gameWidth/2-gameWidth*0.10, 16, 'KILLS:0', { fontSize: '32px', fill: '#000' });
}

function update() {
    var i = 0;
    for(i=0;i<characterCtrl.personagens.length;i++){
        characterCtrl.personagens[i].doUpdate();        
    }        
    skill.doUpdate();
    darkball.doUpdate();
    var tmpP;
    enemycode = 0;

    if(numEnemies<10 && (game.time.now-lastCreationMobTime) > spawnTime){
        lastCreationMobTime=game.time.now;
        enemycode = Math.floor(Math.random() * 2) + 1;//Gera um numero aleatorio entre 1 e 2
        if(enemycode==1){
            tmpP = new Demon(game,'demon',  'assets/demon.png',[80,80],[0,1,2,3],[4,5,6,7],[8,9,10,11],(gameWidth-gameWidth*0.10),(gameHeight-gameHeight*0.3)-14,3,4000,'esquerda',1000);
        }else if(enemycode==2){
            tmpP = new Dragon(game,'bahamuth','assets/bahamuth.png',[96,96],[0,1,2,3],[4,5,6,7],[8,9,10,11],(gameWidth*0.01),(gameHeight-gameHeight*0.3)-30,2,7500,'direita',1000);
        }
        
        characterCtrl.add(tmpP);
        tmpP.doCreate();
        numEnemies = numEnemies+1;       
        spawnTime = Math.floor(Math.random() * 1500) + 1;
        if(spawnTime<100){
            spawnTime+=200;
        }
    }

}

function fadePicture() {

    game.add.tween(sprite).to( { alpha: 0 }, 2000, Phaser.Easing.Linear.None, true);

}

function render() {

    //game.debug.text("Time until event: " + game.time.events.duration, 32, 32);

}


function toggleFullScreen() {
    game.scale.fullScreenScaleMode = Phaser.ScaleManager.SHOW_ALL
    if (game.scale.isFullScreen) {
        game.scale.stopFullScreen()
    } else {
        game.scale.startFullScreen(false);
    }
}