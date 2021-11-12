Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F8044EAF6
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Nov 2021 17:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbhKLQFC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Nov 2021 11:05:02 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:34729 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232458AbhKLQFA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Nov 2021 11:05:00 -0500
Received: from [77.244.183.192] (port=62782 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mlZ0B-000BVN-90; Fri, 12 Nov 2021 17:02:07 +0100
Subject: Re: [PATCH v3 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
To:     Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <7584d85a-5050-2b9d-1648-7d3bed2d10ea@lucaceresoli.net>
Date:   Fri, 12 Nov 2021 17:02:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0f278280-27d0-4d43-8065-76ec1f7c19b5@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi Guenter,

On 12/11/21 15:57, Guenter Roeck wrote:
> On 11/11/21 2:58 PM, Luca Ceresoli wrote:
>> Add a simple driver to support the watchdog embedded in the Maxim
>> MAX77714
>> PMIC.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>
> 
> I just realized that this is effectively a rewrite of
> drivers/watchdog/max77620_wdt.c.
> The only difference I can see is is the register offsets (0x91 and 0x92
> vs. 1 and 2) and some implementation details. Please add support for this
> watchdog to the other driver or provide a _really_ good reason why that
> is not possible.

I initially started developing MAX77714 watchdog support as an addition
to max77620_wdt.c as the procedures look identical at least for the
basic features.

But the register content seems completely different. Here are the notes
I took at that time:

-------------------------8<-------------------------

MAX77620 has reg ONOFFCNFG1  at 0x41, ONOFFCNFG2  at 0x42.
MAX77714 has reg CNFG1_ONOFF at 0x93, CNFG2_ONOFF at 0x94.
OK, we can handle this with a register indirection table, indexed by
chip model.

MAX77620 has MAX77620_REG_FPS_CFG0 register.
On MAX77714 I was unable to find any such register (I haven't looked at
FPS in detail though).
OK, we can handle this with some if()s or entirely disable PM on the
77714 until anybody cares.

MAX77620 ONOFFCNFG1  has SFT_RST in bit 7.
MAX77714 CNFG1_ONOFF has SFT_RST is bit 6.
Uhm, should we have a _bit_ indirection table in addition to the
_register_ indirection table?

MAX77620 ONOFFCNFG2  bit 5 is SLP_LPM_MSK, involved in FPS.
MAX77620 ONOFFCNFG2  bit 6 is WD_RTS_WK, configures the watchdog timer.
MAX77714 CNFG2_ONOFF bit 5 is WD_RTS_WK, configures the watchdog timer.
On MAX77714 I haven't found SLP_LPM_MSK.

MAX77620 has 6 CID registers with "ES version" in CID5.
MAX77714 has 5 CID registers with "DEVICE id" in CID3.
CID registers would be useful to get the chip model directly from the
chip, if only they had the same structure.

Almost all of the registers I have been looking into have similar
differences.

-------------------------8<-------------------------

When I started adding indirection tables the driver started growing
bigger and uglier, and that little simple driver started being big and
complex. So I opted to add a new driver.

Let me know whether that sounds OK.
-- 
Luca
