Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2323474E7
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Mar 2021 10:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbhCXJnt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Mar 2021 05:43:49 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:45450 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhCXJnr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 24 Mar 2021 05:43:47 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4F53G85XXfz9ty51;
        Wed, 24 Mar 2021 10:43:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id buohXL9fr0jW; Wed, 24 Mar 2021 10:43:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4F53G84Bvqz9ty50;
        Wed, 24 Mar 2021 10:43:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D65A8B81A;
        Wed, 24 Mar 2021 10:43:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 1-_oAO7f-bJF; Wed, 24 Mar 2021 10:43:45 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F7158B812;
        Wed, 24 Mar 2021 10:43:44 +0100 (CET)
Subject: Re: [PATCH V3 -next] powerpc: kernel/time.c - cleanup warnings
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        He Ying <heying24@huawei.com>
Cc:     mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        a.zummo@towertech.it, npiggin@gmail.com, msuchanek@suse.de,
        tglx@linutronix.de, peterz@infradead.org, geert@linux-m68k.org,
        geert+renesas@glider.be, kernelfans@gmail.com, frederic@kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210324090939.143477-1-heying24@huawei.com>
 <YFsGYgdNH5HrlqDJ@piout.net>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <be984dbc-ba34-8e82-b16e-48d54bd15fe5@csgroup.eu>
Date:   Wed, 24 Mar 2021 10:43:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFsGYgdNH5HrlqDJ@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



Le 24/03/2021 à 10:29, Alexandre Belloni a écrit :
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
> 
> I'm fine with that but I really think my suggestion to make the rtc_lock
> local to the platforms was better because it is only used to synchronize
> between concurrent invocations of chrp_set_rtc_time or
> maple_set_rtc_time. The rtc core will never do that and the only case
> would be concurrent calls to rtc_ops.set_time and
> update_persistent_clock64 (which should also be removed at some point).

I agree but I think it must be done carefully. If the lock is local to the driver really and without 
a link with the RTC core, then the lock var should probably be static. But then we'll have name 
conflict with the global rtc_lock which is declared in <linux/mc146818rtc.h>

All this is not easy, and I like your idea in the other mail to really clean up the rtc core and 
remove this global rtc_lock completely.

For the time being I guess the fix provided by this patch is just semantic and is just fine as is, 
as there is no real bug behind the messages from sparse.

Christophe
