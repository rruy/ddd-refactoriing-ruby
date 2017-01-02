# DDD/Refactoring

O solução de refactor do código legado esta dividida na seguinte estrutura de arquivos:

   - [Domain]
   Classes contendo o core da aplicação com as classes de negócio
   - [Infrastructure]
   Classes da camada de infrastrutura da aplicação separada da camada de negócio. Ex.: MailService.
   - [Command_handlers]
   Classes com os comandos que serão chamados nos controllers em uma camada MVC, utilizei o padrão CQRS, onde cada chamada de uma ação será um comando, como a realização de um pedido ou a efetivação do pagamento que serão tratados como eventos do sistema.

### Solução para o problema proposto  

Para a solução utilizei o padrão de software strategy onde implementei a classe [PaymentProduct] que é a base para as outras implementações baseado no tipo de item do pedido. Cada classe filha deverá ter um comportamento diferente, permanecendo apenas as assinaturas dos métodos idênticos nas classes filhas.

### Classes filhas de PaymentProduct

- [PaymentProductBook] para a solução do comportamento esperado:
"Caso o pagamento seja um livro comum, você precisa gerar o shipping label com uma notificação de que trata-se de um item isento de impostos conforme disposto na Constituição Art. 150, VI, d."

- [PaymentProductDigital] para a solução do comportamento esperado:
"Caso o pagamento seja de alguma mídia digital (música, vídeo), além de enviar a descrição da compra por e-mail ao comprador, conceder um voucher de desconto de R$ 10 ao comprador associado ao pagamento."

- [PaymentProductMembership] para a solução do comportamento esperado:
"Caso o pagamento seja uma assinatura de serviço, você precisa ativar a assinatura, e notificar o usuário através de e-mail sobre isto."

- [PaymentProductPhysical] para a solução do comportamento esperado:
"Se o pagamento for para um item físico, você deverá gerar um shipping label para o mesmo ser colocado na caixa do envio"

Caso no futuro apareça uma nova necessidade de um comportamento diferente para um outro item basta criar uma classe que herda a classe base [PaymentProductBook] e implementar o comportamento desejado no metodo execute().

Quando o comando [CommandHandler::PaidOrder] for chamado ele será o responsável para delegar ao objeto [CommandHandlers::ReceivedPayment] que é o responsável de intânciar a classe que tem o comportamento esperado com base no order_item passado como parametro para o metodo execute da classe.

[Referência] - https://pt.wikipedia.org/wiki/Strategy
