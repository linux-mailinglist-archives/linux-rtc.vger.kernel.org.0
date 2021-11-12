Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DCA44ED37
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Nov 2021 20:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235547AbhKLT0f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Nov 2021 14:26:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235379AbhKLT0e (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Nov 2021 14:26:34 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A32C061767;
        Fri, 12 Nov 2021 11:23:43 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id q124so19751933oig.3;
        Fri, 12 Nov 2021 11:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WrJ2FS7TORtddR51pqZ41XSBhGPCEKrQUsKpP2xmt9E=;
        b=qLidZt7X5l4IKHTiM0YIZtltiXZbayCcQmqaU0BMui+Yq5iW0SeIcSsK2rLlFMtduV
         smucjb+yldFORB/dcUTNs4RBgNkFQQRMok4XcTucMd+y3LBX9U5ZQe77pt2WiLknBy4l
         LBFIZAoINpBbhk5o33f93ImvfDMZiILcUrHY9S9iZZeiHmfXInukNelahQh3z8EB7bNN
         DqYpefPKU3FizSpxW+gnzFmVfaDF6Q4NK5YII/doT8LhvsYT0evszfEG6hzANiJeXmfg
         TYqupOztxgpwpCq/lcKvhFR1V9cnGHfHeIkx3jVQswB1W+VK43vrFTVP0IVnfEZrg1OH
         wMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WrJ2FS7TORtddR51pqZ41XSBhGPCEKrQUsKpP2xmt9E=;
        b=vKWC9/YciZIhJJJiEi4OnrtOnrWfGbbZD7Y3fO/8Ym7hb4pKduK77kvYiSFihQa8/c
         qMnNVUgaRYYYCWCGgjiZ+EMC3A7zM4MWhkKuXvOFQBRxOUhYGrHCmR9A7KhTuNNDspd3
         547a4D7V+Js++anOhvF+thQedeHc7SO2HzM+f66WQksQ2vs9NfeVG444/BZGke0Xn8A9
         dPSo6saqGfHaSVc7mqEvg4WnIS1CZ97nJZCSPL2f7m8O4I/U6Hl+YHQSuzvUhHIFvRr1
         p000y1jJf0F7m5obH2ywKXZu/CF8hnugVpTW30i2ApzwMNCiAsrugw/i9nQBnPsqK4Hy
         yD+Q==
X-Gm-Message-State: AOAM530O8MZFMjIy7tni01vOyPda3vrIPfDtoJXKwumNhocoklPBqqi+
        rvcNlAued9rGZGK88sl3yuA=
X-Google-Smtp-Source: ABdhPJwzWyksEBlMAXYzd4nQG2O5luIKtybhOlHS3E20s2wTaegpZmMaDH3pDoTMK0vDufUlB/crKw==
X-Received: by 2002:a05:6808:2287:: with SMTP id bo7mr20199336oib.177.1636745023073;
        Fri, 12 Nov 2021 11:23:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd6sm1217414oib.53.2021.11.12.11.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 11:23:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211111225852.3128201-1-luca@lucaceresoli.net>
 <20211111225852.3128201-8-luca@lucaceresoli.net>
 <0f278280-27d0-4d43-8065-76ec1f7c19b5@roeck-us.net>
 <7584d85a-5050-2b9d-1648-7d3bed2d10ea@lucaceresoli.net>
 <2af4073a-a5d9-e878-d622-b757b082359b@canonical.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f1cbbc17-7a06-2d57-bf3d-c8133dcd30f7@roeck-us.net>
Date:   Fri, 12 Nov 2021 11:23:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2af4073a-a5d9-e878-d622-b757b082359b@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/12/21 8:07 AM, Krzysztof Kozlowski wrote:
> On 12/11/2021 17:02, Luca Ceresoli wrote:
>> Hi Guenter,
>>
>> On 12/11/21 15:57, Guenter Roeck wrote:
>>> On 11/11/21 2:58 PM, Luca Ceresoli wrote:
>>>> Add a simple driver to support the watchdog embedded in the Maxim
>>>> MAX77714
>>>> PMIC.
>>>>
>>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>>>
>>>
>>> I just realized that this is effectively a rewrite of
>>> drivers/watchdog/max77620_wdt.c.
>>> The only difference I can see is is the register offsets (0x91 and 0x92
>>> vs. 1 and 2) and some implementation details. Please add support for this
>>> watchdog to the other driver or provide a _really_ good reason why that
>>> is not possible.
>>
>> I initially started developing MAX77714 watchdog support as an addition
>> to max77620_wdt.c as the procedures look identical at least for the
>> basic features.
>>
>> But the register content seems completely different. Here are the notes
>> I took at that time:
>>
>> -------------------------8<-------------------------
>>
>> MAX77620 has reg ONOFFCNFG1  at 0x41, ONOFFCNFG2  at 0x42.
>> MAX77714 has reg CNFG1_ONOFF at 0x93, CNFG2_ONOFF at 0x94.
>> OK, we can handle this with a register indirection table, indexed by
>> chip model.
>>
>> MAX77620 has MAX77620_REG_FPS_CFG0 register.
>> On MAX77714 I was unable to find any such register (I haven't looked at
>> FPS in detail though).
>> OK, we can handle this with some if()s or entirely disable PM on the
>> 77714 until anybody cares.
>>
>> MAX77620 ONOFFCNFG1  has SFT_RST in bit 7.
>> MAX77714 CNFG1_ONOFF has SFT_RST is bit 6.
>> Uhm, should we have a _bit_ indirection table in addition to the
>> _register_ indirection table?
>>
>> MAX77620 ONOFFCNFG2  bit 5 is SLP_LPM_MSK, involved in FPS.
>> MAX77620 ONOFFCNFG2  bit 6 is WD_RTS_WK, configures the watchdog timer.
>> MAX77714 CNFG2_ONOFF bit 5 is WD_RTS_WK, configures the watchdog timer.
>> On MAX77714 I haven't found SLP_LPM_MSK.
>>
>> MAX77620 has 6 CID registers with "ES version" in CID5.
>> MAX77714 has 5 CID registers with "DEVICE id" in CID3.
>> CID registers would be useful to get the chip model directly from the
>> chip, if only they had the same structure.
>>
>> Almost all of the registers I have been looking into have similar
>> differences.
>>
>> -------------------------8<-------------------------
>>
>> When I started adding indirection tables the driver started growing
>> bigger and uglier, and that little simple driver started being big and
>> complex. So I opted to add a new driver.
>>
> 
> The register offset differences are trivial and we do it in several
> drivers. Also in rtc-max77686 used by you here.
> Lack of features as well - just have a variant/driver data which defines
> certain features (true/false) or quirk bits (see s3c2410_wdt).
> 
> The second driver - s3c2410_wdt - also customizes the bits.
> 
> Therefore if the generic device operating configuration is similar (same
> generic control flow) and differences are in bits and offsets, then it
> should be one driver.
> 

Exactly.

Thanks,
Guenter

