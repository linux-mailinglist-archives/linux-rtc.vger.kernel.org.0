Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFA64FA6D7
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Apr 2022 12:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbiDIKrh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 9 Apr 2022 06:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240023AbiDIKrX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 9 Apr 2022 06:47:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBA420F6B
        for <linux-rtc@vger.kernel.org>; Sat,  9 Apr 2022 03:45:14 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bq8so21775259ejb.10
        for <linux-rtc@vger.kernel.org>; Sat, 09 Apr 2022 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=frRIq19w6WV8+V8P0b/MeZBdiHuZnJaDLS8GaGxMM0g=;
        b=UJKPFzFkhPlU90x+FAxJJAUNeeH7VdTNuVjumrMlXey8GJyRr4IboTWF7O6V6QH40P
         BzyiQXGoEKMJK3ZbHmBlBWCO+juOwXZH/mkNUv22tE1wCwBQsw+t02oKkvNrbiY2v4Xo
         C/ASq7GQpYnkpIA7XL1FkY16BvA3JDnP/+yiEL5EqONnzfa8KSfFHU8aDEl9bvmPwHXn
         bnB54ppjFcjxIfYI3vVKVIUerU1fvwgej/6xrtwIgIIVp41TBM/F8+v7fr3AXH22t+BI
         SnfxhcJ+Lc92ACx7uzqRSyA31P7d0c4NDbPF3XJ2UfKkKE6A0uHAgVlRQcCJ6V9dN/sz
         a33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=frRIq19w6WV8+V8P0b/MeZBdiHuZnJaDLS8GaGxMM0g=;
        b=JlviusfpVeTN0OgQ5oZ2y87pd6Iz5MHhrkiYozX9/kkbIcN7MnG3gvl2a9vaqw3XKq
         4oyB9Vr6774qYRuu3oIibdXZVrHfH8Ql0ffBybvSaJqNXJuz2nN22/alsaycWKTWk9iW
         m1EvbmbrWRLqyXF9n+V9a2y0GwDKEOSowucQ6BPRa+P4cYZ7yBKTuG1clu/UCGJwwTPC
         ZS/6oYHDMmT61BqEwTNAr5Ax/PjhM93NqHBw1JlJQKEkLzr5OUDCf+tq+xtJIhB0y4vH
         8iuyV45nEboHfUj5EXYJAEdiLkot/+qgRhuZa4tHe7xd+zv1dp0kG7gM2r/MjKBUCHvj
         820A==
X-Gm-Message-State: AOAM532S4uGjCt8ylmhnS+LBwlxnj18Q6JjTWjgfRzHVgBMxghgPxS0Z
        89RzTdu7oXVK1jVWRREymSZchg==
X-Google-Smtp-Source: ABdhPJxlR4hBksawdCpREkWQEPy67NZX6AedykSUBJPPbm/DVuEiWOgbyGYtSdaFc3O1DPxEQo63kQ==
X-Received: by 2002:a17:906:2991:b0:6cf:1fd4:39a3 with SMTP id x17-20020a170906299100b006cf1fd439a3mr22171598eje.21.1649501113359;
        Sat, 09 Apr 2022 03:45:13 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id mp19-20020a1709071b1300b006dfdfe15cf8sm9810278ejc.196.2022.04.09.03.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 03:45:12 -0700 (PDT)
Message-ID: <ed73017f-54d0-b303-1557-b6086ce2d155@linaro.org>
Date:   Sat, 9 Apr 2022 12:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To:     Conor Dooley <mail@conchuod.ie>,
        Conor Dooley <conor.dooley@microchip.com>,
        mturquette@baylibre.com, sboyd@kernel.org, aou@eecs.berkeley.edu,
        paul.walmsley@sifive.com, palmer@rivosinc.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
 <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/04/2022 17:29, Conor Dooley wrote:
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

I think ate part of my sentence... it should be:
"Usually ABI breakage, even if accepted, should NOT be tagged as fix..."

So usually it should not be a fix.

The binding actually could be backported, because the driver changes
bring the real ABI breakage.

Best regards,
Krzysztof
