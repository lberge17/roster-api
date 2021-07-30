class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/notes/) && req.patch?      # PATCH /notes/:id

      note = Note.find_by_path(req.path)

      if note
        data = JSON.parse(req.body.read)

        if note.update(data)
          return [200, {"Content-Type" => "application/json"}, [{message: "note successfully updated", note: note}.to_json]]
        else
          return [422, {"Content-Type" => "application/json"}, [{message: "invalid data"}]]
        end

      else
        # note wasn't found
        return [404, {"Content-Type" => "application/json"}, [{message: "note not found"}.to_json]]
      end

      # code here
      # response here
    elsif req.path.match(/notes/) && req.delete?     # DELETE /notes/:id

      note = Note.find_by_path(req.path)

      if note && note.destroy
        # note was found
        return [200, {"Content-Type" => "application/json"}, [{message: "note successfully deleted", note: note}.to_json]]
      else
        # note doesn't exist
        return [404, {"Content-Type" => "application/json"}, [{message: "note not found"}]]
      end

    elsif req.path.match(/notes/) && req.post?  # POST /notes

      hash = JSON.parse(req.body.read)
      note = Note.create(hash)

      return [200, {"Content-Type" => "application/json"}, [{message: "note successfully created", note: note}.to_json]]
      # code here
      # response here

    elsif req.path.match(/notes/) && req.get?     # GET /notes

      return [200, {"Content-Type" => "application/json"}, [{message: "request successful", notes: Note.render_all}.to_json]]
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