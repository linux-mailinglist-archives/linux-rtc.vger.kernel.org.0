Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FEA346F23
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Mar 2021 02:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbhCXB64 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Mar 2021 21:58:56 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14512 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234684AbhCXB6k (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Mar 2021 21:58:40 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F4rtb1krZzPlZk;
        Wed, 24 Mar 2021 09:56:07 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 09:58:34 +0800
Subject: Re: [PATCH v2 -next] powerpc: kernel/time.c - cleanup warnings
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <a.zummo@towertech.it>,
        <christophe.leroy@csgroup.eu>, <npiggin@gmail.com>,
        <msuchanek@suse.de>, <tglx@linutronix.de>, <peterz@infradead.org>,
        <geert+renesas@glider.be>, <kernelfans@gmail.com>,
        <frederic@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
References: <20210323091257.90054-1-heying24@huawei.com>
 <YFppJkpZRHMJFay0@piout.net>
From:   "heying (H)" <heying24@huawei.com>
Message-ID: <ceeb191e-7aaf-6f02-5d5b-d6b2e8dc4948@huawei.com>
Date:   Wed, 24 Mar 2021 09:58:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFppJkpZRHMJFay0@piout.net>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dear,


ÔÚ 2021/3/24 6:18, Alexandre Belloni Ð´µÀ:
> Hello,
>
> On 23/03/2021 05:12:57-0400, He Ying wrote:
>> We found these warnings in arch/powerpc/kernel/time.c as follows:
>> warning: symbol 'decrementer_max' was not declared. Should it be static?
>> warning: symbol 'rtc_lock' was not declared. Should it be static?
>> warning: symbol 'dtl_consumer' was not declared. Should it be static?
>>
>> Declare 'decrementer_max' and 'rtc_lock' in powerpc asm/time.h.
>> Rename 'rtc_lock' in drviers/rtc/rtc-vr41xx.c to 'vr41xx_rtc_lock' to
>> avoid the conflict with the variable in powerpc asm/time.h.
>> Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
>> is declared there.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: He Ying <heying24@huawei.com>
>> ---
>> v2:
>> - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
>>    rtc_lock in powerpc asm/time.h.
>>
> V1 was actually the correct thing to do. rtc_lock is there exactly
> because chrp and maple are using mc146818 compatible RTCs. This is then
> useful because then drivers/char/nvram.c is enabled. The proper fix
> would be to scrap all of that and use rtc-cmos for those platforms as
> this drives the RTC properly and exposes the NVRAM for the mc146818.

Do you mean that 'rtc_lock' declared in linux/mc146818rtc.h points to

same thing as that defined in powerpc kernel/time.c? And you think V1

was correct? Oh, I should have added you to my patch V1 senders:)

>
> Or at least, if there are no users for the char/nvram driver on those
> two platforms, remove the spinlock and stop enabling CONFIG_NVRAM or
> more likely rename the symbol as it seems to be abused by both chrp and
> powermac.
>
> I'm not completely against the rename in vr41xxx but the fix for the
> warnings can and should be contained in arch/powerpc.

Yes, I agree with you. But I have no choice because there is a compiling 
error.

Maybe there's a better way.

So, what about my patch V1? Should I resend it and add you to senders?


Thanks.

