Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8647E37CE2B
	for <lists+linux-rtc@lfdr.de>; Wed, 12 May 2021 19:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238118AbhELRDd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 13:03:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34802 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240848AbhELQZr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 12:25:47 -0400
Received: from mail-ua1-f71.google.com ([209.85.222.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lgrf3-0006Kf-FN
        for linux-rtc@vger.kernel.org; Wed, 12 May 2021 16:24:37 +0000
Received: by mail-ua1-f71.google.com with SMTP id v7-20020a9f31870000b029020b2d4ea5d9so1539551uad.8
        for <linux-rtc@vger.kernel.org>; Wed, 12 May 2021 09:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tCtdc0pje3aRjWOj2CAvfE8ROanzD/s4FkZcrRj+uXQ=;
        b=tPKdHWfWtHDV3CUacBd0eNIS63jdecyzIi7YCWHy0VqNSooQnE1oCQ9m15vB8oFRop
         sAzFv4ycfpT7z0BnzEYClEiyxSyxhVMtYH5QXH1BIhl3miNdzBJPyu8rIUhzxO4jZTBI
         Sr8cV8hs1lY2JzIKIOnAb5cX8sw/uOJv2tn965XlpdbDQCJmlMT8sol2L/Vvc2TARrZ7
         FeOPGEqIx7MFjKAOkJsFtWzivs8SgSoJe9r01FXqcNXSmQuA5cyX8Qy37tq8voEbNZwT
         bahT3amsIc8WWEnQ+6eDWyCaMGrvDOLFDIRrv5IRg1Jx9kwYrnASznax7fhOZ1caloVC
         hR7A==
X-Gm-Message-State: AOAM533sYNb+3v1+Kp6iTf8Iun55xmz6p9AmN7jMnu7GdDkfJz0XwBhY
        mSoB602FSjI8HUuYLOPzja1W1GwQv+RBFSkNMLAR4odYeyoB7M5iyxdKDOoPIKNjy5uFojtKik4
        4/QYNQjjYR8F71S6KHHSWstMIRzbfGUCryxLQ4w==
X-Received: by 2002:a67:edd0:: with SMTP id e16mr32113496vsp.4.1620836674137;
        Wed, 12 May 2021 09:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzCIIi7dj9wOhAkajl84mMy9AVmrPa/aYZpWXOGRIFFKYx9xsHaIs2QUJBfiCdoQCk58vghQ==
X-Received: by 2002:a67:edd0:: with SMTP id e16mr32113027vsp.4.1620836670303;
        Wed, 12 May 2021 09:24:30 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id s17sm33710vkk.50.2021.05.12.09.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 09:24:28 -0700 (PDT)
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
 <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
 <CAOc6etYwTvVPnoB3BQfuQEikvsCwSs9AqBWnLFrs9zQ0pJGp1A@mail.gmail.com>
 <YJhO0cEqpbJAdv7s@piout.net>
 <219efcc7-ca05-a7d1-5943-d34a42f0d49f@canonical.com>
 <YJv+mMRcOuTJxLuk@piout.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9b48e433-4e0b-7334-028d-d700e0cdbff0@canonical.com>
Date:   Wed, 12 May 2021 12:24:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJv+mMRcOuTJxLuk@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/05/2021 12:13, Alexandre Belloni wrote:
> On 10/05/2021 08:20:52-0400, Krzysztof Kozlowski wrote:
>> On 09/05/2021 17:06, Alexandre Belloni wrote:
>>> On 08/05/2021 18:06:03-0600, Edmundo Carmona Antoranz wrote:
>>>> On Sat, May 8, 2021 at 10:59 AM Christophe JAILLET
>>>> <christophe.jaillet@wanadoo.fr> wrote:
>>>>>
>>>>>>
>>>>>> Following the recent conversations, I think it might make sense to do
>>>>>> dev_err(&pdev->dev, "Failed to register RTC device: %pe\n", info->rtc_dev);
>>>>>>
>>>>>> Is that right?
>>>>>>
>>>>>
>>>>> Yes, it is right, but it should be done in another patch.
>>>>>
>>>>> Would you like to give it a try?
>>>>>
>>>> Sure, I'll have the patch ready to send it when I see yours on next.
>>>
>>> Does it make sense to print anything at all? Who would use the output?
>>> Is anyone actually going to read it?
>>
>> If the RTC core does not print the message, it should be
>> dev_err_probe().  However the first is recently preferred - RTC core
>> should do it for all drivers.  I find such error messages useful - helps
>> easily spotting regressions via dmesg -l err.
>>
> 
> The only error path that will not print a message by default (it is
> dev_dbg) is when rtc-ops is NULL which I don't expect would regress
> anyway.

Then the message in the driver is useless and could be removed.

> A better way to remove the dead code would be to switch to
> devm_rtc_allocate_device/devm_rtc_register_device. And even better would
> be to take that opportunity to set range_min and range_max ;)
> 

The driver already uses devm_rtc_device_register() so I think I don't
follow that part.

Best regards,
Krzysztof
