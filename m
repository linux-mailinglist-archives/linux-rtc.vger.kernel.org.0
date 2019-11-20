Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61B31035D8
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Nov 2019 09:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbfKTINr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 Nov 2019 03:13:47 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:47884 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfKTINq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 20 Nov 2019 03:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LWWRhy/lpXdd9bV82IQuNm3MZLLMYYJ/OUP40MCCNdg=; b=I1H46GlzNLXpblyByzjT1hngZe
        CcPjWAUN1cbWjSTkDyCV26LegUD6TofHxCmFyMrA1sr+ptakpCwr7m6AiXiwTQHCpM4KJDodBfYpU
        x+105eQrWAaLedlMt3+osfqfAWmVajgv+twyofmSLm29i0Lzci1sikGyS1PJZl0EI7u0=;
Received: from leintor.e.ffh.zone ([81.3.6.94] helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iXL7O-0002z6-B7; Wed, 20 Nov 2019 09:13:42 +0100
Received: from [::1] (helo=localhost)
        by localhost with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iXL7M-0001HN-8c; Wed, 20 Nov 2019 09:13:40 +0100
Date:   Wed, 20 Nov 2019 09:13:39 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Pierre-Hugues Husson <phh@phh.me>
Cc:     Lee Jones <lee.jones@linaro.org>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 2/5] mfd: rn5t618: add irq support
Message-ID: <20191120091339.4de02ad0@kemnade.info>
In-Reply-To: <CAJ-oXjTQMgF+zzTkWz21yG4ZdAszSDKkiAqocBcUjyMNEd0ozQ@mail.gmail.com>
References: <20191031213835.11390-1-andreas@kemnade.info>
 <20191031213835.11390-3-andreas@kemnade.info>
 <CAJ-oXjTQMgF+zzTkWz21yG4ZdAszSDKkiAqocBcUjyMNEd0ozQ@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 20 Nov 2019 08:54:44 +0100
Pierre-Hugues Husson <phh@phh.me> wrote:

[...]
> >
> > +static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
> > +{
> > +       struct rn5t618 *priv = dev_get_drvdata(dev);
> > +
> > +       if (priv->chip_irq)
> > +               disable_irq(priv->chip_irq);
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
> > +{
> > +       struct rn5t618 *priv = dev_get_drvdata(dev);
> > +
> > +       if (priv->chip_irq)
> > +               enable_irq(priv->chip_irq);
> > +
> > +       return 0;
> > +}  
> 
> For what it's worth, the boards I have (Archos 101 Oxygen and Pipo P9)
> with rc5t619 use GPIO for power button.
> So IRQ would need to be enabled in suspend for this to work.
> Also, since you actually added alarm support, perhaps you want to
> wake-up from suspend using alarm as well?
> 
Already tested that, that works, because device_init_wakeup() is used. 
disable_irq() is needed because we cannot do i2c that early after resume.
Other mfd drivers do thas as well and waking up works.

Regards,
Andreas
