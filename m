Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BFD44F36F
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Nov 2021 14:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbhKMNtY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Sat, 13 Nov 2021 08:49:24 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:46976 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231672AbhKMNtX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 13 Nov 2021 08:49:23 -0500
Received: from [77.244.183.192] (port=65076 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mltMT-000BCf-Ic; Sat, 13 Nov 2021 14:46:29 +0100
Subject: Re: [PATCH v3 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
To:     Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
 <f1cbbc17-7a06-2d57-bf3d-c8133dcd30f7@roeck-us.net>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <d2ae9a19-217c-01e5-d9d3-a715919ca7f2@lucaceresoli.net>
Date:   Sat, 13 Nov 2021 14:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f1cbbc17-7a06-2d57-bf3d-c8133dcd30f7@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Guenter, Krzysztof,

On 12/11/21 20:23, Guenter Roeck wrote:
> On 11/12/21 8:07 AM, Krzysztof Kozlowski wrote:
>> On 12/11/2021 17:02, Luca Ceresoli wrote:
>>> Hi Guenter,
>>>
>>> On 12/11/21 15:57, Guenter Roeck wrote:
>>>> On 11/11/21 2:58 PM, Luca Ceresoli wrote:
>>>>> Add a simple driver to support the watchdog embedded in the Maxim
>>>>> MAX77714
>>>>> PMIC.
>>>>>
>>>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>>>>
>>>>
>>>> I just realized that this is effectively a rewrite of
>>>> drivers/watchdog/max77620_wdt.c.
>>>> The only difference I can see is is the register offsets (0x91 and 0x92
>>>> vs. 1 and 2) and some implementation details. Please add support for
>>>> this
>>>> watchdog to the other driver or provide a _really_ good reason why that
>>>> is not possible.
>>>
>>> I initially started developing MAX77714 watchdog support as an addition
>>> to max77620_wdt.c as the procedures look identical at least for the
>>> basic features.
>>>
>>> But the register content seems completely different. Here are the notes
>>> I took at that time:
>>>
>>> -------------------------8<-------------------------
>>>
>>> MAX77620 has reg ONOFFCNFG1  at 0x41, ONOFFCNFG2  at 0x42.
>>> MAX77714 has reg CNFG1_ONOFF at 0x93, CNFG2_ONOFF at 0x94.
>>> OK, we can handle this with a register indirection table, indexed by
>>> chip model.
>>>
>>> MAX77620 has MAX77620_REG_FPS_CFG0 register.
>>> On MAX77714 I was unable to find any such register (I haven't looked at
>>> FPS in detail though).
>>> OK, we can handle this with some if()s or entirely disable PM on the
>>> 77714 until anybody cares.
>>>
>>> MAX77620 ONOFFCNFG1  has SFT_RST in bit 7.
>>> MAX77714 CNFG1_ONOFF has SFT_RST is bit 6.
>>> Uhm, should we have a _bit_ indirection table in addition to the
>>> _register_ indirection table?
>>>
>>> MAX77620 ONOFFCNFG2  bit 5 is SLP_LPM_MSK, involved in FPS.
>>> MAX77620 ONOFFCNFG2  bit 6 is WD_RTS_WK, configures the watchdog timer.
>>> MAX77714 CNFG2_ONOFF bit 5 is WD_RTS_WK, configures the watchdog timer.
>>> On MAX77714 I haven't found SLP_LPM_MSK.
>>>
>>> MAX77620 has 6 CID registers with "ES version" in CID5.
>>> MAX77714 has 5 CID registers with "DEVICE id" in CID3.
>>> CID registers would be useful to get the chip model directly from the
>>> chip, if only they had the same structure.
>>>
>>> Almost all of the registers I have been looking into have similar
>>> differences.
>>>
>>> -------------------------8<-------------------------
>>>
>>> When I started adding indirection tables the driver started growing
>>> bigger and uglier, and that little simple driver started being big and
>>> complex. So I opted to add a new driver.
>>>
>>
>> The register offset differences are trivial and we do it in several
>> drivers. Also in rtc-max77686 used by you here.
>> Lack of features as well - just have a variant/driver data which defines
>> certain features (true/false) or quirk bits (see s3c2410_wdt).
>>
>> The second driver - s3c2410_wdt - also customizes the bits.
>>
>> Therefore if the generic device operating configuration is similar (same
>> generic control flow) and differences are in bits and offsets, then it
>> should be one driver.
>>
> 
> Exactly.

Ok, I'll do that and send v4.

Now I realize I should have mentioned from the beginning the reasons for
creating a new driver, so this discussion would have been cleared much
earlier. Apologies for that.

Patches 1-6 + 8 are not impacted and will need no change for this issue.

-- 
Luca

