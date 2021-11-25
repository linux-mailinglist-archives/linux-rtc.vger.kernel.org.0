Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC1C45E698
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Nov 2021 04:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344589AbhKZDoj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 25 Nov 2021 22:44:39 -0500
Received: from mx-out.tlen.pl ([193.222.135.175]:8839 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234327AbhKZDmj (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 25 Nov 2021 22:42:39 -0500
Received: (wp-smtpd smtp.tlen.pl 35669 invoked from network); 25 Nov 2021 23:12:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1637878363; bh=LMy6KUjHBGjULoq4e0kku+UDl+RpuwHnZhdQuJQvOMU=;
          h=From:Subject:To:Cc;
          b=ZaD0KTUXlh21jNEwZ9kTTVS4U/mw+LKj5n6RAqs865r1MQQd9qldw3wrlDdz92k+a
           VN4knBTD4VbwdgpM2RCs5w8BPPjvtdH7WMCLrRZwpMksDzNWNEjlfFpQym8MK1Rrkn
           pTp9ZabEiK4qph1Xp4LwpbYMTkVm0Vx6IMTLgXxg=
Received: from aaen55.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.117.55])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <alexandre.belloni@bootlin.com>; 25 Nov 2021 23:12:43 +0100
Message-ID: <277177e7-46a0-522c-297c-ad3ee0c15793@o2.pl>
Date:   Thu, 25 Nov 2021 23:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
Subject: Re: [PATCH RESEND v3 2/7] rtc-mc146818-lib: fix RTC presence check
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
 <20211119204221.66918-3-mat.jonczyk@o2.pl> <YZ69RB0ePgaHcqVm@piout.net>
Content-Language: en-GB
In-Reply-To: <YZ69RB0ePgaHcqVm@piout.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 81ade90a1d98cfabcf1e5c021c7cab64
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000D [IQPk]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

W dniu 24.11.2021 o 23:31, Alexandre Belloni pisze:
> Hello,
>
> By moving this patch later on in the series, you'd avoid the subsequent
> refactor. I think this would be better for bisection later on.

Hi,

There are three issues I'm trying to fix in this series:

1. (less important) Insufficient locking in cmos_set_alarm()
2. misdetection of the RTC CMOS as broken on some motherboards,
3. reading / writing of the RTC alarm time during RTC update-in-progress.

Do you mean I should drop the patch
    nr 2. ("rtc-mc146818-lib: fix RTC presence check")
and instead straight away introduce mc146818_avoid_UIP() with the new approach (as in patch 3 in the series),
then modify mc146818_get_time() to use it (as in patch 4 - fixing issue nr 2),
then modify cmos_read_alarm / cmos_set_alarm to use mc146818_avoid_UIP() (patches 5-6, fixing issue no. 3)?

I was afraid this risks some confusion what is being fixed when.

On 19/11/2021 21:42:16+0100, Mateusz Jończyk wrote:

>> To prevent an infinite loop in mc146818_get_time(),
>> commit 211e5db19d15 ("rtc: mc146818: Detect and handle broken RTCs")
>> added a check for RTC availability. Together with a later fix, it
>> checked if bit 6 in register 0x0d is cleared. This, however, caused a
>> false negative on a motherboard with an AMD SB710 southbridge; according
>> to the specification [1], bit 6 of register 0x0d of this chipset is a
>> scratchbit.
>>
>> This caused a regression in Linux 5.11 - the RTC was determined broken
>> by the kernel and not used by rtc-cmos.c [3].
>>
>> As a better alternative, check whether the UIP ("Update-in-progress")
>> bit is set for longer then 10ms. If that is the case, then apparently
>> the RTC is either absent (and all register reads return 0xff) or broken.
>> Also limit the number of loop iterations in mc146818_get_time() to 10 to
>> prevent an infinite loop there.
>>
>> In a previous approach to this problem, I implemented a check whether
>> the RTC_HOURS register contains a value <= 24. This, however, sometimes
>> did not work correctly on my Intel Kaby Lake laptop. According to
>> Intel's documentation [2], "the time and date RAM locations (0-9) are
>> disconnected from the external bus" during the update cycle so reading
>> this register without checking the UIP bit is incorrect.
>>
>> [1] AMD SB700/710/750 Register Reference Guide, page 308,
>> https://developer.amd.com/wordpress/media/2012/10/43009_sb7xx_rrg_pub_1.00.pdf
>>
>> [2] 7th Generation Intel ® Processor Family I/O for U/Y Platforms [...] Datasheet
>> Volume 1 of 2, page 209
>> Intel's Document Number: 334658-006,
>> https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/7th-and-8th-gen-core-family-mobile-u-y-processor-lines-i-o-datasheet-vol-1.pdf
>>
>> [3] Functions in arch/x86/kernel/rtc.c apparently were using it.
>>
>> Fixes: 211e5db19d15 ("rtc: mc146818: Detect and handle broken RTCs")
>> Fixes: ebb22a059436 ("rtc: mc146818: Dont test for bit 0-5 in Register D")
>> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>
>> v2: Tweak commit description, remove "Cc: stable" (I'll send it manually
>> after more regression testing).
>>
>> v3: - add "EXPORT_SYMBOL_GPL(mc146818_does_rtc_work)",
>> - change return type from mc146818_does_rtc_work to bool
> This changelog should come after the --- marker
OK
>
>> ---
>> drivers/rtc/rtc-cmos.c | 10 ++++------
>> drivers/rtc/rtc-mc146818-lib.c | 35 ++++++++++++++++++++++++++++++----
>> include/linux/mc146818rtc.h | 1 +
>> 3 files changed, 36 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
>> index dc3f8b0dde98..9404f58ee01d 100644
>> --- a/drivers/rtc/rtc-cmos.c
>> +++ b/drivers/rtc/rtc-cmos.c
>> @@ -793,16 +793,14 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
>> rename_region(ports, dev_name(&cmos_rtc.rtc->dev));
>> - spin_lock_irq(&rtc_lock);
>> -
>> - /* Ensure that the RTC is accessible. Bit 6 must be 0! */
>> - if ((CMOS_READ(RTC_VALID) & 0x40) != 0) {
>> - spin_unlock_irq(&rtc_lock);
>> - dev_warn(dev, "not accessible\n");
>> + if (!mc146818_does_rtc_work()) {
>> + dev_warn(dev, "broken or not accessible\n");
>> retval = -ENXIO;
>> goto cleanup1;
>> }
>> + spin_lock_irq(&rtc_lock);
>> +
>> if (!(flags & CMOS_RTC_FLAGS_NOFREQ)) {
>> /* force periodic irq to CMOS reset default of 1024Hz;
>> *
>> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
>> index dcfaf09946ee..b50612ce1a6d 100644
>> --- a/drivers/rtc/rtc-mc146818-lib.c
>> +++ b/drivers/rtc/rtc-mc146818-lib.c
>> @@ -8,10 +8,36 @@
>> #include <linux/acpi.h>
>> #endif
>> +/*
>> + * If the UIP (Update-in-progress) bit of the RTC is set for more then
>> + * 10ms, the RTC is apparently broken or not present.
>> + */
>> +bool mc146818_does_rtc_work(void)
>> +{
>> + int i;
>> + unsigned char val;
>> + unsigned long flags;
>> +
>> + for (i = 0; i < 10; i++) {
>> + spin_lock_irqsave(&rtc_lock, flags);
>> + val = CMOS_READ(RTC_FREQ_SELECT);
>> + spin_unlock_irqrestore(&rtc_lock, flags);
>> +
>> + if ((val & RTC_UIP) == 0)
>> + return true;
>> +
>> + mdelay(1);
>> + }
>> +
>> + return false;
>> +}
>> +EXPORT_SYMBOL_GPL(mc146818_does_rtc_work);
>> +
>> unsigned int mc146818_get_time(struct rtc_time *time)
>> {
>> unsigned char ctrl;
>> unsigned long flags;
>> + unsigned int iter_count = 0;
>> unsigned char century = 0;
>> bool retry;
>> @@ -20,13 +46,14 @@ unsigned int mc146818_get_time(struct rtc_time *time)
>> #endif
>> again:
>> - spin_lock_irqsave(&rtc_lock, flags);
>> - /* Ensure that the RTC is accessible. Bit 6 must be 0! */
>> - if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x40) != 0)) {
>> - spin_unlock_irqrestore(&rtc_lock, flags);
>> + if (iter_count > 10) {
>> + pr_err_ratelimited("Unable to read current time from RTC\n");
> I'd prefer if we could avoid adding strings in the lib.

The problem is that mc146818_get_time() is used 4 times in the kernel and the callers do not check
its return value. Before this patch, I was getting something like this in dmesg:

[    0.352905] ------------[ cut here ]------------
[    0.352905] WARNING: CPU: 0 PID: 1 at drivers/rtc/rtc-mc146818-lib.c:25 mc146818_get_time+0x1d5/0x230
[    0.352905] Modules linked in:
[    0.352905] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0stacj-mj4 #3
[    0.352905] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A780GXH/128M, BIOS P1.70 05/14/2010
[    0.352905] RIP: 0010:mc146818_get_time+0x1d5/0x230
[    0.352905] Code: 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 4c 89 e6 48 c7 c7 d0 a7 ba a3 e8 ca a8 2f 00 bf 58 89 41 00 e8 30 78 d0 ff e9 43 fe ff
ff <0f> 0b 48 c7 c7 d0 a7 ba a3 4c 89 e6 e8 aa a8 2f 00 48 c7 03 ff ff
[    0.352905] RSP: 0018:ffffbf8d8001fda8 EFLAGS: 00010002
[...]
[    0.352905] PM: RTC time: 18446744073709551615:18446744073709551615:18446744073709551615, date: 1899-00-18446744073709551615

which is not very helpful.

So I think I'll modify (in a separate patch) the callers to check the result and print a warning message (alspo in the callers).

For the record, the callers are:

drivers/rtc/rtc-cmos.c:    mc146818_get_time(t);
drivers/base/power/trace.c:    mc146818_get_time(&time);
arch/alpha/kernel/rtc.c:    mc146818_get_time(tm);
arch/x86/kernel/hpet.c:        mc146818_get_time(&curr_time);

Greetings,

Mateusz

>> memset(time, 0xff, sizeof(*time));
>> return 0;
>> }
>> + iter_count++;
>> +
>> + spin_lock_irqsave(&rtc_lock, flags);
>> /*
>> * Check whether there is an update in progress during which the
>> diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
>> index 0661af17a758..69c80c4325bf 100644
>> --- a/include/linux/mc146818rtc.h
>> +++ b/include/linux/mc146818rtc.h
>> @@ -123,6 +123,7 @@ struct cmos_rtc_board_info {
>> #define RTC_IO_EXTENT_USED RTC_IO_EXTENT
>> #endif /* ARCH_RTC_LOCATION */
>> +bool mc146818_does_rtc_work(void);
>> unsigned int mc146818_get_time(struct rtc_time *time);
>> int mc146818_set_time(struct rtc_time *time);
>> -- 2.25.1
>>


