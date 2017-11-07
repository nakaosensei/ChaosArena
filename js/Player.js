class Player {  
  constructor(game,nome,spriteSheet,sizeIndv,vetorParado,vetorEsquerda,vetorDireita,vetorAtkDireita,vetorAtkEquerda,vetorMorrendo,vetorHit,posIniX,posIniY,speed,moveSpeed,defaultPlay,moveRange) {
    this.game = game;//Variavel do jogo
    this.spriteSheet = spriteSheet;//Caminho para a imagem do spritesheet do personagem
    this.sizeIndv = sizeIndv;//Tamanho de cada sprite do spritesheet
    this.nome = nome;
    this.vetorParado = vetorParado;//Vetor do spritesheet para quando o personagem esta parado
    this.vetorEsquerda = vetorEsquerda;//Vetor do spritesheet para quando o personagem esta a esquerda
    this.vetorDireita = vetorDireita;//Vetor do spritesheet para quando o personagem esta a direita
    this.vetorAtkDireita = vetorAtkDireita;
    this.vetorAtkEquerda = vetorAtkEquerda;
    this.vetorMorrendo = vetorMorrendo;
    this.vetorHit = vetorHit;
    this.posIniX = posIniX;
    this.posIniY = posIniY;
    this.speed = speed;//Velocidade de troca das imagens do spritesheet
    this.defaultPlay=defaultPlay;//Sprite que por padrao e executada
    this.moveSpeed = moveSpeed;//Velocidade que o NPC se move
    this.phaserObject = 0;//Objeto do jogo
    this.moveRange = moveRange;
    this.lastActionTime = 0;//Tempo de termino da ultima acao
    this.rightKey = -1;    
    this.leftKey = -1;    
    this.hit = 0;
    //Variaveis da vida
    this.lifeTotal = 4;
    this.lifeBar = 0;  
    this.fourLifeVet=[0];
    this.threeLifeVet=[1];
    this.twoLifeVet=[2];
    this.oneLifeVet=[3];
    this.zeroLifeVet=[4];
    this.darkBalls=0;  
  } 

  doPreload(){
    this.game.load.spritesheet(this.nome,this.spriteSheet,this.sizeIndv[0],this.sizeIndv[1]);
    this.game.load.spritesheet("lifeTotals","assets/lifeTotals.png",157,34);    
  }

  doCreate(rightKey,leftKey){
    this.lifeBar = game.add.sprite(0,0,"lifeTotals");
    this.lifeBar.anchor.setTo(0,0);
    this.lifeBar.animations.add('4life',this.fourLifeVet,1,false);
    this.lifeBar.animations.add('3life',this.threeLifeVet,1,false);
    this.lifeBar.animations.add('2life',this.twoLifeVet,1,false);
    this.lifeBar.animations.add('1life',this.oneLifeVet,1,false);
    this.lifeBar.animations.add('0life',this.zeroLifeVet,1,false);
    this.lifeBar.animations.play('4life');

    this.phaserObject = game.add.sprite(this.posIniX, this.posIniY, this.nome);
    this.phaserObject.anchor.setTo(0, 0);       
    this.game.physics.arcade.enable(this.phaserObject);     
    this.phaserObject.frame=2;
    this.phaserObject.animations.add('parado',this.vetorParado,this.speed,true);
    this.phaserObject.animations.add('esquerda',this.vetorEsquerda,this.speed,true);
    this.phaserObject.animations.add('direita',this.vetorDireita,this.speed,true);
    this.phaserObject.animations.add('atkDireita',this.vetorAtkDireita,this.speed,true);
    this.phaserObject.animations.add('atkEsquerda',this.vetorAtkEquerda,this.speed,true);
    this.phaserObject.animations.add('morrendo',this.vetorMorrendo,this.speed,true);
    this.phaserObject.animations.add('damaged',this.vetorHit,this.speed,true);
    this.phaserObject.animations.play(this.defaultPlay);    
    this.rightKey = rightKey;
    this.leftKey = leftKey;
  }

  doUpdate(){
    if(this.lifeTotal<=0){
        return 0;
    }
    var side = -5    
    if (this.leftKey.isDown && this.phaserObject.x > 0 + 48) {        
        this.phaserObject.animations.play('esquerda');
        side = Phaser.ANGLE_LEFT
    } else if (this.rightKey.isDown && this.phaserObject.x < gameWidth-(gameWidth*0.01)-96) {
        this.phaserObject.animations.play('direita');
        side = Phaser.ANGLE_RIGHT        
    }
    if(side != -5){
        this.phaserObject.body.moveTo(this.moveSpeed,this.moveRange , side);            
    }
    var i = 0;    
    for(i=1;i<characterCtrl.personagens.length;i++){
        time = game.time.now;
        this.game.physics.arcade.collide(this.phaserObject, characterCtrl.personagens[i].phaserObject,characterCtrl.personagens[i].destroyPlayer);
    }
    if(drop!=0){
        this.game.physics.arcade.collide(this.phaserObject, drop,dropDestroy);
    }

    if(this.hit==0){
        this.lastActionTime = game.time.now;        
    }else{                    
       if(game.time.now - this.lastActionTime > 1000){
          this.lifeTotal = this.lifeTotal-1;
          this.phaserObject.animations.play('parado');
          if(this.lifeTotal==3){
              this.lifeBar.animations.play('3life');
          }else if(this.lifeTotal==2){
              this.lifeBar.animations.play('2life');
          }else if(this.lifeTotal==1){
               this.lifeBar.animations.play('1life');
          }else if(this.lifeTotal==0){
               this.lifeBar.animations.play('0life');
               this.phaserObject.destroy();               
          }
          this.hit=0;
       }
    }   
  }

  nop(){    
  }



  die(){
    this.phaserObject.destroy();
  }

}

function dropDestroy(){
  drop.destroy();
  drop = 0;
  darkball.quantity = darkball.quantity+1;
  darkball.qtText.text  = ''+darkball.quantity;
  
}