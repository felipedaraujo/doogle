class DictionaryAdapter
  include HTTParty
  include Nokogiri

  base_uri 'http://www.dictionaryapi.com'

  def initialize
    @key = ENV['DICTIONARY_KEY']
  end

  def search(entry, options={})
    path = '/api/v1/references/collegiate/xml/'

    response = self.class.get("#{path}#{entry}?key=#{@key}", options)
    @xml = Nokogiri::XML(response.body)

    valid_result? ? extract_content : nil
  end

  private

  def valid_result?
    @xml.at('ew') ? true : false
  end

  def extract_content
    { status: :ok, entry: @xml.at('ew').text, definition: @xml.at('dt').text }
  end
end
