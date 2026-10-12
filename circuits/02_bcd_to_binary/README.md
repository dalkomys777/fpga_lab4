# 02_bcd_to_binary

- 설계 최상위: `bcd_conv`
- 시뮬레이션 최상위: `tb`
- 핵심 파형: `ten`, `one`, `bin`, `valid`
- 완료 메시지: `PASS BCD: 100 valid, 156 invalid`
- 보드 핀 제약: [`lab4_bcd_to_binary.xdc`](constraints/lab4_bcd_to_binary.xdc)
- 보드 대응: `SW[7:4] → ten`, `SW[3:0] → one`, `bin → LED[6:0]`, `valid → LED[7]`
