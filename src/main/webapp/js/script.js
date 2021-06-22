function addToCart(pId, pName, pPrice, pQuantity)
{
	let cart = localStorage.getItem("cart");
	if(cart==null)
	{
		// Cart is empty	
		let products=[];
		let product={productId:pId, productName:pName, productQuantity:1, productPrice:pPrice};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));	
		// console.log("Product added for the first time");
		showToast(product.productName + " is added to cart");
	}
	else{
	
		// Cart is already present and we have to increase the quantity of the same product
		let pCart = JSON.parse(cart);
		
		let oldProducts = pCart.find((item) => item.productId == pId);
		
		if(oldProducts)
		{
			// If product Quantity by user exceeds from the max quantity of the product at server side
			// then we have to stop the user from increasing the quantity
			if(oldProducts.productQuantity >= pQuantity)
			{
				// alert("Sorry, maximum quantity reached, you cannot add same item");
				showToast("Sorry, maximum quantity reached, you cannot add same item");
			}
			else
			{
				// else we have to increase the quantity
				oldProducts.productQuantity = oldProducts.productQuantity+1;
				pCart.map((item)=>{
					if(item.productId==oldProducts.productId)
					{
						item.productQuantity = oldProducts.productQuantity;
					}
				})
				localStorage.setItem("cart",JSON.stringify(pCart));
				//console.log("product quantity increased");
				showToast(oldProducts.productName +" quantity increased, quantity = "+oldProducts.productQuantity);
			}

		}
		else{
			// We have to add the product into the cart
			
			let product={productId:pId, productName:pName, productQuantity:1, productPrice:pPrice};
			pCart.push(product);
			localStorage.setItem("cart",JSON.stringify(pCart));
			//console.log("New product is added to the cart");
			showToast(product.productName + " is added to the cart");
			
			}
		 
	}
	
	updateCart();
}

// Update Cart

function updateCart()
{
	let cartString = localStorage.getItem("cart"); // getting cart as a String
	let cart = JSON.parse(cartString);	// converting cart to string
	if(cart==null || cart.length == 0)
	{
		// console.log("Cart is empty!");
		$(".cart-items").html("(0)");
	 	$(".cart-body").html("<h3 class='text-center'>Your cart is empty!</h3>")
		document.getElementById("checkout-btn").disabled = true;
	}
	else{
		// There is some items inside the user cart
		//console.log(cart);
		$(".cart-items").html(`(${cart.length})`);
		document.getElementById("checkout-btn").disabled = false;
		let table = `
			<table class='table'>
				<thead class='thead-light'>
					<tr>
					<th>Item Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total Price</th>
					<th>Action</th>	
						
					
					</tr>
				</thead>
		`;
		
		let totalPrice=0;
		
		cart.map((item)=>{
			table+= `
			<tr>
					<td>${item.productName}</td>
					<td>${item.productPrice}</td>
					<td>${item.productQuantity}</td>
					<td>${item.productQuantity * item.productPrice}</td>	
					<td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button></td>
			</tr>
			` 
			
			totalPrice+=item.productPrice*item.productQuantity;
			
		})
		
		
		table = table + ` <tr><td style="color:black; font-weight:bold;">Total Price = ${totalPrice}</td></tr></table>`	

		$(".cart-body").html(table);		
	}
}

// deleting Item
	
function deleteItemFromCart(pId)
{
	//console.log("delete called");
	
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newCart = cart.filter((item)=> item.productId != pId);
	localStorage.setItem('cart',JSON.stringify(newCart));
	showToast("Product is deleted successfully");
	updateCart();
}

function showToast(content)
{
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 5000);
}

function goToCheckout()
{
	window.location = "checkout.jsp";
}

function continueShopping()
{
	window.location = "index.jsp";
}

$(document).ready(function(){
	updateCart();
})


