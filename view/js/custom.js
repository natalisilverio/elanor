$(function() {
	$(document).on("click", "a#product_list", function(){ getProductList(this); });
});

function getProductList(element) {


	$.post('Controller.php',
		{
			action: 'get_products'
		},
		function(data, textStatus) {
			renderProductList(data);
		},
		"json"
	);
}

function renderProductList(jsonData) {

var count =0;
var content="";
var discountPercentage="";
var wineColor="";
var bottlesSold=0;
var casesLeft=0;

	$.each( jsonData, function( index, product){
		/*Create a new row for boostrap grid*/
		if(count==0)
				content+='<div class="row">';

		/* Check if product has discount associated and add badge tags */
		if(product.discountPercentage!=null)
			discountPercentage = '<span class="fade-in"><button class="btn btn-success btn-xs" type="button">'+product.discountPercentage+'% Off</button></span>';
console.log(product.wineColorId);
		/* Wine color fa definition */
		if(product.wineColorId=="1")
			wineColor='fa-wine-red';
		else if (product.wineColorId=="2")
			wineColor='fa-wine-white';
		else if (product.wineColorId=="3")
			wineColor='fa-wine-white';

		/* Mock data for bottles sold and cases left */
		bottlesSold = parseInt(Math.random() * (20 - 8) + 8, 10);
		casesLeft= parseInt(Math.random() * (10 - 3) + 3, 10);


		/* html content */
		content+='<a href="#">';
		content+='<div class="col-xs-12 col-sm-4 wine-box">';
		content+='<img src="./view/img/wines/'+product.productId+'.jpg" width="250" height="250" class="img-responsive center-block">';
		content+='<h4 class="blue wine-title-header">'+product.productTitle+' - €'+product.bottleprice+' <span class="smaller light-gray">per bottle</span></h4>';
		content+='<i class="fa fa-star fa-yellow"></i><i class="fa fa-star fa-yellow"></i><i class="fa fa-star fa-yellow"></i><i class="fa fa-star fa-yellow"></i><i class="fa fa-star fa-yellow"></i>  ';
		content+=discountPercentage;
		content+='<ul class="list-inline wine-details-list">';
		content+='<li><i class="fa fa-glass '+wineColor+'"></i> <span class="wine-details">'+product.grapeTypeName+'</span> </li>';
		content+='<li><i class="fa fa-certificate"></i> <span class="wine-details">'+product.vintageYear+'</span></li>';
		content+='<li><i class="fa fa-yelp"></i> <span class="wine-details">'+product.blendDescription+'</span></li>';
		content+='<li><i class ="fa fa-percent"></i> <span class="wine-details">'+product.alcoholPercentage+'% alcohol</span></li>';
		content+='<li><span class="blink_me"><span class="cases-left-label light-blue">only '+casesLeft+' cases left</span></span></li>';
		content+='</ul>';
		content+='<p class="wine-info">'+product.productDescription.substring(0,100)+'[..]</p>';
		content+='<ul class="list-inline wine-details-list">';
		content+='<li><div class="uppercase-label orange">'+bottlesSold+' cases sold today</div></li>';
		content+='</ul>';
		content+='</div>';
		content+='</a>';
		count++;
		discountPercentage="";

		/* Closes div for bootstrap grid*/
		if (count==3) {
			content += '</div>';
			count =0;
		}

    });
	$('div#content').html(content);

}
