Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B58C4FAAAA
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Apr 2022 22:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbiDIUTz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 9 Apr 2022 16:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiDIUTy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 9 Apr 2022 16:19:54 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45998D5B
        for <linux-rtc@vger.kernel.org>; Sat,  9 Apr 2022 13:17:46 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id p189so7587364wmp.3
        for <linux-rtc@vger.kernel.org>; Sat, 09 Apr 2022 13:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q1lxCdHBuJxbjBxwpnh6sKKElMTUleBSs75hBgURlRY=;
        b=hzHf7vRkvfJeJMWuL8VfxUjnk/K7K0xF6pvUkc5En63ToYPb5e1Kt0qs9ReOGfoKUQ
         K5RUJkfF8N/75TpttuyMN/9Ch5kjQJ+6bU/kCu10Q6wjQfDxPaFtYOfTKPsUDNak7ZkY
         3/ciwURzduGUWoQyT51AbESlQIqsFW98O8X32z7MdJgn0xoiMFniCK1BXmGuHrUm5at4
         Wdc4DqlvacvML9hP2Ni6W36HKJyMougYeCWwLnin88SV8RJb3JJ6E7uYEct1V85SPRy7
         bKGPTDG0cCpQh5SUvKCGgo0SpmWorZVgf1Kr8KN98og14ov3Ew9IizrwHQOImZ33qRIo
         1wZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q1lxCdHBuJxbjBxwpnh6sKKElMTUleBSs75hBgURlRY=;
        b=ppDrurRr3jQPayawhqBQmlU/j3ttaLniesjAgRPSY6DZRJgJIMblH8d+k5ohj8H974
         AA//ULiKPWpNBEe6WPVgoH+iPFBBjuYcGpn7ff0LX72E2vMmLieOjc0kJKxsY1Kyl3hl
         kWTYiubcLoI0IjeeD81xdDtajGjT0QcWO6861yNVqUFJL4IPRsU4Ors5ku3Ya/ZaBIv6
         i7VqQjH++fRrbQyb05zSSiTiWoINQaZrxKyjyOGGeRtrmoir6pkXizP2OIJAVtyamzt7
         tVQXxcsIAYRdFxf3dl3knb/lc32dGLIl9+ze+HT290yVpMTP9XcEy5vzFEe1eJY6a9IM
         D/rA==
X-Gm-Message-State: AOAM5311TSJwe+1/r7MfRHrfyKCyhyFJ52qbQ3IXgUs0xbHOGnIUU49T
        mniyLlPPZeVO2tXH+86BwN2eJw==
X-Google-Smtp-Source: ABdhPJyPhXW8Dtj381wf89dQcXMgzwmh+JZcAU60DG4J9/z8AKiVUazKM/8tyzG9vucLww9Zp15s6g==
X-Received: by 2002:a05:600c:500e:b0:38c:6d79:d5ac with SMTP id n14-20020a05600c500e00b0038c6d79d5acmr23120020wmr.42.1649535464708;
        Sat, 09 Apr 2022 13:17:44 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c22d400b0038c8dbdc1a3sm13115012wmg.38.2022.04.09.13.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 13:17:44 -0700 (PDT)
Message-ID: <8a7e16c3-ce17-3726-5702-763d57075c25@conchuod.ie>
Date:   Sat, 9 Apr 2022 21:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
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
 <98026c4a-a065-3965-27f0-71de29cdb264@conchuod.ie>
 <7e6a0489-f90f-a362-e37b-b219fe2d71fe@linaro.org>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <7e6a0489-f90f-a362-e37b-b219fe2d71fe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/04/2022 11:48, Krzysztof Kozlowski wrote:
> On 09/04/2022 09:14, Conor Dooley wrote:
>> On 08/04/2022 16:29, Conor Dooley wrote:
>>> On 08/04/2022 15:57, Krzysztof Kozlowski wrote:
>>>> On 08/04/2022 16:36, Conor Dooley wrote:
>>>>> Hey,
>>>>> As I mentioned in my fixes for 5.18 [0], found out that the reference
>>>>> clock for the rtc is actually missing from the clock driver (and the
>>>>> dt binding).
>>>>>
>>>>> Currently the mpfs clock driver uses a reference clock called the
>>>>> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
>>>>> (config) clocks. The frequency of the msspll is determined by the FPGA
>>>>> bitstream & the bootloader configures the clock to match the bitstream.
>>>>> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>>>>>
>>>>> However, the msspll clock is not actually the parent of all clocks on
>>>>> the system - the reference clock for the rtc/mtimer actually has the
>>>>> off chip oscillator as its parent.
>>>>>
>>>>> This series enables reading the rate of the msspll clock, converts
>>>>> the refclock in the device tree to the external reference & adds
>>>>> the missing rtc reference clock.
>>>>>
>>>>> I assume it is okay not to add fixes tags for the rtc dt binding?
>>>>> Since the clock was previously missing, the binding is wrong, but
>>>>> idk if that qualifies as a fix?
>>>>
>>>> Usually ABI breakage, even if accepted, should be be tagged as fix
>>>> because it is clearly then a break of other peoples' trees...
>>>>
>>>
>>> That means either a) do something messy in the clock driver or b) mark
>>> the whole series as fixes (and roll it into [0]).
>>>
>>> The second option seems far more sensible to me, do you agree?
>>
>> Having thought some more about it, patches 2, 3 and the rtc part of 7
>> should be moved into [0] since they're fixing a binding that only
>> arrived in 5.18-rc1.
>> For the rest, make the second part of the reg optional and if it doesnt
>> exist just return prate for the msspll clock?
> 
> Ah, so this got into v5.18-rc1?

Yeah, so for context he clock driver & relevant the dt-bindings only
arrived in 5.18-rc1. The device tree itself has been around (I think)
5.12 but it wasn't bootable until now. The rtc stanza is also new.
The clock stanza & "wrong" refclk existed since the device tree was
first added.

> I think I missed that information from
> the patches description and focused on backporting to stables.

Yeah, zero intention of backporting any of this. Pretty pointless since
the board hasn't booted until now anyway.

> Then indeed you could combine all fixes together, mark them with Fixes.

I had split the series (plural) since the clock driver change is fairly
big, adding a new "layer" of clocks & like 200 lines to a 400 line
driver. I will respin then, with the dt binding patches marked as fixes
and combined with the other series.

Do I have to maintain backwards compatibility with the device tree
from before the board actually booted mainline? If not, I'll merge
it all into one series, marked as fixes. Otherwise I'll keep the clock 
changes in this series out of the fixes, mark the second reg entry in
the clock binding as optional & handle the old, "naive" dt stanza in the
driver.

Thanks!
Conor.
