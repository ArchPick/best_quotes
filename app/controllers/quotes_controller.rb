class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :winking
#    "There is nothing either good or bad " +
#      "but thinking makes it so." +
#      "\n<pre>\n#{env}\n</pre>"
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def new_quote
    attr = {
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attr
    render :quote, :obj => m
  end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, :obj => quote, :ua => ua
  end

  def exception
    raise "It's a bad one!"
  end
end
# Test to retart
