Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54BA876377
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2019 12:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfGZK0j (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Jul 2019 06:26:39 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:25399 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfGZK0j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Jul 2019 06:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564136797;
        s=strato-dkim-0002; d=hartkopp.net;
        h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=usEg5ZNsc8b5yEfhTj4thUaTJPdOSzDOINi64dEojFg=;
        b=mGmhHvxnV/F1hSAG2EChztNU8miP7Ymbzdbuxg5j1rBtuIB64Lhwk1rTFQa9nGQPlB
        U5cgecZXWKlG7xt3gbrSRa3VCWKZFHWx1+KHF+u7pf3I5YX8RTImsG+LVnN6WLpobmui
        IzFQJTYCPbeALIr0nQnn4PEtyg1TXptEtqgWnD7Jfydtq9CEswz9NIpt1OOfexVJUsRU
        RBxBsurjfz/j1xfx1EsZu7piysKYj/+P9T9P25UtDCXgTxH1mwZhQAcDk6UzZ9j2xQy3
        Fc7iRLoXTUCsjbyVfyuZj8hvl5D1Ce9+lHySkGkVAODMVGKjh/oYiaW6Jll5XrBLJel4
        yeBQ==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3PMaViOoLMJU8h5k0VR"
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.200]
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id k05d3bv6QAQVn5Y
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 26 Jul 2019 12:26:31 +0200 (CEST)
Subject: Re: Bug#932845: TS-219 RTC issue with Debian Buster
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
From:   Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <c9bf6730-1cbe-96ad-6800-5a91ccd4040d@hartkopp.net>
Date:   Fri, 26 Jul 2019 12:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726093949.GA3962@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Alexandre,

On 26.07.19 11:39, Alexandre Belloni wrote:

>>>> Maybe this problem is only relevant for the S35390A and PCF8563 chip which
>>>> both lack the UIE support needed by hwclock. Both have only alarm triggers
>>>> in a minute accuracy according to the driver source code.
>>>
>>> AFAIK the rtc framework should then emulate this event somehow.
>>
>> I don't think so. When the rtc chip is not able to trigger an event with a
>> one second resolution - how can you emulate that?
>>
> 
> CONFIG_RTC_INTF_DEV_UIE_EMUL emulates it by polling the RTC.
> 

Just booted my NAS box and /boot/config-4.19.0-5-marvell contains

# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set

Would be cool when this would make hwclock happy.

Best regards,
Oliver
