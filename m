Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C43716364
	for <lists+linux-rtc@lfdr.de>; Tue, 30 May 2023 16:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbjE3OOb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 May 2023 10:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbjE3OOa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 May 2023 10:14:30 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2019F133
        for <linux-rtc@vger.kernel.org>; Tue, 30 May 2023 07:13:59 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 171DF8215F;
        Tue, 30 May 2023 16:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1685456025;
        bh=MwdNgsOpq9+luw2sK8Nh7b3bZbhR0jd153TLO6VHEDU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=exhf/ZyE5aMegR3pXj5TfRxgcbBike+rLedJK4FOCw2KB0xf7EWir0uR+gydiqL1h
         j9GfI6q0hbarZJKjtcrfviBLrg1D4jqz8xR6HxEjTp/NOyNf1IE86pRTlfoq4RN+xe
         b1e1rw/WOL3TU5RaxZvpo7NFn2ZkFwiVrJCNnw0Kg/r7p4MmNT5fvFr7cxKlkQjNOs
         Uf8cxL//gnM24ptdf4W/Yq73/voZ9KPhVN2Z9ZTZh1UKXQ/Mdfac7us3RRjy6EVrZu
         YOAiRsHmuPaXUUXPiavWV94vCfHeiqERzy2+PooP3H8NOs1Jgh5krppZGnklkpeflk
         V87lP+euzacig==
Message-ID: <eb76a6e9-150a-5daf-75fd-7574c36714f8@denx.de>
Date:   Tue, 30 May 2023 16:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] rtc: stm32: Handle single EXTI IRQ as wake up source
Content-Language: en-US
To:     Amelie Delaunay <amelie.delaunay@foss.st.com>,
        linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230518003311.415018-1-marex@denx.de>
 <4a24cd14-9cca-7499-a0d3-37f7e4c3b087@foss.st.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <4a24cd14-9cca-7499-a0d3-37f7e4c3b087@foss.st.com>
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

On 5/30/23 16:02, Amelie Delaunay wrote:
> Hi Marek,

Hello Amelie,

> On 5/18/23 02:33, Marek Vasut wrote:
>> The arch/arm/boot/dts/stm32mp151.dtsi specifies one interrupt for the
>> RTC node, while the expectation of the RTC driver is two interrupts on
>> STM32MP15xx SoC, one connected to GIC interrupt controller and another
>> one to EXTI. Per STM32MP15xx reference manual, the two interrupts serve
>> the same purpose, except the EXTI one can also wake the system up. The
>> EXTI driver already internally handles this GIC and EXTI duality and
>> maps the EXTI interrupt onto GIC during runtime, and only uses the EXTI
>> for wake up functionality.
>>
>> Therefore, fix the driver such that if on STM32MP15xx there is only one
>> interrupt specified in the DT, use that interrupt as EXTI interrupt and
>> set it as wake up source.
>>
>> This fixes the following warning in the kernel log on STM32MP15xx:
>> "
>> stm32_rtc 5c004000.rtc: error -ENXIO: IRQ index 1 not found
>> stm32_rtc 5c004000.rtc: alarm can't wake up the system: -6
>> "
>>
>> This also fixes the system wake up via built-in RTC using e.g.:
>> $ rtcwake -s 5 -m mem
>>
>> Fixes: b72252b6580c ("rtc: stm32: add stm32mp1 rtc support")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-rtc@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>>   drivers/rtc/rtc-stm32.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
>> index 229cb2847cc48..72994b9f95319 100644
>> --- a/drivers/rtc/rtc-stm32.c
>> +++ b/drivers/rtc/rtc-stm32.c
>> @@ -780,14 +780,15 @@ static int stm32_rtc_probe(struct 
>> platform_device *pdev)
>>       ret = device_init_wakeup(&pdev->dev, true);
>>       if (rtc->data->has_wakeirq) {
>> -        rtc->wakeirq_alarm = platform_get_irq(pdev, 1);
>> +        rtc->wakeirq_alarm = platform_get_irq_optional(pdev, 1);
>>           if (rtc->wakeirq_alarm > 0) {
>>               ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
>>                                   rtc->wakeirq_alarm);
>> -        } else {
>> +        } else if (rtc->wakeirq_alarm == -EPROBE_DEFER) {
>>               ret = rtc->wakeirq_alarm;
>> -            if (rtc->wakeirq_alarm == -EPROBE_DEFER)
>> -                goto err;
>> +            goto err;
>> +        } else {
>> +            ret = dev_pm_set_wake_irq(&pdev->dev, rtc->irq_alarm);
>>           }
>>       }
>>       if (ret)
> 
> In our downstream [1], dedicated wakeup irq management is dropped: it is 
> neither described in st,stm32-rtc bindings nor used in STM32Fx, STM32Hx, 
> STM32MP1x device trees.
> The pointed patch is going to be upstreamed.
> 
> [1] 
> https://github.com/STMicroelectronics/linux/commit/5a45e1f100d59c33b6b50fe98c0f62862bd6f3d2

Won't that break compatibility with DTs which do use two interrupts 
entries ?
