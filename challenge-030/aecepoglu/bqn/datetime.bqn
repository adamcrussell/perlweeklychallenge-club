⟨
  To, From
⟩⇐

DivMod ← ⌊∘÷˜ ⋈ |

# Day number versus calendar date conversions
date ← {
  o ← 719469
  y ← 365.25
  dur ← ⟨(100×y)-0.75,    y, 30.6⟩
  off ← ⟨o-0.25,       0.75, 0.41⟩

  From ⇐ {
    y‿m‿d ← 𝕩
    f ← 0 > m -↩ 3
    (d-o) +´ ⌊ off +⌾(¯1⊸⊑) dur × (100 DivMod y-f) ∾ ⟨m+12×f⟩
  }
  To ⇐ {
    t←𝕩
    c‿y‿m ← dur { d‿m ← 𝕨 DivMod 𝕩+t ⋄ t↩⌊m ⋄ d }¨ off
    m -↩ 12×10≤m
    ⟨(100×c)+y+m<0, 3+m, 1+t⟩
  }
}

timestamp ← {
  d ← 24 × ×˜ m←60
  From ⇐ {
    (d × date.From 3↑𝕩) + m⊸×⊸+˜´⌽3↓𝕩
  }
  To ⇐ {
    day‿sec ← d DivMod 𝕩
    (date.To day) ∾ m|⌊∘÷⟜m⍟(⌽↕3)sec
  }
}

To‿From ← timestamp.To‿timestamp.From

