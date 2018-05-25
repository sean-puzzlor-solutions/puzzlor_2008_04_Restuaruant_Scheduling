\ENCODING=ISO-8859-1
\Problem name: 

Minimize
 obj: 100 y_{Monday} + 100 y_{Tuesday} + 100 y_{Wednesday} + 100 y_{Thursday}
      + 100 y_{Friday} + 100 y_{Saturday} + 100 y_{Sunday}
Subject To
 c1:  y_{Monday} >= 4
 c2:  y_{Tuesday} >= 5
 c3:  y_{Wednesday} >= 5
 c4:  y_{Thursday} >= 10
 c5:  y_{Friday} >= 12
 c6:  y_{Saturday} >= 12
 c7:  y_{Sunday} >= 2
 c8:  y_{Monday} - x_{Monday} - x_{Friday} - x_{Saturday} - x_{Sunday} <= 0
 c9:  y_{Tuesday} - x_{Monday} - x_{Tuesday} - x_{Saturday} - x_{Sunday} <= 0
 c10: y_{Wednesday} - x_{Monday} - x_{Tuesday} - x_{Wednesday} - x_{Sunday}
      <= 0
 c11: y_{Thursday} - x_{Monday} - x_{Tuesday} - x_{Wednesday} - x_{Thursday}
      <= 0
 c12: y_{Friday} - x_{Tuesday} - x_{Wednesday} - x_{Thursday} - x_{Friday} <= 0
 c13: y_{Saturday} - x_{Wednesday} - x_{Thursday} - x_{Friday} - x_{Saturday}
      <= 0
 c14: y_{Sunday} - x_{Thursday} - x_{Friday} - x_{Saturday} - x_{Sunday} <= 0
 c15: x_{Monday} + x_{Tuesday} + x_{Wednesday} + x_{Thursday} + x_{Friday}
      + x_{Saturday} + x_{Sunday} <= 17
Bounds
      y_{Monday} >= 0
      y_{Tuesday} >= 0
      y_{Wednesday} >= 0
      y_{Thursday} >= 0
      y_{Friday} >= 0
      y_{Saturday} >= 0
      y_{Sunday} >= 0
      x_{Monday} >= 0
      x_{Tuesday} >= 0
      x_{Wednesday} >= 0
      x_{Thursday} >= 0
      x_{Friday} >= 0
      x_{Saturday} >= 0
      x_{Sunday} >= 0
Generals
 y_{Monday}  y_{Tuesday}  y_{Wednesday}  y_{Thursday}  y_{Friday} 
 y_{Saturday}  y_{Sunday}  x_{Monday}  x_{Tuesday}  x_{Wednesday} 
 x_{Thursday}  x_{Friday}  x_{Saturday}  x_{Sunday} 
End
