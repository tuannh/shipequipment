var cart = {

    add: function (productId) {
        var data = { '': productId };
        $.post("/api/cart/add", data, this.addCartComplete);
    },

    update: function (productId, qty) {
        var data = { id: productId, quatity: qty };
        $.post("/api/cart/update", data, this.updateCartComplete);
    },

    remove: function (productId) {
        var data = { '': productId };
        $.post("/api/cart/remove", data, this.removeCartComplete);
    },

    clear: function () {

    },

    addCartComplete: function (data) {
        if (data.error == 0) {
            $('#cart-total').text('Giỏ hàng (' + data.total + ')');
            alert('Thêm sản phẩm vào giỏ hàng thành công.')
        }
        else
            alert(data.message);
    },

    updateCartComplete: function (data) {
        if (data.error == 0) {
            var tr = $(data.rowid);

            tr.find('.calc').html(data.total);

            $('.rowTotal #qty').html(data.quatity);
            $('.rowTotal #total').html(data.sum);
        }
        else
            alert(data.message);
    },

    removeCartComplete: function (data) {
        if (data.error == 0) {
            $(data.rowid).slideUp();
            $(data.rowid).remove();
        }
        else {
            alert(data.message);
        }
    }
};

$(document).ready(function () {

    $('.cart-add').click(function () {
        var id = $(this).attr('data-id');
        cart.add(id);
    })

    $('.cart-remove').click(function () {
        var ok = confirm('Bạn muốn xóa sản phẩm ra khỏi giỏ hàng?');
        if (ok) {
            var id = $(this).attr('data-id');
            cart.remove(id);
        }
    })

    $('.cart-update').blur(function () {
        var id = $(this).attr('data-id');
        var qty = $(this).val();
        cart.update(id, qty)

    }).change(function () {
        var qty = parseInt(this.value);

        if (qty == NaN || qty <= 0) {
            this.value = $(this).attr('data-quatity');
            alert('Số lượng phải là 1 số dương');
        }
        else
            this.value = qty;
    })

    $('.cart-clear').click(function () {
        var id = $(this).attr('data-id');
        cart.clear(id);
    })

    $('cart-continue').click(function () {
        location.href = $(this).attr('data-href');
    })
})