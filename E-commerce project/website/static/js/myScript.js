$(document).on('click', '.plus-cart', function (e) {
    e.preventDefault();
    var $btn = $(this);
    if ($btn.data('processing')) return;
    $btn.data('processing', true);

    var id = $btn.attr('pid').toString();

    $.ajax({
        type: 'GET',
        url: '/pluscart',
        data: {
            cart_id: id
        },
        success: function (data) {
            if (data.error) return;
            $(`#quantity-${id}`).text(data.quantity);
            $(`#summary-qty-${id}`).text(data.quantity);

            $('#amount').text(data.amount.toFixed(2));
            $('#total').text(data.total.toFixed(2));
        },
        error: function (err) {
            console.error('Error updating plus cart:', err);
        },
        complete: function () {
            $btn.data('processing', false);
        }
    });
});

$(document).on('click', '.minus-cart', function (e) {
    e.preventDefault();
    var $btn = $(this);
    if ($btn.data('processing')) return;
    $btn.data('processing', true);

    var id = $btn.attr('pid').toString();

    $.ajax({
        type: 'GET',
        url: '/minuscart',
        data: {
            cart_id: id
        },
        success: function (data) {
            if (data.quantity === 0) {
                $(`#cart-row-${id}`).remove();
                $(`#hr-${id}`).remove();
                $(`#summary-item-${id}`).remove();
            } else {
                $(`#quantity-${id}`).text(data.quantity);
                $(`#summary-qty-${id}`).text(data.quantity);
            }

            $('#amount').text(data.amount.toFixed(2));
            $('#total').text(data.total.toFixed(2));
        },
        error: function (err) {
            console.error('Error updating minus cart:', err);
        },
        complete: function () {
            $btn.data('processing', false);
        }
    });
});

$(document).on('click', '.remove-cart', function (e) {
    e.preventDefault();
    var $btn = $(this);
    if ($btn.data('processing')) return;
    $btn.data('processing', true);

    var id = $btn.attr('pid').toString();

    $.ajax({
        type: 'GET',
        url: '/removecart',
        data: {
            cart_id: id
        },
        success: function (data) {
            $(`#cart-row-${id}`).remove();
            $(`#hr-${id}`).remove();
            $(`#summary-item-${id}`).remove();

            $('#amount').text(data.amount.toFixed(2));
            $('#total').text(data.total.toFixed(2));
        },
        error: function (err) {
            console.error('Error removing item from cart:', err);
        },
        complete: function () {
            $btn.data('processing', false);
        }
    });
});