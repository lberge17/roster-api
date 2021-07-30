class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/notes/) && req.patch?      # PATCH /notes/:id
      # code here
      # response here
    elsif req.path.match(/notes/) && req.delete?     # DELETE /notes/:id

    elsif req.path.match(/notes/) && req.post?  # POST /notes
      # code here
      # response here
    elsif req.path.match(/notes/) && req.get?     # GET /notes
      notes = Note.all.map {|n| {
        content: n.content,
        student: n.student,
        roster: n.roster
      }}

      return [200, {"Content-Type" => "application/json"}, [{message: "request successful", notes: notes}.to_json]]
      # resp.write({message: "success", notes: notes}.to_json)
      # resp.status = 200

    else
      resp.write "Path not Found"
      resp.status = 404
    end

    resp.finish
  end

end

# GET /notes ALL NOTES
# POST /notes CREATE A NEW NOTE
# PATCH /notes/:id UPDATE NOTE BY ID
# DELETE /notes/:id DELETE NOTE BY ID