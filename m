Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB55F7208F
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2019 22:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbfGWUNj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jul 2019 16:13:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:35733 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728939AbfGWUNj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jul 2019 16:13:39 -0400
X-Greylist: delayed 370 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Jul 2019 16:13:38 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563912817;
        s=strato-dkim-0002; d=hartkopp.net;
        h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=eBK5/xXylihI72CIYlFNwhNnCXMKY7krL4ZR3jC0/wk=;
        b=WchMe1wMyCmPq7f/nMRqo3OFDzAyfyv9PhdR3jHp/gzOtASn8TF/7lW/ZePPM6jj3H
        cPpqVjFO+CRoS09oVYjELJzN/sgXmfpD39v917iGvLeVELl93dAe+arMgH1vpKz6njYW
        qYi3jjQ2zf+L0HkgGUZmPAJkOYefAPvtpCzXV0c12u+MoZRwNymMP4PqoeBPwzyc48sa
        Qu5Ap1GUNXfT8SU6B7/uDzbtO0Gi1cYCFeUVIvczEWGxzMDsy/XXHhPw6owFGXV0CdOu
        HOdab4p3S/m5Q0Jiwh4hUxk0zmWuWjWIMEVVYgpostZea0Qz0uQsspxJ7L0cYSZmU+sm
        tLgA==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3PMaViOoLMJV8h6liA="
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.200]
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id k05d3bv6NK7BfBs
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 23 Jul 2019 22:07:11 +0200 (CEST)
Subject: Re: TS-219 RTC issue with Debian Buster
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
        tbm@cyrius.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
References: <99a8e2cc-61a2-3b43-0d72-6f001cffe572@hartkopp.net>
 <20190723190636.tuzob2w2fznmtsmb@pengutronix.de>
 <4a5c0768-0383-0a16-8d3f-639dc9530abf@hartkopp.net>
 <20190723193443.bqcbrxalng554u76@pengutronix.de>
From:   Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <d633b585-2e66-3143-29c6-418517869d6b@hartkopp.net>
Date:   Tue, 23 Jul 2019 22:07:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723193443.bqcbrxalng554u76@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Uwe,

On 23.07.19 21:34, Uwe Kleine-König wrote:

> On Tue, Jul 23, 2019 at 09:21:06PM +0200, Oliver Hartkopp wrote:
>> I think I already solved the problem, see here:
>> https://marc.info/?l=linux-arm-kernel&m=156390875629259&w=2
> 
> IMHO the right fix is teach hwclock to handle your rtc correctly.
> Changing the driver from =m to =y is only a workaround.

Agreed.

> Maybe also using the time stuff from systemd instead of hwclock will
> help^Wwork around your problem (not sure though).
> 
> Also I wonder why the ioctl to enable UIE doesn't fail if the driver set
> .uie_unsupported (but I didn't look closely).

Right. When executing the ioctl(4, RTC_UIE_ON) syscall it just get's 
stuck and the select() timeout captures the call after 10 seconds.

I would have expected that ioctl(4, RTC_UIE_ON) returns with some 
-EINVAL or -ENOTSUPP value.

I'm not sure if hwclock needs the trigger for precision reasons:

https://github.com/karelzak/util-linux/blob/master/sys-utils/hwclock.c#L276

... or if this can be omitted.

>> Will file a Debian bug for it ...
> 
> Not sure this will have success. These were switched from =y to =m
> because the kernel images got to big.
> (https://salsa.debian.org/kernel-team/linux/commit/c55043a43eaacb9f876dabd71273b084cb024441)

Too late ;-)
I will just wait for the answer.

Best regards,
Oliver
