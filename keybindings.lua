-- require "modes"
require "api"

ALL_MODES = {
  "tool",
  "color",
  "shape",
  "linestyle",
  "visual",
  "resize"
}
--------------------
-- KEYBINDINGS:   --
--------------------
keybindings = {
  -- Tools
  pen = {
    description = "Pen",
    buttons     = {"w"},
    modes       = {"tool"},
    call        = function() clickPen() ; cleanShape() end
  },
  eraser = {
    description = "Eraser",
    buttons     = {"e"},
    modes       = {"tool"},
    call        = function() clickEraser() ; cleanShape() end
  },
  highlighter = {
    description = "Highlighter",
    buttons     = {"f"},
    modes       = {"tool"},
    call        = function() clickHighlighter() ; cleanShape() end
  },
  textHighlighter = {
    description = "Text Highlighter",
    buttons     = {"q"},
    modes       = {"tool"},
    call        = function() clickTextHighlighter() ; cleanShape() end
  },
  --hand = {
    --description = "Hand",
    --buttons     = {"<Shift>f"},
    --modes       = {"tool"},
    --call        = clickHand
  --},
  --selection = {
    --description = "Selection",
    --buttons     = {"s"},
    --modes       = {"tool"},
    --call        = clickSelectRegion
  --},
  tex = {
    description = "Tex",
    buttons     = {"i"},
    modes       = {"tool"},
    call        = clickTex
  },
  text = {
    description = "Text",
    buttons     = {"y"},
    modes       = {"tool"},
    call        = clickText
  },
  delete = {
    description = "Delete",
    buttons     = {"x"},
    modes       = {"tool"},
    call        = clickDelete
  },

  -- History
  undo = {
    description = "Undo",
    buttons     = {"d", "u", "z"},
    modes       = {"tool"},
    call        = clickUndo,
  },
  redo = {
    description = "Redo",
    buttons     = {"r"},
    modes       = {"tool"},
    call        = clickRedo,
  },

  -- Mode Selection
  tool = {
    description = "Tool mode",
    buttons     = {"t"},
    modes       = ALL_MODES,
    call        = function()
      currentMode = "tool"
      sticky = false
    end
  },
  color = {
    description = "Color mode",
    buttons     = {"c"},
    modes       = {"tool"},
    call        = function() currentMode = "color" end
  },
  stickyColor = {
    description = "Sticky color mode",
    buttons     = {"<Shift>c"},
    modes       = {"tool"},
    call        = function()
      currentMode = "color"
      sticky = true
    end
  },
  shape = {
    description = "Shape mode",
    buttons     = {"s"},
    modes       = {"tool"},
    call        = function() currentMode = "shape" end
  },
  --linestyle = {
    --description = "Linestyle mode",
    --buttons     = {"q"},
    --modes       = {"tool"},
    --call        = function() currentMode = "linestyle" end
  --},
  stickyLinestyle = {
    description = "Sticky linestyle mode",
    buttons     = {"<Shift>q"},
    modes       = {"tool"},
    call        = function()
      currentMode = "linestyle"
      sticky = true
    end
  },
  stickyPage = {
    description = "Sticky page mode",
    buttons     = {"<Shift>b", "<Shift>p"},
    modes       = {"tool"},
    call        = function()
      currentMode = "page"
      sticky = true
    end
  },
  stickyFile = {
    description = "Sticky file mode",
    buttons     = {"<Shift>y"},
    modes       = {"tool"},
    call        = function()
      currentMode = "file"
      sticky = true
    end
  },
  visual = {
    description = "Visual mode",
    buttons     = {"v"},
    modes       = {"tool"},
    call        = function() currentMode = "visual" end
  },
  stickyVisual = {
    description = "Sticky visual mode",
    buttons     = {"<Shift>v"},
    modes       = {"tool"},
    call        = function()
      currentMode = "visual"
      sticky = true
    end
  },
  resize = {
    description = "Resize mode",
    buttons     = {"<Shift>F"},
    modes       = {"tool"},
    call        = function() currentMode = "resize" end
  },

  -- Various tool mode commands
  newAfterTool = {
    description = "NewAfter",
    buttons     = {"n"},
    modes       = {"tool"},
    call        = clickNewAfter
  },
  annotatePDFTool = {
    description = "Annotate PDF",
    buttons     = {"o"},
    modes       = {"tool"},
    call        = clickAnnotatePDF
  },
  zoomIn = {
    description = "Zoom in",
    buttons     = {"greater", "<Shift>greater", "plus", "<Shift>plus"},
    modes       = {"tool"},
    call        = clickZoomIn
  },
  zoomOut = {
    description = "Zoom out",
    buttons     = {"minus", "less"},
    modes       = {"tool"},
    call        = clickZoomOut
  },

  -- Thickness
  veryFine = {
    description = "Very Fine",
    buttons     = {"a"},
    modes       = {"resize"},
    call        = clickVeryFine,
  },
  fine = {
    description = "Fine",
    buttons     = {"s"},
    modes       = {"resize"},
    call        = clickFine,
  },
  medium = {
    description = "Medium",
    buttons     = {"d"},
    modes       = {"resize"},
    call        = clickMedium,
  },
  thick = {
    description = "Thick",
    buttons     = {"f"},
    modes       = {"resize"},
    call        = clickThick,
  },
  veryThick = {
    description = "Very thick",
    buttons     = {"g"},
    modes       = {"resize"},
    call        = clickVeryThick,
  },
  -- Colors
  black = {
    description = "Black",
    buttons     = {"x"},
    modes       = {"color"},
    call        = function() changeToolColor(blackColor) end
  },
  white = {
    description = "White",
    buttons     = {"w"},
    modes       = {"color"},
    call        = function() changeToolColor(whiteColor) end
  },
  --pink = {
    --description = "Pink",
    --buttons     = {"k"},
    --modes       = {"color"},
    --call        = function() changeToolColor(pinkColor) end
  --},
  red = {
    description = "Red",
    buttons     = {"r"},
    modes       = {"color"},
    call        = function() changeToolColor(redColor) end
  },
  orange = {
    description = "Orange",
    buttons     = {"o"},
    modes       = {"color"},
    call        = function() changeToolColor(orangeColor) end
  },
  yellow = {
    description = "Yellow",
    buttons     = {"y"},
    modes       = {"color"},
    call        = function() changeToolColor(yellowColor) end
  },
  green = {
    description = "Green",
    buttons     = {"g"},
    modes       = {"color"},
    call        = function() changeToolColor(greenColor) end
  },
  cyan = {
    description = "Cyan",
    buttons     = {"c"},
    modes       = {"color"},
    call        = function() changeToolColor(cyanColor) end
  },
  blue = {
    description = "Blue",
    buttons     = {"b"},
    modes       = {"color"},
    call        = function() changeToolColor(blueColor) end
  },
  purple = {
    description = "Purple",
    buttons     = {"p", "a"},
    modes       = {"color"},
    call        = function() changeToolColor(purpleColor) end
  },

  -- Shapes
  ruler = {
    description = "Line",
    buttons     = {"s"},
    modes       = {"shape"},
    call        = clickLine
  },
  arrow = {
    description = "Arrow",
    buttons     = {"a"},
    modes       = {"shape"},
    call        = clickArrow
  },
  rectangle = {
    description = "Rectangle",
    buttons     = {"r"},
    modes       = {"shape"},
    call        = clickRectangle
  },
  ellipse = {
    description = "Ellipse",
    buttons     = {"e"},
    modes       = {"shape"},
    call        = clickEllipse
  },
  spline = {
    description = "Spline",
    buttons     = {"b"},
    modes       = {"shape"},
    call        = clickSpline
  },
  line = {
    description = "Line",
    buttons     = {"s"},
    modes       = {"shape"},
    call        = clickLine
  },
  fill = {
    description = "Fill",
    buttons     = {"f"},
    modes       = {"shape"},
    call        = clickFill
  },
  -- Linestyles
  plain = {
    description = "Plain",
    buttons     = {"a", "i", "p"},
    modes       = {"linestyle"},
    call        = clickPlain
  },
  dashed = {
    description = "Dashed",
    buttons     = {"s"},
    modes       = {"linestyle"},
    call        = clickDashed
  },
  dotted = {
    description = "Dotted",
    buttons     = {"d"},
    modes       = {"linestyle"},
    call        = clickDotted
  },
  dashDotted = {
    description = "DashDotted",
    buttons     = {"f"},
    modes       = {"linestyle"},
    call        = clickDashDotted
  },

  -- Visual
  lasso = {
    description = "Select Region",
    buttons     = {"s"},
    modes       = {"visual"},
    call        = clickSelectRegion
  },
  selectRectangle = {
    description = "Select Rectangle",
    buttons     = {"a", "r"},
    modes       = {"visual"},
    call        = clickSelectRectangle
  },
  selectObject = {
    description = "Select Object",
    buttons     = {"f", "g"},
    modes       = {"visual"},
    call        = clickSelectObject
  }
}

-- helper functions
function cleanShape()
  clickLine(false)
  clickArrow(false)
  clickRectangle(false)
  clickEllipse(false)
  clickSpline(false)
  clickFill(false)
  clickPlain()
end
