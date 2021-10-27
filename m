Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B3C43C7B7
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Oct 2021 12:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241461AbhJ0KfD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Oct 2021 06:35:03 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59162 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241452AbhJ0KfC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Oct 2021 06:35:02 -0400
Received: from [79.2.93.196] (port=39116 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mfgEV-00G4kG-C9; Wed, 27 Oct 2021 12:32:35 +0200
Subject: Re: [PATCH v2 6/9] mfd: max77714: Add driver for Maxim MAX77714 PMIC
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
 <20211019145919.7327-7-luca@lucaceresoli.net> <YXG060evUw8rnR3O@google.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <3520ff3d-1ec0-5500-7fee-538afa25d413@lucaceresoli.net>
Date:   Wed, 27 Oct 2021 12:32:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXG060evUw8rnR3O@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Lee,

On 21/10/21 20:43, Lee Jones wrote:
> On Tue, 19 Oct 2021, Luca Ceresoli wrote:
[...]
>> diff --git a/drivers/mfd/max77714.c b/drivers/mfd/max77714.c
>> new file mode 100644
>> index 000000000000..4b49d16fe199
>> --- /dev/null
>> +++ b/drivers/mfd/max77714.c
>> @@ -0,0 +1,165 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Maxim MAX77714 MFD Driver
>> + *
>> + * Copyright (C) 2021 Luca Ceresoli
>> + * Author: Luca Ceresoli <luca@lucaceresoli.net>
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/mfd/max77714.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +
>> +struct max77714 {
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +	struct regmap_irq_chip_data *irq_data;
> 
> Is this used outside of .probe()?

No.

>> +/*
>> + * MAX77714 initially uses the internal, low precision oscillator. Enable
>> + * the external oscillator by setting the XOSC_RETRY bit. If the external
>> + * oscillator is not OK (probably not installed) this has no effect.
>> + */
>> +static int max77714_setup_xosc(struct max77714 *chip)
> 
> May as well just pass 'dev' and 'regmap' to this function and do away
> with the superfluous struct along with all of it's memory management
> handling requirements.

Good idea!

>> +{
>> +	/* Internal Crystal Load Capacitance, indexed by value of 32KLOAD bits */
>> +	static const unsigned int load_cap[4] = {0, 10, 12, 22};
> 
> Probably best to define these magic numbers.

Since these numbers do not appear anywhere else I don't find added value in:

  #define MAX77714_LOAD_CAP_0   0
  #define MAX77714_LOAD_CAP_10  10
  #define MAX77714_LOAD_CAP_12  12
  #define MAX77714_LOAD_CAP_22  22
  [...]
  static const unsigned int load_cap[4] = {
      MAX77714_LOAD_CAP_0,
      MAX77714_LOAD_CAP_10,
      MAX77714_LOAD_CAP_12,
      MAX77714_LOAD_CAP_12,
  };

besides adding lots of lines and lots of "MAX77714_LOAD_CAP_". Even
worse, there is potential for copy-paste errors -- can you spot it? ;)
Finally, consider this is not even global but local to a small function.

But I'd rather add the unit ("pF") to either the comment line of the
array name (load_cap -> load_cap_pf) for clarity. Would that be OK for you?

Apart from this coding style topic I'm OK with all the other
improvements you proposed to this patch, all of them will be in v3.

Thank you for the detailed review!
-- 
Luca
