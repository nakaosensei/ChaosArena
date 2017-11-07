class Skill {  
  constructor(game,playerObject,nome,spriteSheet,sizeIndv,vetorEsquerda,vetorDireita,speed,moveSpeed,defaultPlay,moveRange,coldown,durationDivider) {
    this.game = game;//Variavel do jogo
    this.playerObject = playerObject;
    this.spriteSheet = spriteSheet;//Caminho para a imagem do spritesheet do personagem
    this.sizeIndv = sizeIndv;//Tamanho de cada sprite do spritesheet
    this.nome = nome;
    this.vetorEsquerda = vetorEsquerda;//Vetor do spritesheet para quando o personagem esta a esquerda
    this.vetorDireita = vetorDireita;//Vetor do spritesheet para quando o personagem esta a direita
    this.speed = speed;//Velocidade de troca das imagens do spritesheet
    this.defaultPlay=defaultPlay;//Sprite que por padrao e executada
    this.moveSpeed = moveSpeed;//Velocidade que o NPC se move
    this.phaserObject = 0;//Objeto do jogo
    this.moveRange = moveRange;
    this.playerObject = playerObject;
    this.rightKey = -1;
    this.leftKey = -1;  
    this.finished = 1;
    this.coldown = coldown;
    this.durationDivider=durationDivider;
    this.castTime = 0;
    this.lastPressed = 0;//0=direita,1=esquerda
  } 

  doPreload(){
    this.game.load.spritesheet(this.nome,this.spriteSheet,this.sizeIndv[0],this.sizeIndv[1]);    
  }

  doCreate(rightKey,leftKey){
       
    this.rightKey = rightKey;
    this.leftKey = leftKey;
    
  }

  doUpdate(){    
    if(game.time.now-this.castTime>this.coldown){//Se ja passou o tempo do coldown    
        if (this.leftKey.isDown && this.finished == 1) {        
            this.finished=0;
            this.castTime = game.time.now;
            this.lastPressed=1;
            this.phaserObject = game.add.sprite(this.playerObject.phaserObject.x-80, this.playerObject.phaserObject.y-10, this.nome);
            this.phaserObject.anchor.setTo(0, 0);       
            this.game.physics.arcade.enable(this.phaserObject);     
            this.phaserObject.frame=2;   
            this.phaserObject.animations.add('esquerda',this.vetorEsquerda,this.speed,true);
            this.phaserObject.animations.play('esquerda');
            characterCtrl.personagens[0].phaserObject.animations.play('atkEsquerda');
            game.time.events.add(Phaser.Timer.SECOND/this.durationDivider, this.fade , this);     
        } else if (this.rightKey.isDown && this.finished==1) {
            this.finished=0;
            this.castTime = game.time.now
            this.lastPressed=0;
            this.phaserObject = game.add.sprite(this.playerObject.phaserObject.x+60, this.playerObject.phaserObject.y-10, this.nome);
            this.phaserObject.anchor.setTo(0, 0);       
            this.game.physics.arcade.enable(this.phaserObject);     
            this.phaserObject.frame=2;   
            this.phaserObject.animations.add('direita',this.vetorDireita,this.speed,true);     
            this.phaserObject.animations.play('direita');                
            characterCtrl.personagens[0].phaserObject.animations.play('atkDireita');
            game.time.events.add(Phaser.Timer.SECOND/this.durationDivider, this.fade , this);
        }        
        var i = 0;
        for(i=1;i<characterCtrl.personagens.length;i++){
            this.game.physics.arcade.collide(this.phaserObject, characterCtrl.personagens[i].phaserObject,characterCtrl.personagens[i].destroyItself);
        }
    }
  }
  destroyItself(destroyer,victim){
      victim.phaserObject.kill();        
  }
  fade(){
    this.game.add.tween(this.phaserObject).to( { alpha: 0 }, 100, Phaser.Easing.Linear.None, true);
    if(this.lastPressed==0){
        characterCtrl.personagens[0].phaserObject.animations.play('direita');    
    }else{
        characterCtrl.personagens[0].phaserObject.animations.play('esquerda');
    }    
    this.finished=1;
    this.phaserObject.destroy();
  }
}