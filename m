Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232E342D3F5
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Oct 2021 09:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhJNHqk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Oct 2021 03:46:40 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43110
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229910AbhJNHqk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Oct 2021 03:46:40 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4D59B40020
        for <linux-rtc@vger.kernel.org>; Thu, 14 Oct 2021 07:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634197475;
        bh=YxA6fGNZ6kpnunGSBFEKjT2GQx46vYtRacXwF3gTOcA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=g0gw6JmrUbSTHUYPofY4faaeoaSZ8tTWsfk0OGOp8iy3wzz+btum5gdxutbuYdvwd
         ntYIDzHWa+Tjv6M4ANxpSZadyk3QhjuGPIdL23KtlNjyzGnF23JEDgGxRW/FiSi4VI
         ZCpCnJ+4xOq207atGQCq/+LrH5n9UbX0MrYB8XxbvAMQ+g5CZ4aSzlxNc4oXrZmejg
         emf5SiV35qIxlWxEKiLsCxbuTv5BpNea10kvxY1q6X3ebuhUrVoxbQi1eNM4Vab8fb
         vS32hEHHILuXCi1AtcHphvbN0j6jcOJ0rH5kIDg05pP8fOZ4PHbngUUmNzCbY/MYN8
         K1ZK4+dPOrZKQ==
Received: by mail-lf1-f69.google.com with SMTP id bu34-20020a05651216a200b003fd7bb9caa1so3816298lfb.0
        for <linux-rtc@vger.kernel.org>; Thu, 14 Oct 2021 00:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YxA6fGNZ6kpnunGSBFEKjT2GQx46vYtRacXwF3gTOcA=;
        b=Th8J1hFXBv1UijDZpY0pCnOGgiMzgodG9o3tMekcs9BK7JV8NcU15Qho9UN+5V5F7U
         reIW5HtAlzbG9oQiPZmVZSAdjhFMOwMcd19LB9j9ZK855BAEd83qqWGd6eSAz5KUcIaK
         9b/CevhUIGvs1MJOXU7P4G1LMKoIKWM2HifYmNVaEbXmFCXG1Voe0VA5IIKbauWh+7Mx
         hE0R7jxDLfvjS6orAS+5B5ok8if/I+FVmXyu8Kz5UQtZr1tAeUyH82lUNCxbY6EOJzmg
         Usv87b+azCCYWmUGQP/72ZyUZ+7icOQB65b0zI4OvK5PDYS439MG6j7AiBW64281Cphg
         KSMg==
X-Gm-Message-State: AOAM533gJC2lD82SRuP9HvSqxYE5Ug6WfYz70j+yPW5KzsgZSXAW/QEy
        3vL/2+b6PksmXeU6SEv9wBZZxtakTMKGwqFFrxjH7ymRYAkq7u0zTsuZCILvJznMkXMEEdeJ0GD
        UR/19c+9LmcQZSfLJXzx6ASunjflmV5aTQhLoXg==
X-Received: by 2002:a05:6512:c23:: with SMTP id z35mr3741949lfu.590.1634197473939;
        Thu, 14 Oct 2021 00:44:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9xB37hiRqL5qEQyETaPyULtK9+EdI9KDH1bHmVQfIHFvVJaWzHAXWeSE4urCbWqYM6PNDyQ==
X-Received: by 2002:a05:6512:c23:: with SMTP id z35mr3741941lfu.590.1634197473783;
        Thu, 14 Oct 2021 00:44:33 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id r26sm156209lfm.226.2021.10.14.00.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 00:44:33 -0700 (PDT)
Subject: Re: [PATCH 6/8] mfd: max77714: Add driver for Maxim MAX77714 PMIC
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-7-luca@lucaceresoli.net>
 <79a3c52b-ed4a-dadb-c7e2-2c96c9a58c49@canonical.com>
 <21684e2a-e84c-05ed-e27c-e710c53e3a64@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <092e893a-757c-fd4d-08a1-0ae65219e770@canonical.com>
Date:   Thu, 14 Oct 2021 09:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <21684e2a-e84c-05ed-e27c-e710c53e3a64@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/10/2021 23:49, Luca Ceresoli wrote:
> Hi,
> 
> On 12/10/21 10:09, Krzysztof Kozlowski wrote:
>> On 11/10/2021 17:56, Luca Ceresoli wrote:
>>> Add a simple driver for the Maxim MAX77714 PMIC, supporting RTC and
>>> watchdog only.
>>>
>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>> ---
>>>  MAINTAINERS                  |   2 +
>>>  drivers/mfd/Kconfig          |  14 ++++
>>>  drivers/mfd/Makefile         |   1 +
>>>  drivers/mfd/max77714.c       | 151 +++++++++++++++++++++++++++++++++++
>>>  include/linux/mfd/max77714.h |  68 ++++++++++++++++
>>>  5 files changed, 236 insertions(+)
>>>  create mode 100644 drivers/mfd/max77714.c
>>>  create mode 100644 include/linux/mfd/max77714.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 4d0134752537..df394192f14e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -11389,6 +11389,8 @@ MAXIM MAX77714 PMIC MFD DRIVER
>>>  M:	Luca Ceresoli <luca@lucaceresoli.net>
>>>  S:	Maintained
>>>  F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>>> +F:	drivers/mfd/max77714.c
>>> +F:	include/linux/mfd/max77714.h
>>>  
>>>  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>>>  M:	Javier Martinez Canillas <javier@dowhile0.org>
>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>>> index ca0edab91aeb..b5f6e6174508 100644
>>> --- a/drivers/mfd/Kconfig
>>> +++ b/drivers/mfd/Kconfig
>>> @@ -853,6 +853,20 @@ config MFD_MAX77693
>>>  	  additional drivers must be enabled in order to use the functionality
>>>  	  of the device.
>>>  
>>> +config MFD_MAX77714
>>> +	bool "Maxim Semiconductor MAX77714 PMIC Support"
>>
>> Why it cannot be a tristate (module)?
> 
> Because it's not done in the driver I initially copied from, I guess. :)
> 
> And also because I thought it's appropriate for a PMIC driver since
> regulators tend to be always instantiated. But I understand there are
> valid use cases for that -- will do in v2 unless a good reason pops up
> for not doing it.

Main PMIC as a module sometimes requires additional effort (like initrd
with the PMIC driver) to make system booting. Still for non-SoC
components we choose to allow modules (e.g. max77686).

It seems in your case it can be used as module easily because you did
not implement regulators, which are needed early for storage devices.

> 
>>> diff --git a/include/linux/mfd/max77714.h b/include/linux/mfd/max77714.h
>>> new file mode 100644
>>> index 000000000000..ca6b747b73c2
>>> --- /dev/null
>>> +++ b/include/linux/mfd/max77714.h
>>> @@ -0,0 +1,68 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Maxim MAX77714 Register and data structures definition.
>>> + *
>>> + * Copyright (C) 2021 Luca Ceresoli
>>> + * Author: Luca Ceresoli <luca@lucaceresoli.net>
>>> + */
>>> +
>>> +#ifndef _MFD_MAX77714_H_
>>> +#define _MFD_MAX77714_H_
>>
>> Header guard:
>> __LINUX_MFD_MAX77714_H_
> 
> OK.
> 
>>> +
>>> +struct max77714 {
>>> +	struct device *dev;
>>> +	struct regmap *regmap;
>>> +	struct regmap_irq_chip_data *irq_data;
>>> +
>>> +	int irq;
>>> +};
>>
>> Do you have to make it a public structure? If not, please put it in the
>> max77714.c
> 
> Good point. Will fix.
> 


Best regards,
Krzysztof
