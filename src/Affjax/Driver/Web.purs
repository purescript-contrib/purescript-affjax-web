module Affjax.Driver.Web
  ( request
  , get
  , post
  , post_
  , put
  , put_
  , delete
  , delete_
  , patch
  , patch_
  ) where

import Prelude

import Affjax (Error, Request, Response, URL)
import Affjax.Driver as AD
import Affjax.Driver (AffjaxDriver)
import Affjax.RequestBody as RequestBody
import Affjax.ResponseFormat as ResponseFormat
import Data.Either (Either)
import Data.Maybe (Maybe)
import Effect.Aff (Aff)

foreign import webDriver :: AffjaxDriver

-- | Makes a `GET` request to the specified URL.
get :: forall a. ResponseFormat.ResponseFormat a -> URL -> Aff (Either Error (Response a))
get = AD.get webDriver

-- | Makes a `POST` request to the specified URL with the option to send data.
post :: forall a. ResponseFormat.ResponseFormat a -> URL -> Maybe RequestBody.RequestBody -> Aff (Either Error (Response a))
post = AD.post webDriver

-- | Makes a `POST` request to the specified URL with the option to send data
-- | and ignores the response body.
post_ :: URL -> Maybe RequestBody.RequestBody -> Aff (Either Error Unit)
post_ = AD.post_ webDriver

-- | Makes a `PUT` request to the specified URL with the option to send data.
put :: forall a. ResponseFormat.ResponseFormat a -> URL -> Maybe RequestBody.RequestBody -> Aff (Either Error (Response a))
put = AD.put webDriver

-- | Makes a `PUT` request to the specified URL with the option to send data
-- | and ignores the response body.
put_ :: URL -> Maybe RequestBody.RequestBody -> Aff (Either Error Unit)
put_ = AD.put_ webDriver

-- | Makes a `DELETE` request to the specified URL.
delete :: forall a. ResponseFormat.ResponseFormat a -> URL -> Aff (Either Error (Response a))
delete = AD.delete webDriver

-- | Makes a `DELETE` request to the specified URL and ignores the response
-- | body.
delete_ :: URL -> Aff (Either Error Unit)
delete_ = AD.delete_ webDriver

-- | Makes a `PATCH` request to the specified URL with the option to send data.
patch :: forall a. ResponseFormat.ResponseFormat a -> URL -> RequestBody.RequestBody -> Aff (Either Error (Response a))
patch = AD.patch webDriver

-- | Makes a `PATCH` request to the specified URL with the option to send data
-- | and ignores the response body.
patch_ :: URL -> RequestBody.RequestBody -> Aff (Either Error Unit)
patch_ = AD.patch_ webDriver

-- | Makes an HTTP request.
-- |
-- | The example below performs a `GET` request to the URL `/resource` and
-- | interprets the response body as JSON.
-- |
-- | ```purescript
-- | import Affjax.ResponseFormat (json)
-- | ...
-- | request (defaultRequest { url = "/resource", method = Left GET, responseFormat = json})
-- | ```
-- |
-- | For common cases helper functions can often be used instead of `request` .
-- | For instance, the above example is equivalent to the following.
-- |
-- | ```purescript
-- | get json "/resource"
-- | ```
request :: forall a. Request a -> Aff (Either Error (Response a))
request = AD.request webDriver
