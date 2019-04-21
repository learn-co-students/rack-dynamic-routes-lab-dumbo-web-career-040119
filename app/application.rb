class Application

  @@items = []
  def call(arg)
    resp = Rack::Response.new
    req = Rack::Request.new(arg)

    if req.path.match(/items/)
      i_name = req.path.split("/items/").last
      if item = @@items.find do |item|
        item.name == i_name
      end
      resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
