class NutWOW
  import javax.swing.JFrame
  import javax.swing.JPanel
  import javax.swing.JLabel
  import java.awt.Dimension

  def initialize 
  end

  def run
    puts "I am running!"
    frame = JFrame.new
    panel = JPanel.new
    label = JLabel.new 'Hello World!'

    panel.add label
    frame.add panel

    frame.size = Dimension.new 200, 100
    frame.default_close_operation = JFrame::EXIT_ON_CLOSE
    frame.visible = true

    frame
  end
end
