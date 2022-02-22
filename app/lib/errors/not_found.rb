module Errors
  class NotFound < Errors::StandardError
    def initialize
      super(
        title: 'Record not Found',
        status: 404,
        detail: 'We could not find the object you were looking for.',
        source: { pointer: '/users/:id' }
      )
    end
  end
end
