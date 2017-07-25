function getOrderInfo(row) {
    console.log('rowww: ', row.cells[0]);
    let title = row.cells[0].innerHTML;
    let description = row.cells[1].innerHTML.split("-");
    let price = row.cells[2].innerHTML;

    console.log('description is: ', description);

    return {
        title: title,
        price: price,
        description: description
    };

}


function orderPizza(id) {
    let idCell = id.split('-')[0];
    let targetRow = document.getElementById(idCell);
    // console.log('targe: ', targetRow);
    let orderInfo = getOrderInfo(targetRow);

    //check if he is logged in
    if (localStorage.email) {

        let ajax = new XMLHttpRequest();
        ajax.onreadystatechange = function() {
            if (ajax.readyState === XMLHttpRequest.DONE && ajax.status === 200) {
                data = JSON.parse(ajax.responseText);
                if (data.message) {
                    window.location.replace(`${config['env'][environment]['reorder']}`);
                } else {
                    console.log("ORDER PIZZA");
                }
            }
        };

        let params = `title=${orderInfo.title}&description=${orderInfo.description}&price=${orderInfo.price}`;
        ajax.open("POST", `api/create/order`, true);
        ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        ajax.send(params);
    } else {
        window.localStorage.setItem("object", JSON.stringify(orderInfo));
        window.location.replace(`${config['env'][environment]['login']}`);
    }

    //if he is send him to checkout

    //if he is not save object to localstorage and send him to log in page


}

function cancelOrder(id){
let idCell = id.split('-')[0];
    let targetRow = document.getElementById(idCell);
    // console.log('targe: ', targetRow);
    let orderInfo = getOrderInfo(targetRow);
    if (localStorage.email) {
	
}
