Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1FB4FA58C
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Apr 2022 09:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240148AbiDIHRA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 9 Apr 2022 03:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239641AbiDIHQ7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 9 Apr 2022 03:16:59 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5162127B34
        for <linux-rtc@vger.kernel.org>; Sat,  9 Apr 2022 00:14:52 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id d3so15911800wrb.7
        for <linux-rtc@vger.kernel.org>; Sat, 09 Apr 2022 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=HzhZ3bjU1PEmPe2hwuJeZrkyDW35jm9x4B5yGB0bqZ0=;
        b=z/2PBvrci46A223ORsA3V1EMb1SgPUGSYjUx8bqkYUtMjKLlNT9vW3686rNO95bISM
         NBpMrc5lWZtIAnyF9nmuGlfUaNLZwZnZVIts+jaGKWlkLNe7BxchFAtC8bSXcJt9CgBh
         ZiOOiGuYnx90JPeO6OtVMScIrtMjBLulN1Ng1lZVKp4Y8etWGeICrX3gHcZFo2AbMGe3
         gR9r4qUqOomrJ+H2nvAvrIw4X/vHMkMXhWnuflaktRS08th5U36rXXHYNT+s5sJWkk3m
         NqMFm4FNho9ug898GALI4OEsB/Q/nEqCw8qksj8vf5gHb1L7OPCR502UwGOPnR+9dxsm
         zf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=HzhZ3bjU1PEmPe2hwuJeZrkyDW35jm9x4B5yGB0bqZ0=;
        b=eHOg9ISdX4RREwjTaQ7yeWQZ7uu11aAlnpEqFUpHsc0QsalWiMFI0yGpEiZ+pSo9hT
         0+OKNBcWnxo1+fo7xLyO6e0HBw2F+WF8F7/mV3vb8NO7DSsU8KdDVkkjBhmxLOylgXb5
         AYCv0F2if7VCyqFJB4UP7DsQgJ4EC5Um6PJK+eHCBKxvWobGk9iCMBe2Q3hr/VvXbATm
         1QoRhJeEy8eehAXMprb7fWOwOgYRfof5b5X6txsFYEB9Z2h98kGn4U5h2Us5xWl+85WC
         6DixTZzstR312eA9RnOoEBtX8Y1cHXGwbGJBx2mTPKrLIkVqKgdBeVMQeIN4V9kJRx9P
         NF4w==
X-Gm-Message-State: AOAM533/iz8AggYiULKAgUaeLsxx4W/IW3Xe7BUi91JnKdu5V7ZwX6qu
        MsF4TRghmZ4GIwCOXz91noRXXA==
X-Google-Smtp-Source: ABdhPJzZvbXk47Qg+XFtSusWdXHB93I7ufry+eUoPOyQxqyPD1Klc1Q6spp6YTEFUje/wE6rXPgNjA==
X-Received: by 2002:a5d:44d0:0:b0:207:9ac8:2c3b with SMTP id z16-20020a5d44d0000000b002079ac82c3bmr3792006wrr.688.1649488490827;
        Sat, 09 Apr 2022 00:14:50 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d50c8000000b002061622ec88sm13207416wrt.105.2022.04.09.00.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 00:14:50 -0700 (PDT)
Message-ID: <98026c4a-a065-3965-27f0-71de29cdb264@conchuod.ie>
Date:   Sat, 9 Apr 2022 08:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
From:   Conor Dooley <mail@conchuod.ie>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>, sboyd@kernel.org,
        aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, mturquette@baylibre.com
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
 <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
In-Reply-To: <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 08/04/2022 16:29, Conor Dooley wrote:
> 
> 
> On 08/04/2022 15:57, Krzysztof Kozlowski wrote:
>> On 08/04/2022 16:36, Conor Dooley wrote:
>>> Hey,
>>> As I mentioned in my fixes for 5.18 [0], found out that the reference
>>> clock for the rtc is actually missing from the clock driver (and the
>>> dt binding).
>>>
>>> Currently the mpfs clock driver uses a reference clock called the
>>> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
>>> (config) clocks. The frequency of the msspll is determined by the FPGA
>>> bitstream & the bootloader configures the clock to match the bitstream.
>>> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>>>
>>> However, the msspll clock is not actually the parent of all clocks on
>>> the system - the reference clock for the rtc/mtimer actually has the
>>> off chip oscillator as its parent.
>>>
>>> This series enables reading the rate of the msspll clock, converts
>>> the refclock in the device tree to the external reference & adds
>>> the missing rtc reference clock.
>>>
>>> I assume it is okay not to add fixes tags for the rtc dt binding?
>>> Since the clock was previously missing, the binding is wrong, but
>>> idk if that qualifies as a fix?
>>
>> Usually ABI breakage, even if accepted, should be be tagged as fix
>> because it is clearly then a break of other peoples' trees...
>>
> 
> That means either a) do something messy in the clock driver or b) mark
> the whole series as fixes (and roll it into [0]).
> 
> The second option seems far more sensible to me, do you agree?

Having thought some more about it, patches 2, 3 and the rtc part of 7
should be moved into [0] since they're fixing a binding that only
arrived in 5.18-rc1.
For the rest, make the second part of the reg optional and if it doesnt
exist just return prate for the msspll clock?

Thanks,
Conor.



[0] 
https://lore.kernel.org/linux-riscv/20220408133543.3537118-1-conor.dooley@microchip.com/
