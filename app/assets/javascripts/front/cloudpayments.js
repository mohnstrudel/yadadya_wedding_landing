this.pay = function () {
    var widget = new cp.CloudPayments();
    widget.charge({ // options
            publicId: 'pk_8fe312fcccfcf8eac2eb2ab3f2e59',  //id из личного кабинета
            description: 'Пример оплаты (деньги сниматься не будут)', //назначение
            amount: 10, //сумма
            currency: 'RUB', //валюта
            invoiceId: '1234567', //номер заказа  (необязательно)
            accountId: 'user@example.com', //идентификатор плательщика (необязательно)
            data: {
                myProp: 'myProp value' //произвольный набор параметров
            }
        },
        function (options) { // success
            //действие при успешной оплате
        },
        function (reason, options) { // fail
            //действие при неуспешной оплате
        });
};    


