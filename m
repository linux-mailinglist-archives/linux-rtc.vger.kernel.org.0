Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418B73D9F3B
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jul 2021 10:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbhG2IM5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Jul 2021 04:12:57 -0400
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:35774 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234673AbhG2IM4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Jul 2021 04:12:56 -0400
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Jul 2021 04:12:56 EDT
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id E2A9C20402;
        Thu, 29 Jul 2021 08:06:46 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id CD29F260EB;
        Thu, 29 Jul 2021 08:06:42 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id B28F63F15F;
        Thu, 29 Jul 2021 10:06:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 866EC2A514;
        Thu, 29 Jul 2021 10:06:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1627545999;
        bh=MxHmdT4bsC43647pu5QM2aJET0ZwS2Bb3sTp+rRAXqs=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=FdCP0ilGJPnQuZ5rudRg5Rk6XLpM8blugW+0fOFYAuI3grN9JWvT0l+bx0inXNtu8
         tx2zjTY3hiphcqAxb6BCTj+BKLTNeWr3HG8q+syF7TSNONZyky7AYNPWLSSTaVj2qp
         Na/C7YVFjgrKt1iQs28ekRbskrGVbHdhaygNSDe4=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id J9GZCaWJa08s; Thu, 29 Jul 2021 10:06:38 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 29 Jul 2021 10:06:38 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id D444541BC6;
        Thu, 29 Jul 2021 08:06:36 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="wL7QlJco";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [192.168.0.46] (unknown [14.154.30.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 8D48D41BC6;
        Thu, 29 Jul 2021 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1627545982; bh=MxHmdT4bsC43647pu5QM2aJET0ZwS2Bb3sTp+rRAXqs=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=wL7QlJcoPqMLq/nXtvFWnwybsQmHWtPSTk2Kmy+ZPkht1BUy52Q8B8PhstnLmbZrG
         kBy4VxKXZnjRXzhI19yi4OzYv8E4a6URGOOQ/J7ZeZ385gv8swRpXmlokN1of0yxRq
         8IG0vcuhYv2vYraQHY9WhLXD4c44dwzd7TTn8aZ0=
Message-ID: <1e49692a2f4548ae942e170bc1ae9431a6eb512e.camel@aosc.io>
Subject: Re: [PATCH v7 06/19] rtc: sun6i: Add support for RTCs without
 external LOSCs
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Maxime Ripard <maxime@cerno.tech>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Date:   Thu, 29 Jul 2021 16:04:10 +0800
In-Reply-To: <20210616091431.6tm3zdf77p2x3upc@gilmour>
References: <20210615110636.23403-1-andre.przywara@arm.com>
         <20210615110636.23403-7-andre.przywara@arm.com>
         <20210616091431.6tm3zdf77p2x3upc@gilmour>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D444541BC6
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DMARC_NA(0.00)[aosc.io];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_TWELVE(0.00)[14];
         RECEIVED_SPAMHAUS_PBL(0.00)[14.154.30.140:received];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[csie.org,gmail.com,kernel.org,sholland.org,lists.infradead.org,googlegroups.com,lists.linux.dev,vger.kernel.org,megous.com,towertech.it,bootlin.com];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

在 2021-06-16星期三的 11:14 +0200，Maxime Ripard写道：
> Hi,
> 
> On Tue, Jun 15, 2021 at 12:06:23PM +0100, Andre Przywara wrote:
> > Some newer Allwinner RTCs (for instance the one in the H616 SoC)
> > lack
> > a pin for an external 32768 Hz oscillator. As a consequence, this
> > LOSC
> > can't be selected as the RTC clock source, and we must rely on the
> > internal RC oscillator.
> > To allow additions of clocks to the RTC node, add a feature bit to
> > ignore
> > any provided clocks for now (the current code would think this is
> > the
> > external LOSC). Later DTs and code can then for instance add the
> > PLL
> > based clock input, and older kernel won't get confused.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Honestly, I don't really know if it's worth it at this point.
> 
> If we sums this up:
> 
>  - The RTC has 2 features that we use, mostly centered around 2
>    registers set plus a global one
> 
>  - Those 2 features are programmed in a completely different way
> 
>  - Even the common part is different, given the discussion around the
>    clocks that we have.
> 
> What is there to share in that driver aside from the probe, and maybe
> the interrupt handling? Instead of complicating this further with
> more
> special case that you were (rightfully) complaining about, shouldn't
> we
> just acknowledge the fact that it's a completely separate design and
> should be treated as such, with a completely separate driver?

I think our problem is just that we're having a single driver for both
functionalities (clock manager and RTC).

Personally I don't think we should have seperated driver for clock
managers, although I am fine with seperated RTC driver for linear days.

By the way, not having a LOSC is only what happens on H616, maybe
because there should never be a battery-backed H616 device. On R329,
the RTC part has linear day storage, but it still have LOSC. Because of
this, I don't think we should duplicate at least at least the current
sun6i-rtc dual-functionality driver, because the clock funtionality is
just the same with previous SoCs on R329.

> 
> Maxime

