Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3636717DEA
	for <lists+linux-rtc@lfdr.de>; Wed, 31 May 2023 13:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbjEaLWZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 31 May 2023 07:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjEaLWY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 31 May 2023 07:22:24 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8A7E8
        for <linux-rtc@vger.kernel.org>; Wed, 31 May 2023 04:22:22 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 58FEC8609E;
        Wed, 31 May 2023 13:22:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1685532139;
        bh=FoZTj/ixvD5wu3qzf/mMYrSYif01n21y7PRgY1+ycxM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=tLSGkYhIYKrC09cMZQSMoSMApJt6dRvwhkV54b6dsJaA7rbQ65CDcx1Z0YvX9LGnK
         ylzF2x4hLL32Rr3eUMn2VB843rdniHhRKoTcx2NcXTCVwFYu2cT3g5pdy3vUNEebC4
         Ok5o2ML8hNebhVQ6opOpRoizKsUsSqOeaUkQfTf5iEcNJ2C5VTQZf6u/PyUQKj0nuN
         HfWPDWsICTQtvoaqKCZTb1DZd6L000hoxqPtqVbJqKjFEi+HH6W5HIqlkOFqqx5p+t
         jEsm/ifpPbuutM+tYtXj5aHrUuSkUBCQqlIYCs5u/EqZJR57LiONUMU8x2ZB7mP4/u
         JUaSrguRC0vNQ==
Message-ID: <dc8dd57f-d149-ec1e-3aaa-17163d1d8bcd@denx.de>
Date:   Wed, 31 May 2023 12:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] rtc: stm32: Handle single EXTI IRQ as wake up source
To:     Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230518003311.415018-1-marex@denx.de>
 <4a24cd14-9cca-7499-a0d3-37f7e4c3b087@foss.st.com>
 <eb76a6e9-150a-5daf-75fd-7574c36714f8@denx.de>
 <be0aeb7e-d278-7d0e-9fdf-9974ea5a14e1@foss.st.com>
 <d9c1809f-7359-58f8-4cdf-95f957256e55@denx.de>
 <9409594f-0ae0-9a96-4eaa-4fdbecd2656f@foss.st.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <9409594f-0ae0-9a96-4eaa-4fdbecd2656f@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 5/31/23 11:36, Alexandre TORGUE wrote:
> Hi Marek

Hi,

> On 5/30/23 21:54, Marek Vasut wrote:
>> On 5/30/23 17:18, Amelie Delaunay wrote:
>>> On 5/30/23 16:13, Marek Vasut wrote:
>>>> On 5/30/23 16:02, Amelie Delaunay wrote:
>>>>> Hi Marek,
>>>>
>>>> Hello Amelie,
>>>>
>>>>> On 5/18/23 02:33, Marek Vasut wrote:
>>>>>> The arch/arm/boot/dts/stm32mp151.dtsi specifies one interrupt for the
>>>>>> RTC node, while the expectation of the RTC driver is two 
>>>>>> interrupts on
>>>>>> STM32MP15xx SoC, one connected to GIC interrupt controller and 
>>>>>> another
>>>>>> one to EXTI. Per STM32MP15xx reference manual, the two interrupts 
>>>>>> serve
>>>>>> the same purpose, except the EXTI one can also wake the system up. 
>>>>>> The
>>>>>> EXTI driver already internally handles this GIC and EXTI duality and
>>>>>> maps the EXTI interrupt onto GIC during runtime, and only uses the 
>>>>>> EXTI
>>>>>> for wake up functionality.
>>>>>>
>>>>>> Therefore, fix the driver such that if on STM32MP15xx there is 
>>>>>> only one
>>>>>> interrupt specified in the DT, use that interrupt as EXTI 
>>>>>> interrupt and
>>>>>> set it as wake up source.
>>>>>>
>>>>>> This fixes the following warning in the kernel log on STM32MP15xx:
>>>>>> "
>>>>>> stm32_rtc 5c004000.rtc: error -ENXIO: IRQ index 1 not found
>>>>>> stm32_rtc 5c004000.rtc: alarm can't wake up the system: -6
>>>>>> "
>>>>>>
>>>>>> This also fixes the system wake up via built-in RTC using e.g.:
>>>>>> $ rtcwake -s 5 -m mem
>>>>>>
>>>>>> Fixes: b72252b6580c ("rtc: stm32: add stm32mp1 rtc support")
>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>> ---
>>>>>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>>>>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>>>>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>>>> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
>>>>>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>> Cc: linux-rtc@vger.kernel.org
>>>>>> Cc: linux-stm32@st-md-mailman.stormreply.com
>>>>>> ---
>>>>>>   drivers/rtc/rtc-stm32.c | 9 +++++----
>>>>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
>>>>>> index 229cb2847cc48..72994b9f95319 100644
>>>>>> --- a/drivers/rtc/rtc-stm32.c
>>>>>> +++ b/drivers/rtc/rtc-stm32.c
>>>>>> @@ -780,14 +780,15 @@ static int stm32_rtc_probe(struct 
>>>>>> platform_device *pdev)
>>>>>>       ret = device_init_wakeup(&pdev->dev, true);
>>>>>>       if (rtc->data->has_wakeirq) {
>>>>>> -        rtc->wakeirq_alarm = platform_get_irq(pdev, 1);
>>>>>> +        rtc->wakeirq_alarm = platform_get_irq_optional(pdev, 1);
>>>>>>           if (rtc->wakeirq_alarm > 0) {
>>>>>>               ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
>>>>>>                                   rtc->wakeirq_alarm);
>>>>>> -        } else {
>>>>>> +        } else if (rtc->wakeirq_alarm == -EPROBE_DEFER) {
>>>>>>               ret = rtc->wakeirq_alarm;
>>>>>> -            if (rtc->wakeirq_alarm == -EPROBE_DEFER)
>>>>>> -                goto err;
>>>>>> +            goto err;
>>>>>> +        } else {
>>>>>> +            ret = dev_pm_set_wake_irq(&pdev->dev, rtc->irq_alarm);
>>>>>>           }
>>>>>>       }
>>>>>>       if (ret)
>>>>>
>>>>> In our downstream [1], dedicated wakeup irq management is dropped: 
>>>>> it is neither described in st,stm32-rtc bindings nor used in 
>>>>> STM32Fx, STM32Hx, STM32MP1x device trees.
>>>>> The pointed patch is going to be upstreamed.
>>>>>
>>>>> [1] 
>>>>> https://github.com/STMicroelectronics/linux/commit/5a45e1f100d59c33b6b50fe98c0f62862bd6f3d2
>>>>
>>>> Won't that break compatibility with DTs which do use two interrupts 
>>>> entries ?
>>>
>>> I didn't find any DTs using STM32 RTC with two interrupts. Did I miss 
>>> something?
>>
>> I am not aware of any either (I also did check a couple of 
>> repositories to be sure) . However, the DT is an ABI , so there might 
>> be users we do not know about, who might be unable to update their DTs 
>> , and who would be broken by dropping the support for two interrupts.
> 
> Currently if people use 2 interrupts in their DT with an up to date 
> kernel I don't think it works fine. At the beginning of the MP1 story, 2 
> interrupts were needed to wakeup system from LPSTOP: one for GIC and the 
> other one for EXTI. But since maybe 2 years, EXTI and GIC interrupts are 
> directly linked inside the EXTI driver. So now, devices only need to 
> take one interrupt. With this implementation if one device uses 2 
> interrupts in their DT then the GIC interrupt will be mapped two times. 
> So I think that current implementation in RTC driver is broken and it 
> should be aligned with "new" EXTI implementation. Note also that the use 
> of 2 interrupts has never been documented in dt-bindings documentation.

In that case, maybe add a warning into the driver if you detect two 
interrupts, notify user and avoid any unexpected surprises ?

> Above words are for STM32 MPU products For STM32 MCU products RTC is 
> only mapped to the EXTI (not to the NVIC) so no needs to handle two 
> interrupts.

Like I wrote before, I am fine either way.

[...]
