/* config.h
 * PSR 6schedlat assignment
 * DO NOT MODIFY
 */

#include <xlnx_zynq7k.h>

/* Register offsets (see TRM B.32) */
#define ZYNQ_TIMER_CLOCK_CTRL       (0x00)
#define ZYNQ_TIMER_COUNTER_CTRL     (0x0c)
#define ZYNQ_TIMER_COUNTER_VAL      (0x18)
#define ZYNQ_TIMER_INTERVAL         (0x24)
#define ZYNQ_TIMER_INTERRUPT        (0x54)
#define ZYNQ_TIMER_INTERRUPT_EN     (0x60)
/* Register bit definitions */
#define INTERRUPT_EN_IV             (0x01)
#define CTRL_EN                     (0<<0)
#define CTRL_DIS                    (1<<0)
#define CTRL_INT                    (1<<1)
#define CLOCK_PRESCALE              ((0x01 << 1))
#define CLOCK_PRESCALE_EN           (0x1)
/* Register access */
#define TTC0_TIMER2_CLOCK_CTRL      (*((volatile UINT32 *)(ZYNQ7K_TTC0_TIMER2_BASE + ZYNQ_TIMER_CLOCK_CTRL)))
#define TTC0_TIMER2_COUNTER_CTRL    (*((volatile UINT32 *)(ZYNQ7K_TTC0_TIMER2_BASE + ZYNQ_TIMER_COUNTER_CTRL)))
#define TTC0_TIMER2_COUNTER_VAL     (*((volatile UINT32 *)(ZYNQ7K_TTC0_TIMER2_BASE + ZYNQ_TIMER_COUNTER_VAL)))
#define TTC0_TIMER2_INTERVAL        (*((volatile UINT32 *)(ZYNQ7K_TTC0_TIMER2_BASE + ZYNQ_TIMER_INTERVAL)))
#define TTC0_TIMER2_INTERRUPT       (*((volatile UINT32 *)(ZYNQ7K_TTC0_TIMER2_BASE + ZYNQ_TIMER_INTERRUPT)))
#define TTC0_TIMER2_INTERRUPT_EN    (*((volatile UINT32 *)(ZYNQ7K_TTC0_TIMER2_BASE + ZYNQ_TIMER_INTERRUPT_EN)))

/* sysClkRateSet(CLOCK_RATE) */
#define CLOCK_RATE 1000

/* Semaphore that is passed between `timer_isr` and Service task. */
SEM_ID isr_semaphore;

/*
 * timer_isr()
 *
 *  This function is attached to timer as an interrupt handler.
 *  On every call, this function reads and stores the timer value
 *  and releases `isr_semaphore`.
 */
void timer_isr(void);

/*
 * ServiceTask()
 *  : (int) o -- "optional" argument, you can use it freely if you want to
 *
 *  This function is spawned as a Service task with name `tService`.
 *
 *  Service task is running in a loop, waiting for `isr_semaphore`
 *  to be unlocked. After successfully taking this semaphore, timer
 *  value is read and stored.
 */
void ServiceTask(int o);

/*
 * MonitorTask()
 *  : (int) o -- "optional" argument, you can use it freely if you want to
 *
 *  This function is spawned as a Monitor task with name `tMonitor`.
 *
 *  Monitor task is running in a loop, printing out measurement data
 *  from both `timer_isr` and Service task. After printing, task is
 *  suspended for 1 second.
 *
 *  Data format:
 *  The functions prints out three rows every time:
 *   1) First row is the x-axis, values in microseconds, ordered in a strictly
 *      increasing sequence.
 *   2) Second row is histogram for "interrupt--timer_isr" latency. The sequence
 *      has the same size as first row (number of elements) and the values
 *      correspond to the x-axis (number of occurences of given latency).
 *   3) Third row is histogram for "interrupt--ServiceTask" latency. The rest is
 *      same as the second row.
 *   Printed out values are delimited by comma ',' only. Rows are ended with '\n'.
 */
void MonitorTask(int o);

/*
 * CreateTasks()
 *  : (int) seconds -- how many seconds should the measurement last
 *                     0 = INFINITE
 *
 *  Entry point function.
 *
 *  This function makes a measurement of interrupt latency.
 *  First, it prepares registers of the hardware and links
 *  `timer_isr` function as an interrupt handler.
 *  Then, Service and Monitor tasks are spawned.
 *
 *  Whole application (that is, after running this function),
 *  should print to stdout 'Measurement started' message. Then,
 *  every 1 second measurement data are printed. At the end,
 *  after `seconds` seconds have passed, the 'Measurement finished'
 *  message is printed and application is terminated (all tasks deleted,
 *  and interrupt is disabled + disconnected).
 *
 *  Note:
 *  See Monitor task for more information about the measurement data
 *  format.
 *
 *  Example:
 *      -> CreateTasks(1)
 *      Measurement started
 *      0,1,2,3,4,5,6,7
 *      59,984,34,0,45,3,784,35
 *      0,0,0,0,0,13,1159,772
 *      Measurement finished
 *
 *      -> CreateTasks(2)
 *      Measurement started
 *      0,1,2,3,4,5,6,7
 *      59,984,34,0,45,3,784,35
 *      0,0,0,0,0,13,1159,772
 *      0,1,2,3,4,5,6,7
 *      147,1751,134,5,85,13,997,80
 *      0,0,0,0,0,30,1909,1273
 *      Measurement finished
 */
void CreateTasks(int measurements);
