Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3DE4FA6E0
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Apr 2022 12:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241428AbiDIKu3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 9 Apr 2022 06:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237180AbiDIKu2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 9 Apr 2022 06:50:28 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF9D20F6B
        for <linux-rtc@vger.kernel.org>; Sat,  9 Apr 2022 03:48:21 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id n6so21731494ejc.13
        for <linux-rtc@vger.kernel.org>; Sat, 09 Apr 2022 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zurZzrPnoV4r9DOy+KZk14qxFnOBvVLhR9qywD2QyTw=;
        b=odUO6U5irUD1TkbGAOs9IgaVtCu9ZJQSdzKAbAtU03h2pKET2StPIxNP0ccPnw6ryi
         7L7QpO3e2/HsMEJWXV0X9STvzCCGfy2/Z4+Dw9Ug89GBEHB+W6wSaFFDmkF0Z+OrdzDQ
         oqRCfKhYtQOMKBEQ/EHifuKnX7bKjrllz/fIYy1Xvsi4F/Z+aqZj864bj8pXz1fWKf7e
         0sDo0lmj0IjbinYYlxcY1qNS5L8++7zZnS/J7TtRaTzf0rg/mWPfEAiObNqJAAHVl6wb
         Vgr+tqTCLMgh0oC3kuozx6TgQ5GQ2qNEvLfD1anUDzs+G7yqwhKZYaxxOUmwHFXm9Any
         Cv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zurZzrPnoV4r9DOy+KZk14qxFnOBvVLhR9qywD2QyTw=;
        b=JFdaoXi8J6iWWmjdOsv26KQi+QqCoXJSMjOQPoa19iW8WajrhpLnM6bH2zFINii5UT
         in0sTmYLnOSmT7mYVePfULDXljwytDGfrd8Nfs8R5tSU6k2jRpRSVfxXCxvSkc7BuSrd
         5JcYc2SHjILmo+2XeiMp180CUbi9kFAwjWLgUycwFL7yV9P+bsqdV72fZnt072Il+4dL
         bkRaStmrbOKitOkev6tOX7PP943sJhmUzRR8vCD9o3YovpA2j5lVdUBFWldaS9CwzDOx
         2m7WhfqORPUsUXd0KGTrtziDUDRRQvNnx+CnxnFnIBl4ZCRBNBaR5PU/Y8tHLyhCuDTR
         +vJQ==
X-Gm-Message-State: AOAM530LvwCGJqDs1vutZ/l9fhrImP9QeFoYhgxgfWFFiLT3stdrGzxv
        nQTBnGXq3lmVCAt2JJcY/HKrmg==
X-Google-Smtp-Source: ABdhPJw9pBeXg2SGuQ2eXUyY6HU7X577pbo9P5dDrtLudpd5GXm2ecpBgXeFvECzMwpI0j1dbrfsyA==
X-Received: by 2002:a17:907:1b27:b0:6d9:ceb6:7967 with SMTP id mp39-20020a1709071b2700b006d9ceb67967mr23101859ejc.186.1649501299954;
        Sat, 09 Apr 2022 03:48:19 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id jv20-20020a170907769400b006e7f859e683sm6045929ejc.19.2022.04.09.03.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 03:48:19 -0700 (PDT)
Message-ID: <7e6a0489-f90f-a362-e37b-b219fe2d71fe@linaro.org>
Date:   Sat, 9 Apr 2022 12:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To:     Conor Dooley <mail@conchuod.ie>,
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
 <98026c4a-a065-3965-27f0-71de29cdb264@conchuod.ie>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <98026c4a-a065-3965-27f0-71de29cdb264@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/04/2022 09:14, Conor Dooley wrote:
> 
> 
> On 08/04/2022 16:29, Conor Dooley wrote:
>>
>>
>> On 08/04/2022 15:57, Krzysztof Kozlowski wrote:
>>> On 08/04/2022 16:36, Conor Dooley wrote:
>>>> Hey,
>>>> As I mentioned in my fixes for 5.18 [0], found out that the reference
>>>> clock for the rtc is actually missing from the clock driver (and the
>>>> dt binding).
>>>>
>>>> Currently the mpfs clock driver uses a reference clock called the
>>>> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
>>>> (config) clocks. The frequency of the msspll is determined by the FPGA
>>>> bitstream & the bootloader configures the clock to match the bitstream.
>>>> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>>>>
>>>> However, the msspll clock is not actually the parent of all clocks on
>>>> the system - the reference clock for the rtc/mtimer actually has the
>>>> off chip oscillator as its parent.
>>>>
>>>> This series enables reading the rate of the msspll clock, converts
>>>> the refclock in the device tree to the external reference & adds
>>>> the missing rtc reference clock.
>>>>
>>>> I assume it is okay not to add fixes tags for the rtc dt binding?
>>>> Since the clock was previously missing, the binding is wrong, but
>>>> idk if that qualifies as a fix?
>>>
>>> Usually ABI breakage, even if accepted, should be be tagged as fix
>>> because it is clearly then a break of other peoples' trees...
>>>
>>
>> That means either a) do something messy in the clock driver or b) mark
>> the whole series as fixes (and roll it into [0]).
>>
>> The second option seems far more sensible to me, do you agree?
> 
> Having thought some more about it, patches 2, 3 and the rtc part of 7
> should be moved into [0] since they're fixing a binding that only
> arrived in 5.18-rc1.
> For the rest, make the second part of the reg optional and if it doesnt
> exist just return prate for the msspll clock?

Ah, so this got into v5.18-rc1? I think I missed that information from
the patches description and focused on backporting to stables. Then
indeed you could combine all fixes together, mark them with Fixes.

Best regards,
Krzysztof
