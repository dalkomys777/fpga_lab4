# LAB4 실행 증거

이 폴더에는 VS Code에서 사용자가 직접 다시 실행해 확인한 화면과 시뮬레이션 산출물을 보관합니다.

## 01 mult 4bit

- `design_code.png`: 4비트 곱셈기 설계 코드
- `wave.png`: VaporView에서 확인한 `a`, `b`, `m` 파형
- `pass.png`: `PASS multiplier: 256 input pairs` 실행 결과
- `wave.vcd`: 시뮬레이션 VCD
- `simulation.log`, `simulation.txt`: 실행 기록

## 02 bcd to binary

- `wrapper_code.png`: `bcd_conv.v` 최상위 래퍼 코드
- `design_code.png`: `bcd_to_binary.v` 변환 및 유효성 판정 코드
- `wave.png`: VaporView에서 확인한 `ten`, `one`, `bin`, `valid` 파형
- `pass.png`: `PASS BCD: 100 valid, 156 invalid` 실행 결과
- `wave.vcd`: 시뮬레이션 VCD
- `simulation.log`, `simulation.txt`: 실행 기록

한글 보고서 파일은 최종 제출 시점까지 로컬에서 관리하며 이 저장소의 일반 커밋에는 포함하지 않습니다.
