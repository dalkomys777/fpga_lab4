# LAB4 실행 증빙

이 폴더는 LAB4의 STM32 및 FPGA 실행 결과를 회로별로 정리한 제출 증빙이다. 원본 KakaoTalk 영상 5개는 실제 프레임을 확인한 뒤 아래와 같이 배정하고 의미가 드러나는 이름으로 변경했다.

## 1. STM32_0

| 구분 | 증빙 | 영상에서 확인한 내용 |
|---|---|---|
| 시리얼/디버그 | [serial_monitor_hello_world.mp4](00_stm32/videos/serial_monitor_hello_world.mp4) | VS Code의 STM32Cube 디버그 세션, COM4·9600 baud Serial Monitor, 반복 출력된 `Hello, World!` |
| 과제 1 내장 LED | [task1_internal_led_button.mp4](00_stm32/videos/task1_internal_led_button.mp4) | NUCLEO-G474RE의 USER 버튼 입력과 보드 내장 LED 상태 변화 |
| 과제 2 외부 LED | [task2_external_led_button.mp4](00_stm32/videos/task2_external_led_button.mp4) | PB0에 연결한 브레드보드 외부 LED의 점멸과 USER 버튼 입력 |

보고서용 대표 프레임은 [stills](00_stm32/stills)에, 실제 사용한 두 과제 코드는 [code](00_stm32/code)에 보관했다. 영상은 1→2→4→8초 상태 전이 동작을 시각적으로 확인하는 자료이며, 계측기 기반의 정밀 주기 측정 자료는 아니다.

## 2. 4비트 무부호 곱셈기

- 보드 영상: [mult_4bit_demo.mp4](01_mult_4bit/board/mult_4bit_demo.mp4)
- 대표 프레임: [15 × 15 = 225](01_mult_4bit/board/mult_4bit_15x15_225.jpg)
- VS Code 기능 검증: [파형](01_mult_4bit/vscode/wave.png), [256개 입력쌍 PASS](01_mult_4bit/vscode/pass.png), [VCD](01_mult_4bit/vscode/wave.vcd)
- Vivado 검증: [핀 제약](01_mult_4bit/vivado/00_xdc_pin_constraints.png), [프로젝트 설정](01_mult_4bit/vivado/02_project_settings.png), [Behavioral Simulation](01_mult_4bit/vivado/03_behavioral_waveform.png), [PASS 콘솔](01_mult_4bit/vivado/04_simulation_pass.png), [합성·구현·비트스트림 성공](01_mult_4bit/vivado/05_build_success.png), [DRC PASS](01_mult_4bit/vivado/06_drc_pass.png), [Timing Summary](01_mult_4bit/vivado/07_timing_summary.png)
- 실제 보드에서 마지막 입력 `a=15`, `b=15`일 때 LED 출력 `1110_0001₂ = 225₁₀`을 확인했다.

## 3. BCD→이진수 변환기

- 보드 영상: [bcd_to_binary_demo.mp4](02_bcd_to_binary/board/bcd_to_binary_demo.mp4)
- 대표 프레임: [유효 BCD 상태](02_bcd_to_binary/board/bcd_valid_state.jpg), [A0 비유효 상태](02_bcd_to_binary/board/bcd_invalid_a0.jpg)
- VS Code 기능 검증: [파형](02_bcd_to_binary/vscode/wave.png), [100 valid·156 invalid PASS](02_bcd_to_binary/vscode/pass.png), [VCD](02_bcd_to_binary/vscode/wave.vcd)
- Vivado 검증: [핀 제약](02_bcd_to_binary/vivado/00_xdc_pin_constraints.png), [프로젝트 설정](02_bcd_to_binary/vivado/02_project_settings.png), [Behavioral Simulation](02_bcd_to_binary/vivado/03_behavioral_waveform.png), [PASS 콘솔](02_bcd_to_binary/vivado/04_simulation_pass.png), [합성·구현·비트스트림 성공](02_bcd_to_binary/vivado/05_build_success.png), [DRC PASS](02_bcd_to_binary/vivado/06_drc_pass.png), [Timing Summary](02_bcd_to_binary/vivado/07_timing_summary.png)
- 유효 BCD 입력에서는 `valid=1`과 변환된 7비트 값이 출력되고, `ten=A`인 A0 입력에서는 `valid=0`이 되는 것을 보드 LED로 확인했다.

## 4. Vivado 보고서와 비트스트림

각 회로의 [vivado/reports](01_mult_4bit/vivado/reports) 및 [vivado/reports](02_bcd_to_binary/vivado/reports)에 원본 합성 로그, 구현·비트스트림 로그, routed DRC 보고서와 timing 보고서를 저장했다.

- 4비트 곱셈기: 합성 0 errors, DRC 0 Errors, bitstream 생성 성공
- BCD 변환기: 합성 0 errors, DRC 0 Errors, bitstream 생성 성공
- 두 회로는 클록과 레지스터가 없는 순수 조합회로이므로 Timing Summary의 WNS/WHS가 `inf`, TNS/THS가 `0.000 ns`로 표시되고 사용자 지정 클록 timing constraint가 없다는 메시지가 나온다. Failing endpoint는 0이다.

재현 가능한 비트스트림은 [artifacts/bitstreams](../artifacts/bitstreams)에 있으며 SHA-256은 다음과 같다.

| 파일 | SHA-256 |
|---|---|
| `mult_4bit.bit` | `BECD8FA12C4E881496D16A0938007BDEBF8D3ED4179A2D2014CC4A306F2A0ADE` |
| `bcd_conv.bit` | `AB3C02C3361D695383934739DB61286F0BB495BB1CBDB81037AF400FF2A1FF6A` |

영상 원본의 무결성 값은 [VIDEO_SHA256SUMS.txt](VIDEO_SHA256SUMS.txt), 비트스트림 값은 [SHA256SUMS.txt](../artifacts/bitstreams/SHA256SUMS.txt)에서 다시 확인할 수 있다.

## 5. 설계와 핀 제약

- [4비트 곱셈기 설계](../circuits/01_mult_4bit/src/mult_4bit.v) / [테스트벤치](../circuits/01_mult_4bit/sim/tb_design.v) / [XDC](../circuits/01_mult_4bit/constraints/lab4_mult_4bit.xdc)
- [BCD 변환기 래퍼](../circuits/02_bcd_to_binary/src/bcd_conv.v) / [변환 모듈](../circuits/02_bcd_to_binary/src/bcd_to_binary.v) / [테스트벤치](../circuits/02_bcd_to_binary/sim/tb_design.v) / [XDC](../circuits/02_bcd_to_binary/constraints/lab4_bcd_to_binary.xdc)

Vivado의 generated project/cache 디렉터리는 저장소에서 제외하고, 소스·제약·실행 로그·보고서·비트스트림만 제출 증빙으로 관리한다.
