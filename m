Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA00142D3EE
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Oct 2021 09:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhJNHm2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Oct 2021 03:42:28 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:42784
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230094AbhJNHm1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Oct 2021 03:42:27 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 26F0E40021
        for <linux-rtc@vger.kernel.org>; Thu, 14 Oct 2021 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634197222;
        bh=BSACrBGTfG90TqLgzAR+u5HLMmvyB5Y7ctjsvIUfOYw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=rf73FfvICjWmOHydjk7/P9nde0aEjMseVn3ucM+h1FxxxDaFrgrESR4RCDSoacQbe
         NwOv41jP8Aumoe3JdgkSPSEg0YCJgU190w6u7UrrfuJvLtgSxIZ/m0zDucgggsjfg5
         PpfnN/FkoRQ3flYDVHCdKiFVv7KLjjdDLz0JrPjHb6Z5fiN+lIxNPgA2ikxogGEE7v
         U5fWUIyPnQJIyPPvpxJth2tNzipszWd7WeZP9D1hIwZKSH2MOPu/y3n6LGoU9qSX1e
         FyxY2Fbkoo9Dt1CdDeSAN77/JT/HIRVdd8KzSn9nOSu5ngM7JO4fFO83rikoMKdwOT
         XCIRRzv2xdOXQ==
Received: by mail-lf1-f69.google.com with SMTP id b36-20020a0565120ba400b003fda644089bso3744731lfv.18
        for <linux-rtc@vger.kernel.org>; Thu, 14 Oct 2021 00:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BSACrBGTfG90TqLgzAR+u5HLMmvyB5Y7ctjsvIUfOYw=;
        b=p1L0In8E3CgdXA3EGrh6xr8ked8PWk9vuJVFv+QcCsThMdUPFo1N50g6HQg7hTCeYJ
         M9wjXAeNg65kcDLORdASN2+Ii6MNTqgFm2aO6ccBrumXuNamq3jaksvWTN09+vINfMwP
         a/TItX6rvAojdr6nRo37FEH+3Jxm+ND9QA4gXvRQhDiC5W7tsB46SFP/I94mZNp5YaB+
         Hps3XvS+GgFaLGNGXAAxWUnUAv9Q2dKp1PIza1JxS0Du2nvIm/iuw7futPdya3HsHQgC
         2y9OkAvMIwA8/N0BinH98Zk3/muvExz4sL30LrwPQ1btrZLxjU2pqgCRmaUNvTIPPh+i
         rk2w==
X-Gm-Message-State: AOAM531gWnLw0GgcASYIU6ccA99YjPgHR5fcn96hNW3LTxhyv8gZl6vS
        qhCq/sXm8nB+PHS06JKcoF8GOS1FzKnqQC062Z6o01wG/0AttZtJfD6QckNUX0q5CbttuI28oyZ
        XLv8/rCZf+TdB/laDkIgeFUiUrzfpGkT5el7VQQ==
X-Received: by 2002:a05:651c:11c4:: with SMTP id z4mr4417345ljo.463.1634197221504;
        Thu, 14 Oct 2021 00:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ852blNGCE18lIHBFuHjg9N7QLcvT90c3zIFiYBIbtej5nM39qTScrIdLkFjQnn03d3q3kg==
X-Received: by 2002:a05:651c:11c4:: with SMTP id z4mr4417328ljo.463.1634197221346;
        Thu, 14 Oct 2021 00:40:21 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 189sm184857ljj.113.2021.10.14.00.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 00:40:20 -0700 (PDT)
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
 <b2355acf-94a5-1acf-122b-d661c6d9bb1b@canonical.com>
 <5236720c-96b0-3e18-e08f-a5dde982eab5@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b4ee3175-5bd7-cf75-2d2b-2cc9368842e7@canonical.com>
Date:   Thu, 14 Oct 2021 09:40:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5236720c-96b0-3e18-e08f-a5dde982eab5@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/10/2021 23:39, Luca Ceresoli wrote:
> Hi,
> 
> On 12/10/21 10:32, Krzysztof Kozlowski wrote:
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
>>
>> (...)
>>
>>> +
>>> +static const struct of_device_id max77714_dt_match[] = {
>>> +	{ .compatible = "maxim,max77714" },
>>> +	{},
>>> +};
>>
>> When converting to module - don't forget the MODULE_DEVICE_TABLE
>>
>>> +
>>> +static struct i2c_driver max77714_driver = {
>>> +	.driver = {
>>> +		.name = "max77714",
>>> +		.of_match_table = of_match_ptr(max77714_dt_match),
>>
>> Kbuild robot pointed it out - of_matc_ptr should not be needed, even for
>> compile testing without OF.
> 
> I wonder whether it's better to add '#ifdef CONFIG_OF / #endif' around
> the struct of_device_id declaration. I think it's what most drivers do,
> even though I tend to prefer not adding #ifdefs making code less clean
> only for COMPILE_TESTING.

No, most drivers added it long time ago before we switched it to a new
way - either __maybe_unused or without anything even. The point is that
OF driver can be reused for ACPI platforms. If you limit it with ifdef
or of_match_ptr, the ACPI platform won't have any table to use for binding.

Best regards,
Krzysztof
