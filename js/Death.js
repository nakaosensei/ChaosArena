class Death {  
   constructor(game,nome,spriteSheet,sizeIndv,vetorParado,vetorEsquerda,vetorDireita,posIniX,posIniY,speed,moveSpeed,defaultPlay,moveRange) {
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
    this.moveRange = moveRange;
    this.game = game;    
  } 

  doPreload(){
    this.game.load.spritesheet(this.nome,this.spriteSheet,this.sizeIndv[0],this.sizeIndv[1]);    
  }

  doCreate(){    
    this.phaserObject = this.game.add.sprite(this.posIniX, this.posIniY, this.nome)
    this.phaserObject.anchor.setTo(0, 0);       
    this.game.physics.arcade.enable(this.phaserObject);     
    this.phaserObject.frame=2;
    this.phaserObject.animations.add('direita',this.vetorDireita,this.speed,true);
    this.phaserObject.animations.play('direita'); 
    this.phaserObject.body.moveTo(this.moveSpeed,this.moveRange,Phaser.ANGLE_RIGHT);
    /*
    this.phaserObject = this.game.add.group();
    this.phaserObject.enableBody = true;    
    this.phaserObject.physicsBodyType = Phaser.Physics.ARCADE;
    this.phaserObject.create(this.posIniX,this.posIniY,this.nome,null,true);
    
    this.phaserObject.callAll('animations.add', 'animations', this.spritesheet, this.vetorDireita, this.speed, true);
    this.phaserObject.callAll('play',null,this.spritesheet);
    this.phaserObject.callAll('body.moveTo', 'body', this.moveSpeed,this.moveRange , side);*/
  }


  doUpdate(){      
  }
 
  destroyItself(destroyer,victim){
      score = score+1;
      numEnemies = numEnemies -1;
      scoreText.text = 'KILLS:'+score;
      var deathDrop = Math.floor(Math.random() * 10) + 1;
      if(drop==0&&(deathDrop==1)){
         drop = game.add.sprite(victim.x,victim.y+20,"darkballSyn");
         drop.anchor.setTo(0,0);  
         game.physics.arcade.enable(drop);
         drop.frame=1;
      }
      victim.destroy();      
  }
  destroyPlayer(player,victim){
      if(characterCtrl.personagens[0].lifeTotal==1){
          player.animations.play('morrendo');
      }else{
          player.animations.play('damaged');
          characterCtrl.personagens[0].lifeTotal = 1;
      }              
      characterCtrl.personagens[0].hit=1;
  }
}