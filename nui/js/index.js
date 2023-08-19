$(function(){
    function display(bool) {
        if (bool){
            $(".container").show()
            $(".box").hide()
        } else {
            $(".container").hide()
        }
    }

    display(false)

    window.addEventListener("message", function(event){
        
        let item = event.data
        if (item.type === "ui"){
            if (item.status){
                display(true)
             }
             else {
                display(false)
             }
    }
})


    $(".close").click(function ()
    {$.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({})) })
    $("#brioso").click(function ()
    {$.post(`https://${GetParentResourceName()}/main`, JSON.stringify({data:"brioso"})) })
    $("#bf400").click(function ()
    {$.post(`https://${GetParentResourceName()}/main`, JSON.stringify({data:"bf400"})) })
    $("#sultan").click(function ()
    {$.post(`https://${GetParentResourceName()}/main`, JSON.stringify({data:"sultan"})) })
    $(".info").click(function (){
        $(".box").toggle()
        console.log("puoi togliermi dalla riga 37 del javascript ")
    }
    ) 
    })




