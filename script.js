// WITHOUT LOGOUT

function loadproducts() {
  var name = $("#search").val();
  if (name) {
    $.ajax({
      type: 'post',
      url: 'loadproducts.php',
      data: { products: name },
      success: function (response) {
        $('#products').html(response);
      },
      error: function (err) {
        console.error("Failed to load products:", err);
      },
    });
  }
}

$(document).ready(function () {
  $('#customer_search').typeahead({
    source: function (query, result) {
      $.ajax({
        url: 'loadcustomer.php',
        method: "POST",
        data: { query },
        dataType: "json",
        success: function (data) {
          result($.map(data, item => item));
        },
        error: function (err) {
          console.error("Failed to load customer suggestions:", err);
        },
      });
    },
  });

  document.getElementById("search").focus();
});

function GrandTotal() {
  let totalValue = 0;
  const totalPriceArr = $('#tableData tr .totalPrice').get();
  let discount = parseFloat($('#discount').val());

  $(totalPriceArr).each(function () {
    totalValue += parseFloat($(this).text().replace(/,/g, "").replace("₱", ""));
  });

  if (!isNaN(discount) && discount >= 0) {
    const finalTotal = totalValue - discount;
    $("#totalValue").text(accounting.formatMoney(finalTotal, { symbol: "₱", format: "%s %v" }));
  } else {
    $("#totalValue").text(accounting.formatMoney(totalValue, { symbol: "₱", format: "%s %v" }));
  }

  $("#totalValue1").text(accounting.formatMoney(totalValue, { format: "%v" }));
}

$(document).on('change', '#discount', GrandTotal);

$('body').on('click', '.js-add', function () {
  const product = $(this).attr('data-product');
  const price = parseFloat($(this).attr('data-price'));
  const barcode = $(this).attr('data-barcode');
  const unit = $(this).attr('data-unit');

  swal({
    title: "Enter number of items:",
    content: "input",
  }).then((value) => {
    const quantity = parseInt(value, 10);

    if (!value || isNaN(quantity)) {
      swal("Error", "Please enter a valid number!", "error");
      return;
    }

    const total = quantity * price;
    $('#tableData').append(`
      <tr class='prd'>
        <td class='barcode text-center'>${barcode}</td>
        <td class='text-center'>${product}</td>
        <td class='price text-center'>${accounting.formatMoney(price, { symbol: "₱", format: "%s %v" })}</td>
        <td class='text-center'>${unit}</td>
        <td class='qty text-center'>${quantity}</td>
        <td class='totalPrice text-center'>${accounting.formatMoney(total, { symbol: "₱", format: "%s %v" })}</td>
        <td class='text-center p-1'>
          <button class='btn btn-danger btn-sm' type='button' id='delete-row'><i class='fas fa-times-circle'></i></button>
        </td>
      </tr>
    `);

    GrandTotal();
  });
});

$("body").on('click', '#delete-row', function () {
  const row = $(this).parents("tr");
  swal({
    title: "Remove this item?",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  }).then((willDelete) => {
    if (willDelete) {
      row.remove();
      swal("Removed Successfully!", { icon: "success" });
      GrandTotal();
    }
  });
});

$(document).on('click', '.Enter', function () {
  const customerName = $.trim($('#customer_search').val());
  const totalPriceArr = $('#tableData tr .totalPrice').get();

  if (!customerName) {
    swal("Warning", "Please Enter Customer Name!", "warning");
    return;
  }

  if (totalPriceArr.length === 0) {
    swal("Warning", "No products ordered!", "warning");
    return;
  }

  const product = [];
  const quantity = [];
  const price = [];
  const user = $('#uname').val();
  const customer = $('#customer_search').val();
  const discount = $('#discount').val();

  $('.barcode').each(function () {
    product.push($(this).text());
  });
  $('.qty').each(function () {
    quantity.push($(this).text());
  });
  $('.price').each(function () {
    price.push($(this).text().replace(/,/g, "").replace("₱", ""));
  });

  swal({
    title: "Enter Cash",
    content: "input",
  }).then((value) => {
    const cash = parseFloat(value);
    const totalValue = parseFloat($('#totalValue').text().replace(/,/g, "").replace("₱", ""));

    if (!value || isNaN(cash) || cash < totalValue) {
      swal("Error", "Invalid cash amount or insufficient!", "error");
      return;
    }

    const change = cash - totalValue;
    $.ajax({
      url: "insert_sales.php",
      method: "POST",
      data: { totalvalue: totalValue, product, price, user, customer, quantity, discount },
      success: function (data) {
        if (data === "success") {
          swal({
            title: `Change is ${accounting.formatMoney(change, { symbol: "₱", format: "%s %v" })}`,
            icon: "success",
            buttons: "Okay",
          }).then(() => {
            window.location.href = 'employee_page.php';
          });
        } else {
          window.location.href = `employee_page.php?${data}`;
        }
      },
      error: function (err) {
        console.error("Failed to process sale:", err);
      },
    });
  });
});

function out() {
  var lag = "logout";
  swal({
    title: "Logout?",
    icon: "warning",
    buttons: ["Cancel", "Yes"],
    dangerMode: true,
  })
    .then((value) => {
      if (value) {
        if (lag) {
          $.ajax({
            type: 'post',
            data: {
              logout: lag
            },
            url: 'server/connection.php',
            success: function (data) {
              window.location.href = 'index.php';
            }
          });
        }
      }
    })
};