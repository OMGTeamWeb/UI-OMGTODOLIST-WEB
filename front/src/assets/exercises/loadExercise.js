        function getDataFromHtml(){
            return localStorage.getItem("stringLevel");
        }
        //funcion que se usa en processin 
        //recibe nuevos datos de nivel desde processing
        function returnDataPros(data){
        	dataLevelReturn = data.split(",").map(Number);
        	document.getElementById("getData").value = dataLevelReturn;
            document.getElementById("data").innerHTML = dataLevelReturn;
        }
        //Funcion que recibe el nombre del id del canvas donde esta el PDE 
        //del ejercicio que se está jugando
        //la funcion thingsInBasket() regresa los datos del juego para 
        //ser evaluados
        function nextLevel(nameCanvasPDE){
            var pjs = Processing.getInstanceById(nameCanvasPDE);
            pjs.returnToJS();
        }