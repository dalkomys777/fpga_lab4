void polling_routine(void)
{
    static GPIO_PinState previous_button = GPIO_PIN_RESET;
    static uint32_t last_press_ms = 0U;
    static uint32_t last_led_ms = 0U;
    static uint32_t interval_ms = 1000U;

    GPIO_PinState current_button = HAL_GPIO_ReadPin(
        BUTTON_ece2_GPIO_Port,
        BUTTON_ece2_Pin);
    uint32_t now_ms = HAL_GetTick();

    /* 버튼을 누르는 순간만 인식하고 200 ms 이내의 바운스 입력은 무시한다. */
    if (current_button == GPIO_PIN_SET &&
        previous_button == GPIO_PIN_RESET &&
        now_ms - last_press_ms >= 200U)
    {
        last_press_ms = now_ms;
        interval_ms = (interval_ms >= 8000U) ? 1000U : interval_ms * 2U;
        last_led_ms = now_ms;
    }

    /* 선택한 간격마다 PB0에 연결할 외부 LED의 상태를 반전한다. */
    if (now_ms - last_led_ms >= interval_ms)
    {
        last_led_ms = now_ms;
        HAL_GPIO_TogglePin(GPIO_OUT1_ece2_GPIO_Port, GPIO_OUT1_ece2_Pin);
    }

    previous_button = current_button;
}
