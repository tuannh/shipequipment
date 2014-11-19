var cart = {

    add: function (productId, callback) {
        var data = { '': productId };
        $.post("/api/cart/add", data, callback);
    },

    update: function (productId, number) {
    },

    remove: function (productId, callback) {
        var data = { '': productId };
        $.post("/api/cart/remove", data, callback);
    },

    clear: function () {

    },

    success: function (data) {
        alert(data);
    }

};


$(document).ready(function () {

    $('.cart-add').click(function () {
        var id = $(this).attr('data-id');
        cart.add(id, updateCart);
    })

    $('.cart-remove').click(function () {
        var id = $(this).attr('data-id');
        cart.remove(id, removeCart);
    })

    $('.cart-update').click(function () {
        var id = $(this).attr('data-id');
        cart.update(id);
    })

    $('.cart-clear').click(function () {
        var id = $(this).attr('data-id');
        cart.clear(id);
    })

})

function updateCart(data) {
    if (data.error == 0) {
        $('#cart-total').text('Giỏ hàng (' + data.total + ')');
        alert('Thêm sản phẩm vào giỏ hàng thành công.')
    }
    else
        alert(data.message);
}

function removeCart(data) {
    if (data.error == 0) {
        $('#cart-total').text('Giỏ hàng (' + data.total + ')');
        alert('Thêm sản phẩm vào giỏ hàng thành công.')
    }
    else
        alert(data.message);
}
