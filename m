Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C23518416B
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2020 08:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgCMHVu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 13 Mar 2020 03:21:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39668 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgCMHVu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 13 Mar 2020 03:21:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id r15so10724009wrx.6
        for <linux-rtc@vger.kernel.org>; Fri, 13 Mar 2020 00:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sQxXi9CRhC6J1JA72O4VCpde45a5cXX2Zji3I69uQo4=;
        b=j4zuqFUo45Vugz82Ecfgizma7gF6A9D6+QHJCcpEJLOtWyy782IHdt5nRr2S0vYWrl
         tCd5QlOFhGEqUCOORfc5U40kPbWKiSMoQxTpqONDLpqIHBiQFBGoAmm9Yy+Yr9YgizWJ
         fsMC4KUgBQqdxCLj4Z7VtqLTVroMe1Q7nKS2ecVcjc0feUY8R8u2yFzWkVY2/uDRJPYG
         tIyb/7nj1iiVKEq7DzZgN/Z41e/T+oMiwjQ/f+M1WoZ1GeZUZN987rLGKqyhgNeL8GHU
         9OjOEVZaJ/ulyf98yV3CxVR6qr0lnKhuMOTWpuZKnFxIwNmDDyH5V+SjdJcur7pxXaOf
         UjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sQxXi9CRhC6J1JA72O4VCpde45a5cXX2Zji3I69uQo4=;
        b=Y62S2gV4vKAjPFyikEwBwRAllfj2yOe2HjaZxUzyykZ8LyCChlEoN18h5etYjDnIFB
         4CIf+ENrrJMIUhRkoGBUuMwXjaFtzHMmt+msJin0JFTVFHtUetxr96k+aVFj7zb9DOzD
         6vhTk/smU8N//V6Tze98s/amvnWYEU4KaSeL5vyWQaAvsn3bCfJzFolZDniUybcjOpKm
         B9UZoXOiFSm8dltwjK+6LAihZvhU9Q4nSyixj0f41WdOUHslTD0nkB1+VvzWz0swStkP
         XLukE9cao8MqM/zRLE3VIw3sFMLcwtxpiGCWnoSbLvw+ksuVGHUsreJckC16z+C2aPEu
         MtgA==
X-Gm-Message-State: ANhLgQ0FdwZM/PUhnNUCYczsRenwMqHBNysEJHmYJpLVcvGBIc+Kd3Vl
        279eYnIlc/4UuKx1MG9w2PGmKg==
X-Google-Smtp-Source: ADFU+vuPgfTs8juRvDQP7ie5Jjw78q3AucIP1CU5GMcpnF/BXVNtLxngkCxpmiEz6jntkh7XZvkSTw==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr16016232wrt.300.1584084108142;
        Fri, 13 Mar 2020 00:21:48 -0700 (PDT)
Received: from dell ([2.27.167.19])
        by smtp.gmail.com with ESMTPSA id x8sm68094533wro.55.2020.03.13.00.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 00:21:47 -0700 (PDT)
Date:   Fri, 13 Mar 2020 07:22:30 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Ran Bi <ran.bi@mediatek.com>
Cc:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Frank Wunderlich <frank-w@public-files.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        Josef Friedl <josef.friedl@speed.at>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v10 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200313072230.GC3142@dell>
References: <1583918223-22506-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1583918223-22506-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200312074407.GA3142@dell>
 <1584003477.6269.8.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1584003477.6269.8.camel@mhfsdcap03>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 12 Mar 2020, Ran Bi wrote:

> On Thu, 2020-03-12 at 07:44 +0000, Lee Jones wrote:
> > On Wed, 11 Mar 2020, Hsin-Hsiung Wang wrote:
> > 
> > > From: Ran Bi <ran.bi@mediatek.com>
> > > 
> > > This add support for the MediaTek MT6358 RTC. Driver using
> > > compatible data to store different RTC_WRTGR address offset.
> > > This replace RTC_WRTGR to RTC_WRTGR_MT6323 in mt6323-poweroff
> > > driver which only needed by armv7 CPU without ATF.
> > > 
> > > Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> > > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > > ---
> > >  drivers/power/reset/mt6323-poweroff.c |  2 +-
> > >  drivers/rtc/rtc-mt6397.c              | 32 ++++++++++++++++++++++++--------
> > >  include/linux/mfd/mt6397/rtc.h        |  9 ++++++++-
> > >  3 files changed, 33 insertions(+), 10 deletions(-)
> > > 
> 
> <...>
> 
> > >  
> > >  #define RTC_IRQ_STA            0x0002
> > >  #define RTC_IRQ_STA_AL         BIT(0)
> > > @@ -65,6 +67,10 @@
> > >  #define MTK_RTC_POLL_DELAY_US  10
> > >  #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
> > >  
> > > +struct mtk_rtc_data {
> > > +	u32			wrtgr;
> > > +};
> > 
> > Do you expect to add more properties to this struct?
> > 
> > If not, it seems a bit overkill.
> > 
> 
> Yes, we would add more properties here in future patches.
> 
> > >  struct mt6397_rtc {
> > >  	struct device           *dev;
> > >  	struct rtc_device       *rtc_dev;
> > > @@ -74,6 +80,7 @@ struct mt6397_rtc {
> > >  	struct regmap           *regmap;
> > >  	int                     irq;
> > >  	u32                     addr_base;
> > > +	const struct mtk_rtc_data *data;
> > 
> > 'data' is a terrible variable name.
> > 
> > Why do you need to store this?
> > 
> > It's one variable which is used once AFAICT.
> 
> I would rename 'data' to 'config'.
> 
> This struct will be extended in future patches to achieve more PMIC chip
> compatibility.

On closer inspection, it looks like wrtgr (also not a great name for a
variable by the way) is a register address.  Is that correct?
Initially I thought it was a model number, which would have been a
suitable candidate for entry into OF .data.

However, describing register addresses in OF .data does not sound like
good practice.  It is usually used to identify a platform in the cases
where platforms cannot be otherwise dynamically interrogated for model
number via a register read.

Describing register maps via 'config' data is a slippery slope.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
