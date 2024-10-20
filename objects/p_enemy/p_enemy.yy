{
  "$GMObject":"",
  "%Name":"p_enemy",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"p_enemy",
  "overriddenProperties":[],
  "parent":{
    "name":"Enemies",
    "path":"folders/Objects/Entities/Enemies.yy",
  },
  "parentObjectId":{
    "name":"p_entity",
    "path":"objects/p_entity/p_entity.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"enemyWanderDistance","filters":[],"listItems":[],"multiselect":false,"name":"enemyWanderDistance","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"32","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemySpeed","filters":[],"listItems":[],"multiselect":false,"name":"enemySpeed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0.75","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyAggroRadius","filters":[],"listItems":[],"multiselect":false,"name":"enemyAggroRadius","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"48","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyGiveUpRange","filters":[],"listItems":[],"multiselect":false,"name":"enemyGiveUpRange","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"60","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyHP","filters":[],"listItems":[],"multiselect":false,"name":"enemyHP","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyForceTouch","filters":[],"listItems":[],"multiselect":false,"name":"enemyForceTouch","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"32","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyDamageTouch","filters":[],"listItems":[],"multiselect":false,"name":"enemyDamageTouch","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"20","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"breakRubberOnContact","filters":[],"listItems":[],"multiselect":false,"name":"breakRubberOnContact","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"False","varType":3,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":null,
  "spriteMaskId":null,
  "visible":true,
}