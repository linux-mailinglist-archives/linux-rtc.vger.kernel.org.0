Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B4215020A
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Feb 2020 08:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbgBCHqO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 3 Feb 2020 02:46:14 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44792 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbgBCHqO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 3 Feb 2020 02:46:14 -0500
Received: by mail-wr1-f65.google.com with SMTP id m16so16571095wrx.11
        for <linux-rtc@vger.kernel.org>; Sun, 02 Feb 2020 23:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3nucfqlZlbS9OuDGzb3kixq1Br5Ct5yP/xRIMcpGX3I=;
        b=mBsWaIqgxBm8aCgBacUzTG7hSSBWgBjHas+8ae87Zzr33BdDyOswJQPMH3FbJ0eOhD
         kCtZzepzkXSgXl+4F+CLOPlJ2CvCSbzSqx6sjQkzOq07TkagOaHfhR+5rwpkRwIaqwId
         NP6ltWCKqca7ky9ktf/JB9p3Hk1x+Ose9hDG1Xj1/MSitC77bKNotLaD8fVh0j4eFcS5
         DkJ8biOJMNn0LjxriM/OkD9IKdQVbi1l8TpOLPLF9LRFHPSvk6Cn1ueXhjy5n5Rcm996
         1c2z9DchENiRTvTIUJwHx6nLH8QULbKfTRr/dIGYh5UjzbVJFs+TN4awtfXJuOGZ+p9Y
         969g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3nucfqlZlbS9OuDGzb3kixq1Br5Ct5yP/xRIMcpGX3I=;
        b=hlL1c7CFW/RCEhDtLQ01w6LL0/Xeftdt1w25542AvG4b63758Ch4jNMkz1Bo95UTUi
         lRj46/Tsn+IFV+tSHElItCM0Elfdgzjtf8TBhvUdHjAw2gl/uE5NKZuWtF9WpcZ+qLZu
         WaeG1Isp0lPrrgeSKGd99GyIsEx7MAJ1wTP2NxAq5QwVAFeLxOVcOrIaUvBgYbJ2kno8
         WcQwfyDZF3+ci2ti58LyZrrriHJi8bXk1zjzynlbkNOJ9p1LsPVKcpKKH8BBJuP0oa33
         umSEewltQTjLu/Z3Q4FCQ1xfx3QS5vmH1PZ+qSIv+JFnYLEiQ61aG0l5JOLlXw++7JHW
         iTFg==
X-Gm-Message-State: APjAAAXHAxqVIqsDExiMLhAwN0CYExzJcAUhYul+AvTuohmbUChxNbte
        lDQ8yAT2eiWvdK60OxoydPUREQ==
X-Google-Smtp-Source: APXvYqwUM3eHfQyl0jYk2jMIm1HD6qhbHIGYlpCQN5vKCDU4ZGIkG0S0TmUkq8oDkZb8nAkfD69J1A==
X-Received: by 2002:adf:ffc7:: with SMTP id x7mr13424029wrs.159.1580715972793;
        Sun, 02 Feb 2020 23:46:12 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id r15sm21991157wmh.21.2020.02.02.23.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2020 23:46:12 -0800 (PST)
Date:   Mon, 3 Feb 2020 07:46:21 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Josef Friedl <josef.friedl@speed.at>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Ran Bi <ran.bi@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v7 3/6] mfd: Add support for the MediaTek MT6358 PMIC
Message-ID: <20200203074621.GB13919@dell>
References: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1576057435-3561-4-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20191216151735.GD2369@dell>
 <1579664886.6399.24.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1579664886.6399.24.camel@mtksdaap41>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 22 Jan 2020, Hsin-hsiung Wang wrote:

> Hi,
> 
> On Mon, 2019-12-16 at 15:17 +0000, Lee Jones wrote:
> > On Wed, 11 Dec 2019, Hsin-Hsiung Wang wrote:
> > 
> > > This adds support for the MediaTek MT6358 PMIC. This is a
> > > multifunction device with the following sub modules:
> > > 
> > > - Regulator
> > > - RTC
> > > - Codec
> > > - Interrupt
> > > 
> > > It is interfaced to the host controller using SPI interface
> > > by a proprietary hardware called PMIC wrapper or pwrap.
> > > MT6358 MFD is a child device of the pwrap.
> > > 
> > > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > > ---
> > >  drivers/mfd/Makefile                 |   2 +-
> > >  drivers/mfd/mt6358-irq.c             | 224 ++++++++++++++++++++++++++++
> > >  drivers/mfd/mt6397-core.c            |  45 +++++-
> > >  include/linux/mfd/mt6358/core.h      | 158 ++++++++++++++++++++
> > >  include/linux/mfd/mt6358/registers.h | 282 +++++++++++++++++++++++++++++++++++
> > >  include/linux/mfd/mt6397/core.h      |   3 +
> > >  6 files changed, 712 insertions(+), 2 deletions(-)
> > >  create mode 100644 drivers/mfd/mt6358-irq.c
> > >  create mode 100644 include/linux/mfd/mt6358/core.h
> > >  create mode 100644 include/linux/mfd/mt6358/registers.h

[...]

> > > +int mt6358_irq_init(struct mt6397_chip *chip)
> > > +{
> > > +	int i, j, ret;
> > > +	struct pmic_irq_data *irqd;
> > > +
> > > +	irqd = devm_kzalloc(chip->dev, sizeof(struct pmic_irq_data *),
> > > +			    GFP_KERNEL);
> > > +	if (!irqd)
> > > +		return -ENOMEM;
> > > +
> > > +	chip->irq_data = irqd;
> > > +
> > > +	mutex_init(&chip->irqlock);
> > > +	irqd->top_int_status_reg = MT6358_TOP_INT_STATUS0;
> > > +	irqd->num_pmic_irqs = MT6358_IRQ_NR;
> > > +	irqd->num_top = ARRAY_SIZE(mt6358_ints);
> > > +
> > > +	irqd->enable_hwirq = devm_kcalloc(chip->dev,
> > > +					  irqd->num_pmic_irqs,
> > > +					  sizeof(bool),
> > 
> > This is fragile.  What if the type changes elsewhere?
> > 
> 
> Thanks for your comment.
> Do you mean using 'sizeof(*irqd->enable_hwirq)' instead of
> 'sizeof(bool)'?

Yes please.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
