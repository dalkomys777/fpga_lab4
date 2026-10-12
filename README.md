# FPGA LAB4

전자전기컴퓨터설계실험II LAB4 사전 준비 및 검증 자료입니다.

## 실습 내용

- STM32_0: LED와 버튼 폴링
- FPGA: 4비트 무부호 곱셈기
- FPGA: BCD→이진수 변환기

## FPGA 회로

- `circuits/01_mult_4bit`: 4비트 무부호 곱셈기
- `circuits/02_bcd_to_binary`: BCD→이진수 변환기

각 회로의 `src`에는 설계 코드, `sim`에는 self-checking 테스트벤치가 있습니다.
시뮬레이션 VCD·로그·보고서용 이미지는 `evidence`에 보관합니다.
한글 보고서는 최종 제출 전까지 `reports/pre`에서 로컬로 관리하며 Git 커밋에서는 제외합니다.

## VS Code 시뮬레이션

`LAB4.code-workspace`를 연 뒤 `Tasks: Run Task`에서 다음 작업을 실행합니다.

1. `01 Multiplier - Simulate`
2. `02 Multiplier - Open waveform`
3. `03 BCD - Simulate`
4. `04 BCD - Open waveform`

통과 메시지:

- `PASS multiplier: 256 input pairs`
- `PASS BCD: 100 valid, 156 invalid`

## 제출 저장소

https://github.com/dalkomys777/fpga_lab4

