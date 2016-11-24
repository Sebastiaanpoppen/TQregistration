Chartkick.options = {
  height: "400px",
  colors: ["#00f", "#999"]
}

Chartkick.options[:html] = '<div id="%{id}" style="height: %{height};">Loading...</div>'

Chartkick.options[:content_for] = :charts_js
