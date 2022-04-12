Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E48294FE7FB
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Apr 2022 20:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238453AbiDLSb7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Apr 2022 14:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241028AbiDLSb6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Apr 2022 14:31:58 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432083A70E
        for <linux-rtc@vger.kernel.org>; Tue, 12 Apr 2022 11:29:35 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id r133-20020a1c448b000000b0038ccb70e239so2376372wma.3
        for <linux-rtc@vger.kernel.org>; Tue, 12 Apr 2022 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UjxIBnENYM5U2jkWppTggWI+KxOeSkcWqhHcXf9FYqw=;
        b=11sTjSH1gbk/qCcQN0/ARIYXCXnOcFxU4vzfQ1Vs6ka8Wt/7zjsDx1QZ7gtQAv3NUv
         Y+ooPC+x2KvutL41Gauvs8AqrDmQruDOdZFfUZFiJFW4FiqQuYhurLH8FH8OBrNtu2tS
         LlhFXVEmrfG+PJFDSe2VXHkJmExOcBDNZm0SVhVuOrHYQDzakLf1q6yaiw8Xgs5wZmq8
         6htLSxJKlLKXY4CjNzv8m5G7iZTddUQHVrAXZ3jyytt69hi5h0ie4bWXgyY1vAXCYqXy
         BFQf9Xihic1PzVS1oFLrnflYWji+yxOgS3IAfnEeL40Y2whEvxEoOcauhQdGJ1iLgD79
         iGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UjxIBnENYM5U2jkWppTggWI+KxOeSkcWqhHcXf9FYqw=;
        b=5rSJULEboXffff/dm8ND6pZBXMrPQdahCXccoe22coPnt/qVy3QOKWnbg32gqp2IzG
         TNhZvDfGIsfT0qPZgjkSZoTXA1kPfnQ2VW6q89AIXLzQNgjDqVMRJRm9Snb7hcHjCg8/
         gkIi7rGUflmWSoOu2+Oi/kdBnX7+1DuHMzJ/6pqq27mwBpuFeM2ysBA5sxpHDu2OU0VT
         Di+5gKDVcYEDbvSCiRUSqaUXbcC1+ZZILZxFTV0mNYpnStuFRQmqT0JP3WJvsObgfaLj
         ydc8d1QTTVGMJD0pzdaViyWP2l2lErh6Y1OKuImCVtzhle6NJHD6US8yZrhZBvsAPH9Q
         CRfw==
X-Gm-Message-State: AOAM531W9vkxN0oddvO1B85fOZVfEeNnRG+ONy8PTcA+8fX6XXuFXmN0
        HFbI1ytxX71YRbGFztFWzd+n8w==
X-Google-Smtp-Source: ABdhPJwvSYOIASwIs3kLC7MAm5IUtV/fvZEEwuxh9fOfTBXevk03vh5KF/4ouNQNb8gOY9WFjkXibg==
X-Received: by 2002:a05:600c:4f95:b0:38e:b596:b3f5 with SMTP id n21-20020a05600c4f9500b0038eb596b3f5mr5224649wmq.164.1649788173749;
        Tue, 12 Apr 2022 11:29:33 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
        by smtp.gmail.com with ESMTPSA id f4-20020a7bc8c4000000b0038ebbe10c5esm211622wml.25.2022.04.12.11.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 11:29:32 -0700 (PDT)
Message-ID: <f2c0c8ba-bdfd-faeb-cdff-ed3fe5215029@conchuod.ie>
Date:   Tue, 12 Apr 2022 19:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor.Dooley@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     Daire.McNamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
 <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
 <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
 <25feb189-4d97-f9b1-518e-69aae9a274e0@linaro.org>
 <74695e55-0b59-9236-be19-b02060ad4177@microchip.com>
 <ba518d4d-0f92-0d34-029c-c477c84db81d@linaro.org>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <ba518d4d-0f92-0d34-029c-c477c84db81d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/04/2022 18:10, Krzysztof Kozlowski wrote:
> On 12/04/2022 14:26, Conor.Dooley@microchip.com wrote:
>>>> Additionally MSSPLL is the source for CLK_{CPI,AXI,AHB} so I put it at
>>>> the top. I have no particular preference, so if you want them reordered
>>>> so that MSSPLL is under RTCREF just say the word :)
>>>
>>> Hm, are these in the same clock controller (device, not driver)? If yes,
>>> then please order them numerically. Pretty often one binding header have
>>> IDs for several clock controllers, so then it's a different case.
>>
>> Not *quite* sure what you mean by device. There is only one SoC that
>> this header applies to, but in the actual design the MSSPLL is in one
>> block, the RTC divider in another and CLK_CPU -> CLK_CFM in a third.
> 
> By device I meant here part of Soc responsible for clocks which could be
> called a self-containing block. Pretty often such block maps to a Linux
> "struct device" or some wrapper around it (e.g. clock-controller
> device). For example such "self-containing block" has device node in DTS.
> 
> Judging by your description, these will be different blocks / device
> nodes in DTS?

The way it's implemented is a bit interconnected and none of the three
blocks would satisfy a "self contained" constraint. Eg. The rtcref
divider's control reg sits between two registers responsible for the
CLK_CPU -> CLK_CFM clocks but it's input clock mux is in the same 
sub-block as the MSSPLL.

I guess its better put that each of the three are sub-blocks of a self
contained clock controller for the mss core complex. There are several
other clock domains on the chip which would have distinct clock
controllers & may be added to this header in the future, if letting
Linux control them makes any sense. For example, clocks in (and used for
the clocking of) the fpga fabric.

This controller is a single node in the device tree. Sounds like
reordering it numerically makes the most sense then - I'll resend
tomorrow if that's okay.

Thanks,
Conor.
