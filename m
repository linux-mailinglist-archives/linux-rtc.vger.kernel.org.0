Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CED33473A7
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Mar 2021 09:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233655AbhCXIaC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Mar 2021 04:30:02 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14883 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbhCXI3x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Mar 2021 04:29:53 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F51b04wnPzkdjt;
        Wed, 24 Mar 2021 16:28:12 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 16:29:45 +0800
Subject: Re: [PATCH v2 -next] powerpc: kernel/time.c - cleanup warnings
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <a.zummo@towertech.it>, <npiggin@gmail.com>,
        <msuchanek@suse.de>, <tglx@linutronix.de>, <peterz@infradead.org>,
        <geert+renesas@glider.be>, <kernelfans@gmail.com>,
        <frederic@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
References: <20210323091257.90054-1-heying24@huawei.com>
 <YFppJkpZRHMJFay0@piout.net> <YFp0Qc2P61V+3bm0@piout.net>
 <95cd80c5-40ff-1316-9c89-2e8e7836fb6a@csgroup.eu>
 <a30a94af-f551-c2a4-18df-a9488ba11d53@csgroup.eu>
From:   "heying (H)" <heying24@huawei.com>
Message-ID: <bd93a018-ad72-bff3-e7f9-f1396f770465@huawei.com>
Date:   Wed, 24 Mar 2021 16:29:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a30a94af-f551-c2a4-18df-a9488ba11d53@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dear,


在 2021/3/24 14:22, Christophe Leroy 写道:
>
>
> Le 24/03/2021 à 07:14, Christophe Leroy a écrit :
>>
>>
>> Le 24/03/2021 à 00:05, Alexandre Belloni a écrit :
>>> On 23/03/2021 23:18:17+0100, Alexandre Belloni wrote:
>>>> Hello,
>>>>
>>>> On 23/03/2021 05:12:57-0400, He Ying wrote:
>>>>> We found these warnings in arch/powerpc/kernel/time.c as follows:
>>>>> warning: symbol 'decrementer_max' was not declared. Should it be 
>>>>> static?
>>>>> warning: symbol 'rtc_lock' was not declared. Should it be static?
>>>>> warning: symbol 'dtl_consumer' was not declared. Should it be static?
>>>>>
>>>>> Declare 'decrementer_max' and 'rtc_lock' in powerpc asm/time.h.
>>>>> Rename 'rtc_lock' in drviers/rtc/rtc-vr41xx.c to 'vr41xx_rtc_lock' to
>>>>> avoid the conflict with the variable in powerpc asm/time.h.
>>>>> Move 'dtl_consumer' definition behind "include <asm/dtl.h>" 
>>>>> because it
>>>>> is declared there.
>>>>>
>>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>>> Signed-off-by: He Ying <heying24@huawei.com>
>>>>> ---
>>>>> v2:
>>>>> - Instead of including linux/mc146818rtc.h in powerpc 
>>>>> kernel/time.c, declare
>>>>>    rtc_lock in powerpc asm/time.h.
>>>>>
>>>>
>>>> V1 was actually the correct thing to do. rtc_lock is there exactly
>>>> because chrp and maple are using mc146818 compatible RTCs. This is 
>>>> then
>>>> useful because then drivers/char/nvram.c is enabled. The proper fix
>>>> would be to scrap all of that and use rtc-cmos for those platforms as
>>>> this drives the RTC properly and exposes the NVRAM for the mc146818.
>>>>
>>>> Or at least, if there are no users for the char/nvram driver on those
>>>> two platforms, remove the spinlock and stop enabling CONFIG_NVRAM or
>>>> more likely rename the symbol as it seems to be abused by both chrp 
>>>> and
>>>> powermac.
>>>>
>>>
>>> Ok so rtc_lock is not even used by the char/nvram.c driver as it is
>>> completely compiled out.
>>>
>>> I guess it is fine having it move to the individual platform as looking
>>> very quickly at the Kconfig, it is not possible to select both
>>> simultaneously. Tentative patch:
>>>
>>
>> Looking at it once more, it looks like including linux/mc146818rtc.h 
>> is the thing to do, at least for now. Several platforms are defining 
>> the rtc_lock exactly the same way as powerpc does, and including 
>> mc146818rtc.h
>>
>> I think that to get it clean, this change should go in a dedicated 
>> patch and do a bit more and explain exactly what is being do and why. 
>> I'll try to draft something for it.
>>
>> He Y., can you make a version v3 of your patch excluding the rtc_lock 
>> change ?
>>
>
> Finally, I think there is not enough changes to justify a separate patch.
>
> So you can send a V3 based on your V1. In addition to the changes you 
> had in V1, please remove the declaration of rfc_lock in 
> arch/powerpc/platforms/chrp/chrp.h

So glad to hear that. I'll do that and send my V3.


Thanks.

