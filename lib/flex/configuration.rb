module Flex

  Configuration = OpenStruct.new :result_extenders => [ Result::Document,
                                                        Result::SourceDocument,
                                                        Result::Search,
                                                        Result::MultiGet,
                                                        Result::SourceSearch,
                                                        Result::Bulk ],
                                 :logger           => Logger.new(STDERR),
                                 :variables        => Vars.new( :index      => nil,
                                                                :type       => nil,
                                                                :params     => {},
                                                                :no_pruning => [] ),
                                 :flex_models      => [],
                                 :config_file      => './config/flex.yml',
                                 :flex_dir         => './flex',
                                 :http_client      => HttpClients::Loader.new_http_client

  # shorter alias
  Conf = Configuration

  Conf.instance_eval do
    def configure
      yield self
    end
  end

end
