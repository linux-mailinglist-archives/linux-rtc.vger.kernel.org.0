Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794BB3B2C37
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jun 2021 12:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhFXKRP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Jun 2021 06:17:15 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:38386 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbhFXKRO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Jun 2021 06:17:14 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 7C3EA1FD66;
        Thu, 24 Jun 2021 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624529694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wmskX7ULKgzDGDKyyD8iLetwEAVX0RxiPXHbdGQ61uE=;
        b=SXO0V596zOTGpvl2QkhQ7AhwKp8CSWnUX59Eia6sCNdviguLyBfzEY39AC0w3Sn61LZMTN
        sjF/zfQgm2QKWRmUoSt6DXfAy6B7dHx1MOlv+EBnr2Gy+ICTD8ISQW+p7n0SyfmRB0sDqt
        LilbUz3Mv5VFK4YXQsuq8mZMr4Yi2TU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624529694;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wmskX7ULKgzDGDKyyD8iLetwEAVX0RxiPXHbdGQ61uE=;
        b=mOZXF95/V/xhX7F5hPhGet0dFO3SYf1iXV5vLsMO4jJ1OpSSh3icSE4IljtUJCa1m/IAcU
        mHa2Ce9gWIau+8Cg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 4893511A97;
        Thu, 24 Jun 2021 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624529694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wmskX7ULKgzDGDKyyD8iLetwEAVX0RxiPXHbdGQ61uE=;
        b=SXO0V596zOTGpvl2QkhQ7AhwKp8CSWnUX59Eia6sCNdviguLyBfzEY39AC0w3Sn61LZMTN
        sjF/zfQgm2QKWRmUoSt6DXfAy6B7dHx1MOlv+EBnr2Gy+ICTD8ISQW+p7n0SyfmRB0sDqt
        LilbUz3Mv5VFK4YXQsuq8mZMr4Yi2TU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624529694;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wmskX7ULKgzDGDKyyD8iLetwEAVX0RxiPXHbdGQ61uE=;
        b=mOZXF95/V/xhX7F5hPhGet0dFO3SYf1iXV5vLsMO4jJ1OpSSh3icSE4IljtUJCa1m/IAcU
        mHa2Ce9gWIau+8Cg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id YE5YEB5b1GByWwAALh3uQQ
        (envelope-from <ykaukab@suse.de>); Thu, 24 Jun 2021 10:14:54 +0000
Date:   Thu, 24 Jun 2021 12:14:52 +0200
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, biwen.li@nxp.com
Subject: Re: [PATCH RESEND v4] rtc: pcf2127: handle timestamp interrupts
Message-ID: <20210624101452.GC81946@suse.de>
References: <20210602104956.806-1-ykaukab@suse.de>
 <CAH+2xPAL0w4Urjpxopu8g-kGveTxLXAm8EVUc8s8xpX=fb7NeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAH+2xPAL0w4Urjpxopu8g-kGveTxLXAm8EVUc8s8xpX=fb7NeQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jun 24, 2021 at 08:31:00AM +0200, Bruno Thomsen wrote:
> Hi Mian,
> 
> Den ons. 2. jun. 2021 kl. 17.19 skrev Mian Yousaf Kaukab <ykaukab@suse.de>:
> >
> > commit 03623b4b041c ("rtc: pcf2127: add tamper detection support")
> > added support for timestamp interrupts. However they are not being
> > handled in the irq handler. If a timestamp interrupt occurs it
> > results in kernel disabling the interrupt and displaying the call
> > trace:
> >
> > [  121.145580] irq 78: nobody cared (try booting with the "irqpoll" option)
> > ...
> > [  121.238087] [<00000000c4d69393>] irq_default_primary_handler threaded [<000000000a90d25b>] pcf2127_rtc_irq [rtc_pcf2127]
> > [  121.248971] Disabling IRQ #78
> 
> This must have been introduced when alarm IRQ was added, as
> I always thought that tamper IRQ should be handled in user space
> with gpiomon. [...]
Correct.
> I can see that it looks like I only added a cover letter
> to the first 2 versions of patch series[1] and not the 3rd that got applied[2].
> It contains a link to how the tamper timestamp feature was tested[3].
> The script is a simple version of what is running in the product, but
> missing D-Bus call with busctl and hardware init when booted for the
> first time.
With the addition of alarm IRQ a IRQ handler (pcf2127_rtc_irq) has
been added in the driver. This handler must handle the tamper
interrupt when alarm IRQ is configured. Otherwise an IRQ storm happens
as described above.
> 
> I have just tested your patch with an upstream device tree[4] that uses
> the tamper feature, and that does not work. Probably caused by the
> fact that it does not use RTC alarm IRQ.
Make sense.
> 
> What device tree did you see the error on? If it's not upstream can you
> share how you configured the pcf2127 chip?
https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts#L75
> 
> I am not against changing how the tamper feature works, but I would like
> to see the upstream device tree[4] work before merging this patch.
If you agree to handle tamper detection via an interrupt, I can send
another revision to move initialization of tamper detection within
'if (alarm_irq > 0)'. tamper.sh can then just poll timestamp0 and check
return value. Rest of this patch stays the same.

Second option is to provide support for both cases. Let me know what
do you prefer.
> 
> /Bruno
> 
> [1] https://patchwork.ozlabs.org/project/rtc-linux/cover/20190813153600.12406-1-bruno.thomsen@gmail.com/
> [2] https://patchwork.ozlabs.org/project/rtc-linux/patch/20190822131936.18772-5-bruno.thomsen@gmail.com/
> [3] https://github.com/baxeno/linux-emc-test/blob/master/tamper/tamper.sh
> [4] https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/imx7d-flex-concentrator.dts

BR,
Yousaf
