module Comments
  class CreateService
    def self.call(post, comment_params)
      new(post, comment_params).call
    end

    def initialize(post, comment_params)
      @post = post
      @comment_params = comment_params
    end

    def call
      post.comments.create(comment_params)
    end

    private

    attr_reader :post, :comment_params
  end
end
