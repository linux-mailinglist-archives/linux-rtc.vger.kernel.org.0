Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4647166D4
	for <lists+linux-rtc@lfdr.de>; Tue, 30 May 2023 17:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbjE3PSq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 May 2023 11:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjE3PSp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 May 2023 11:18:45 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DCDBE
        for <linux-rtc@vger.kernel.org>; Tue, 30 May 2023 08:18:43 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34UC6Xxj011803;
        Tue, 30 May 2023 17:18:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5TK4cBitjv4YwqRib8IC/BYem3TFu0lX9EPmhIMqG/s=;
 b=4uXEPIkE/ZJQpBli0ZJN7P8OzICMR/rxUxTKUGRjpH1UCJSg4YJBiUbAuFrjPfvonJrk
 HAG/ZxUuWWa91fKtbvgiHWf5DT7QC5wSUmjZ5WK+tt4wnJT7v9bsuO5g/yNfjhZXaN1f
 nXgNZ6Lu2+xgzUAbyXWZYciNIytqPCwiFZgDVZvehzWMtgCr+Arj/drvOh6k5XRYgyIL
 709CTsl1ub/dYgirgl3FZNYf+zWoHhhR1gorhrWSOCy06vpQovfck2flz54LxhELooGq
 nWdfkY+SZDMikdkMBGVHXRnUYRkmihcA9V3uPDOw61ODi5ollAhVtVLUVckQD8B6o1pr sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qvsnnrks4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 May 2023 17:18:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9245A10002A;
        Tue, 30 May 2023 17:18:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89A0922F7BF;
        Tue, 30 May 2023 17:18:25 +0200 (CEST)
Received: from [10.201.20.208] (10.201.20.208) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 17:18:24 +0200
Message-ID: <be0aeb7e-d278-7d0e-9fdf-9974ea5a14e1@foss.st.com>
Date:   Tue, 30 May 2023 17:18:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] rtc: stm32: Handle single EXTI IRQ as wake up source
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, <linux-rtc@vger.kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20230518003311.415018-1-marex@denx.de>
 <4a24cd14-9cca-7499-a0d3-37f7e4c3b087@foss.st.com>
 <eb76a6e9-150a-5daf-75fd-7574c36714f8@denx.de>
From:   Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <eb76a6e9-150a-5daf-75fd-7574c36714f8@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.20.208]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_11,2023-05-30_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 5/30/23 16:13, Marek Vasut wrote:
> On 5/30/23 16:02, Amelie Delaunay wrote:
>> Hi Marek,
> 
> Hello Amelie,
> 
>> On 5/18/23 02:33, Marek Vasut wrote:
>>> The arch/arm/boot/dts/stm32mp151.dtsi specifies one interrupt for the
>>> RTC node, while the expectation of the RTC driver is two interrupts on
>>> STM32MP15xx SoC, one connected to GIC interrupt controller and another
>>> one to EXTI. Per STM32MP15xx reference manual, the two interrupts serve
>>> the same purpose, except the EXTI one can also wake the system up. The
>>> EXTI driver already internally handles this GIC and EXTI duality and
>>> maps the EXTI interrupt onto GIC during runtime, and only uses the EXTI
>>> for wake up functionality.
>>>
>>> Therefore, fix the driver such that if on STM32MP15xx there is only one
>>> interrupt specified in the DT, use that interrupt as EXTI interrupt and
>>> set it as wake up source.
>>>
>>> This fixes the following warning in the kernel log on STM32MP15xx:
>>> "
>>> stm32_rtc 5c004000.rtc: error -ENXIO: IRQ index 1 not found
>>> stm32_rtc 5c004000.rtc: alarm can't wake up the system: -6
>>> "
>>>
>>> This also fixes the system wake up via built-in RTC using e.g.:
>>> $ rtcwake -s 5 -m mem
>>>
>>> Fixes: b72252b6580c ("rtc: stm32: add stm32mp1 rtc support")
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
>>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-rtc@vger.kernel.org
>>> Cc: linux-stm32@st-md-mailman.stormreply.com
>>> ---
>>>   drivers/rtc/rtc-stm32.c | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
>>> index 229cb2847cc48..72994b9f95319 100644
>>> --- a/drivers/rtc/rtc-stm32.c
>>> +++ b/drivers/rtc/rtc-stm32.c
>>> @@ -780,14 +780,15 @@ static int stm32_rtc_probe(struct 
>>> platform_device *pdev)
>>>       ret = device_init_wakeup(&pdev->dev, true);
>>>       if (rtc->data->has_wakeirq) {
>>> -        rtc->wakeirq_alarm = platform_get_irq(pdev, 1);
>>> +        rtc->wakeirq_alarm = platform_get_irq_optional(pdev, 1);
>>>           if (rtc->wakeirq_alarm > 0) {
>>>               ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
>>>                                   rtc->wakeirq_alarm);
>>> -        } else {
>>> +        } else if (rtc->wakeirq_alarm == -EPROBE_DEFER) {
>>>               ret = rtc->wakeirq_alarm;
>>> -            if (rtc->wakeirq_alarm == -EPROBE_DEFER)
>>> -                goto err;
>>> +            goto err;
>>> +        } else {
>>> +            ret = dev_pm_set_wake_irq(&pdev->dev, rtc->irq_alarm);
>>>           }
>>>       }
>>>       if (ret)
>>
>> In our downstream [1], dedicated wakeup irq management is dropped: it 
>> is neither described in st,stm32-rtc bindings nor used in STM32Fx, 
>> STM32Hx, STM32MP1x device trees.
>> The pointed patch is going to be upstreamed.
>>
>> [1] 
>> https://github.com/STMicroelectronics/linux/commit/5a45e1f100d59c33b6b50fe98c0f62862bd6f3d2
> 
> Won't that break compatibility with DTs which do use two interrupts 
> entries ?

I didn't find any DTs using STM32 RTC with two interrupts. Did I miss 
something?
