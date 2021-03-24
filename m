Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0703474F9
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Mar 2021 10:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhCXJqa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Mar 2021 05:46:30 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14521 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbhCXJqX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Mar 2021 05:46:23 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F53GF40qRzPll5;
        Wed, 24 Mar 2021 17:43:49 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 17:46:19 +0800
Subject: Re: [PATCH V3 -next] powerpc: kernel/time.c - cleanup warnings
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <a.zummo@towertech.it>,
        <christophe.leroy@csgroup.eu>, <npiggin@gmail.com>,
        <msuchanek@suse.de>, <tglx@linutronix.de>, <peterz@infradead.org>,
        <geert@linux-m68k.org>, <geert+renesas@glider.be>,
        <kernelfans@gmail.com>, <frederic@kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>
References: <20210324090939.143477-1-heying24@huawei.com>
 <YFsGYgdNH5HrlqDJ@piout.net>
From:   "heying (H)" <heying24@huawei.com>
Message-ID: <18a8d444-f1a5-61e0-b9f2-f85c03d71686@huawei.com>
Date:   Wed, 24 Mar 2021 17:46:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFsGYgdNH5HrlqDJ@piout.net>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dear Alexandre,


ÔÚ 2021/3/24 17:29, Alexandre Belloni Ð´µÀ:
> On 24/03/2021 05:09:39-0400, He Ying wrote:
>> We found these warnings in arch/powerpc/kernel/time.c as follows:
>> warning: symbol 'decrementer_max' was not declared. Should it be static?
>> warning: symbol 'rtc_lock' was not declared. Should it be static?
>> warning: symbol 'dtl_consumer' was not declared. Should it be static?
>>
>> Declare 'decrementer_max' in powerpc asm/time.h.
>> Include linux/mc146818rtc.h in powerpc kernel/time.c where 'rtc_lock'
>> is declared. And remove duplicated declaration of 'rtc_lock' in powerpc
>> platforms/chrp/time.c because it has included linux/mc146818rtc.h.
>> Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
>> is declared there.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: He Ying <heying24@huawei.com>
>> ---
>> V2:
>> - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
>>    rtc_lock in powerpc asm/time.h.
>> V3:
>> - Recover to V1, that is including linux/mc146818rtc.h in powerpc
>>    kernel/time.c. And remove duplicated declaration of 'rtc_lock' in powerpc
>>    platforms/chrp/time.c because it has included linux/mc146818rtc.h.
>>
>>   arch/powerpc/include/asm/time.h    | 1 +
>>   arch/powerpc/kernel/time.c         | 9 ++++-----
>>   arch/powerpc/platforms/chrp/time.c | 2 --
>>   3 files changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
>> index 8dd3cdb25338..2cd2b50bedda 100644
>> --- a/arch/powerpc/include/asm/time.h
>> +++ b/arch/powerpc/include/asm/time.h
>> @@ -22,6 +22,7 @@ extern unsigned long tb_ticks_per_jiffy;
>>   extern unsigned long tb_ticks_per_usec;
>>   extern unsigned long tb_ticks_per_sec;
>>   extern struct clock_event_device decrementer_clockevent;
>> +extern u64 decrementer_max;
>>   
>>   
>>   extern void generic_calibrate_decr(void);
>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>> index b67d93a609a2..ac81f043bf49 100644
>> --- a/arch/powerpc/kernel/time.c
>> +++ b/arch/powerpc/kernel/time.c
>> @@ -55,8 +55,9 @@
>>   #include <linux/sched/cputime.h>
>>   #include <linux/sched/clock.h>
>>   #include <linux/processor.h>
>> -#include <asm/trace.h>
>> +#include <linux/mc146818rtc.h>
> I'm fine with that but I really think my suggestion to make the rtc_lock
> local to the platforms was better because it is only used to synchronize
> between concurrent invocations of chrp_set_rtc_time or
> maple_set_rtc_time. The rtc core will never do that and the only case
> would be concurrent calls to rtc_ops.set_time and
> update_persistent_clock64 (which should also be removed at some point).

Many thanks for your suggestion. As you suggest, rtc_lock should be 
local to platforms.

Does it mean not only powerpc but also all other platforms should adapt 
this change?

It might be a big change. I have no idea if that's OK. What are other 
maintainers' opinions?


Thanks.


