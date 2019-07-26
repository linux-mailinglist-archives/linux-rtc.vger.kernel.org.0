Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66F2F763E7
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2019 12:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfGZKxc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Jul 2019 06:53:32 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:22957 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfGZKxc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Jul 2019 06:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564138408;
        s=strato-dkim-0002; d=hartkopp.net;
        h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=TOKrxZ2OyEJs4c4sLsk7QIzNT6nsp5zzXPgdZ8pEkUc=;
        b=PDRvVMK2wCjZzp88hjp3o2KsmkVwYowNRUNRrdsJLcPso+3x1oOdzJ5aRa/zoepeKE
        AGJtgY/kRIUmJmhNCH9NMWTXKmTYFyGMpQzBy2/TZA4cdm7Ww561VSpFKOP8OGeztNRD
        SZzTw9+1zkGL5e2zAiNINS6/iq4IrM4DdFgS2g2khBo1K+hy1IbvBqNI/S3CEEMM/Vxg
        n3xLFqYU19pUH3aRspFcR+s37R18wUDRMHSDDT5GtiT12CjbH0UO+Wwbduqd2u8Tbe1N
        tcNiV/avPdY7pr/q7PQodh37zPR4fYTqyzuVBm2tPaQss4ooloFAfuoSwrCZaDAJLitD
        PtGg==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3PMaViOoLMJU8h5k0VR"
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.200]
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id k05d3bv6QArKnAj
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 26 Jul 2019 12:53:20 +0200 (CEST)
Subject: Re: Bug#932845: TS-219 RTC issue with Debian Buster
From:   Oliver Hartkopp <socketcan@hartkopp.net>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        932845@bugs.debian.org, linux-rtc@vger.kernel.org
References: <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <20190724070704.GA5983@taurus.defre.kleine-koenig.org>
 <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
 <806117df-54ac-88f2-06a0-20a7502202ff@hartkopp.net>
 <20190726072759.uxx7i2hrl5qr4oux@pengutronix.de>
 <ec38f0ea-2113-5054-b98a-a4798eb61c82@hartkopp.net>
 <20190726093949.GA3962@piout.net>
 <c9bf6730-1cbe-96ad-6800-5a91ccd4040d@hartkopp.net>
Message-ID: <69cfdfbc-c2cf-9b78-bbbc-3dcb33d64316@hartkopp.net>
Date:   Fri, 26 Jul 2019 12:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c9bf6730-1cbe-96ad-6800-5a91ccd4040d@hartkopp.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Just a thought:

There are some of these rtc drivers that set

rtc->rtc->uie_unsupported = 1;

in the case that they can't assign an irq line.

But others set

rtc->rtc->uie_unsupported = 1;

when they don't support an (alarm) trigger with 1 sec accuracy.

Wouldn't it make sense to put

+       select RTC_INTF_DEV
+       select RTC_INTF_DEV_UIE_EMUL

in the Kconfig entries of the latter devices?

Best regards,
Oliver


On 26.07.19 12:26, Oliver Hartkopp wrote:
> Hello Alexandre,
> 
> On 26.07.19 11:39, Alexandre Belloni wrote:
> 
>>>>> Maybe this problem is only relevant for the S35390A and PCF8563 
>>>>> chip which
>>>>> both lack the UIE support needed by hwclock. Both have only alarm 
>>>>> triggers
>>>>> in a minute accuracy according to the driver source code.
>>>>
>>>> AFAIK the rtc framework should then emulate this event somehow.
>>>
>>> I don't think so. When the rtc chip is not able to trigger an event 
>>> with a
>>> one second resolution - how can you emulate that?
>>>
>>
>> CONFIG_RTC_INTF_DEV_UIE_EMUL emulates it by polling the RTC.
>>
> 
> Just booted my NAS box and /boot/config-4.19.0-5-marvell contains
> 
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> 
> Would be cool when this would make hwclock happy.
> 
> Best regards,
> Oliver
