# STM32_0 보고서용 코드

- `STM32_0_task1_internal_led.c`: PA5 내장 LED 버전
- `STM32_0_task2_external_led.c`: PB0 외부 LED 버전
- 실제 빌드 대상 `Core/Src/ece2_474_routine.c`에는 과제 1 버전이 적용되어 있습니다.
- 과제 2 실험 시에는 두 파일의 `polling_routine()`만 교체하면 됩니다.
- `report_code` 폴더는 보고서 캡처 및 보관용이며 CMake 빌드 대상이 아닙니다.
