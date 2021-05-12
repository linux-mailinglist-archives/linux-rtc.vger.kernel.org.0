Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157A337EE61
	for <lists+linux-rtc@lfdr.de>; Thu, 13 May 2021 00:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhELVm1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 17:42:27 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:56557 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344149AbhELUDb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 16:03:31 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d61 with ME
        id 3w2G2500221Fzsu03w2GZX; Wed, 12 May 2021 22:02:18 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 12 May 2021 22:02:18 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
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
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <9535976d-1029-3668-4be4-c09068ccf84c@wanadoo.fr>
Date:   Wed, 12 May 2021 22:02:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJv+mMRcOuTJxLuk@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Le 12/05/2021 à 18:13, Alexandre Belloni a écrit :
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
> 
> A better way to remove the dead code would be to switch to
> devm_rtc_allocate_device/devm_rtc_register_device.

I don't follow you here.
Isn't devm_rtc_device_register = devm_rtc_allocate_device + 
devm_rtc_register_device?

What would be the benefit for switch to the latter?


> And even better would
> be to take that opportunity to set range_min and range_max ;)

Maybe, but this goes beyond my knowledge.
I'll let someone else propose a patch for it.

CJ

