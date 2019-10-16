require 'base64'
require 'json'
require 'sinatra'

get '/health' do
  'OK'
end

post '/fun-label', provides: 'application/json' do
  admission_review = JSON.parse(request.body.read)
  uid = admission_review['request']['uid']
  logger.info { "Processing request uid '#{uid}'" }
  resp = {
    response: {
      uid: uid,
      allowed: true # Allow all requests, this could be extended to reject certain requests
    }
  }

  # This annotation excludes pods from getting the patch
  exclude_annotation = 'mutating-webhook.example.com/exclude'
  annotations = admission_review['request']['object']['metadata']['annotations']
  if annotations && annotations[exclude_annotation]
    logger.info { "Excluding due to annotation '#{exclude_annotation}'" }
    return resp.to_json
  end

  # Set the patch
  labels = admission_review['request']['object']['metadata']['labels']
  if labels
    patch = if labels['fun']
              # Replace the existing label
              [{ op: 'replace', path: '/metadata/labels/fun', value: 'hello' }]
            else
              # Add the label to the existing list of labels
              [{ op: 'add', path: '/metadata/labels/fun', value: 'hello' }]
            end
  else
    # Create the labels object with the new label
    patch = [{ op: 'add', path: '/metadata/labels', value: { fun: 'hello' } }]
  end

  logger.info { "Patch: #{patch}" }
  resp[:response][:patch] = Base64.encode64(patch.to_json)
  resp[:response][:patchType] = 'JSONPatch'

  resp.to_json
end
