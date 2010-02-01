module Pic2ch
  module Downloaders
    class Thread
      delegate :time, :to=>"@thread"

      def initialize(thread)
        @thread = thread
      end

      def base_path
        @base_path ||= (
          path = Pic2ch.root + Pic2ch::Thread.image_url.host + "urls" + time.to_s
          path.mkpath
          path
        )
      end

      def images_path_for(type = :images)
        base_path + "#{type}.txt"
      end

      def request(type = nil)
        if type
          requested?(type) or
            images_path_for(type).open("w+"){|f| f.puts @thread.send(type)}
        else
          request(:thumbs)
          request(:images)
        end
      end

      def requested?(type = :images)
        images_path_for(type).exist?
      end

      def done_flag_for(type = :images)
        base_path + "#{type}.log"
      end

      def done?(type = :images)
        done_flag_for(type).exist?
      end

      def command(type = :images)
        "wget -x -i %s > %s 2>&1" % [images_path_for(type), done_flag_for(type)]
      end

      def execute(type = :images)
        request(type)
        system(command(type))
      end
    end
  end
end
