##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class MessageContext < InstanceContext
            class MediaList < ListResource
              ##
              # Initialize the MediaList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the Account responsible for this
              #   media.
              # @param [String] message_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [MediaList] MediaList
              def initialize(version, account_sid: nil, message_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    message_sid: message_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Messages/#{@solution[:message_sid]}/Media.json"
              end

              ##
              # Lists MediaInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Time] date_created_before Filter by date created
              # @param [Time] date_created Filter by date created
              # @param [Time] date_created_after Filter by date created
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(date_created_before: :unset, date_created: :unset, date_created_after: :unset, limit: nil, page_size: nil)
                self.stream(
                    date_created_before: date_created_before,
                    date_created: date_created,
                    date_created_after: date_created_after,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams MediaInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Time] date_created_before Filter by date created
              # @param [Time] date_created Filter by date created
              # @param [Time] date_created_after Filter by date created
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(date_created_before: :unset, date_created: :unset, date_created_after: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    date_created_before: date_created_before,
                    date_created: date_created,
                    date_created_after: date_created_after,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields MediaInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(
                    page_size: limits[:page_size],
                )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of MediaInstance records from the API.
              # Request is executed immediately.
              # @param [Time] date_created_before Filter by date created
              # @param [Time] date_created Filter by date created
              # @param [Time] date_created_after Filter by date created
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of MediaInstance
              def page(date_created_before: :unset, date_created: :unset, date_created_after: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'DateCreated<' => Twilio.serialize_iso8601_datetime(date_created_before),
                    'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                    'DateCreated>' => Twilio.serialize_iso8601_datetime(date_created_after),
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                MediaPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of MediaInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of MediaInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                MediaPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.MediaList>'
              end
            end

            class MediaPage < Page
              ##
              # Initialize the MediaPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [MediaPage] MediaPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of MediaInstance
              # @param [Hash] payload Payload response from the API
              # @return [MediaInstance] MediaInstance
              def get_instance(payload)
                MediaInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    message_sid: @solution[:message_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.MediaPage>'
              end
            end

            class MediaContext < InstanceContext
              ##
              # Initialize the MediaContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] message_sid The message_sid
              # @param [String] sid The media Sid that uniquely identifies this resource
              # @return [MediaContext] MediaContext
              def initialize(version, account_sid, message_sid, sid)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    message_sid: message_sid,
                    sid: sid,
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Messages/#{@solution[:message_sid]}/Media/#{@solution[:sid]}.json"
              end

              ##
              # Deletes the MediaInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Fetch a MediaInstance
              # @return [MediaInstance] Fetched MediaInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                MediaInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    message_sid: @solution[:message_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.MediaContext #{context}>"
              end
            end

            class MediaInstance < InstanceResource
              ##
              # Initialize the MediaInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The unique id of the Account responsible for this
              #   media.
              # @param [String] message_sid A 34 character string that uniquely identifies this
              #   resource.
              # @param [String] sid The media Sid that uniquely identifies this resource
              # @return [MediaInstance] MediaInstance
              def initialize(version, payload, account_sid: nil, message_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'content_type' => payload['content_type'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'parent_sid' => payload['parent_sid'],
                    'sid' => payload['sid'],
                    'uri' => payload['uri'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'message_sid' => message_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [MediaContext] MediaContext for this MediaInstance
              def context
                unless @instance_context
                  @instance_context = MediaContext.new(
                      @version,
                      @params['account_sid'],
                      @params['message_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The unique sid that identifies this account
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The default mime-type of the media
              def content_type
                @properties['content_type']
              end

              ##
              # @return [Time] The date this resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The unique id of the resource that created the media.
              def parent_sid
                @properties['parent_sid']
              end

              ##
              # @return [String] A string that uniquely identifies this media
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The URI for this resource
              def uri
                @properties['uri']
              end

              ##
              # Deletes the MediaInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Fetch a MediaInstance
              # @return [MediaInstance] Fetched MediaInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.MediaInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end