# 01_mult_4bit

- 설계 최상위: `mult_4bit`
- 시뮬레이션 최상위: `tb`
- 핵심 파형: `a`, `b`, `m`
- 완료 메시지: `PASS multiplier: 256 input pairs`
- 보드 핀 제약: [`lab4_mult_4bit.xdc`](constraints/lab4_mult_4bit.xdc)
- 보드 대응: `SW[7:4] → a`, `SW[3:0] → b`, `m → LED[7:0]`
