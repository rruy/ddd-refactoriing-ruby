module Infrastructure
    class MailerService

        class << self
            def send(to, from = "contato@domain.com.br", subject, body)
                 raise NotImplementedError, ''
            end
        end
    end
end
