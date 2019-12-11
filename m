Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5609111A564
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2019 08:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfLKHua (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Dec 2019 02:50:30 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55106 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbfLKHu3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Dec 2019 02:50:29 -0500
Received: by mail-wm1-f66.google.com with SMTP id b11so5908876wmj.4
        for <linux-rtc@vger.kernel.org>; Tue, 10 Dec 2019 23:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=B4jibqDc1qVy/j2PdbJbaqTCeLaTTJvVeLinEnfDL2M=;
        b=fVzD4IBHnhzl29HjXbGL2UON0m1YkEYEHwu2CQ02YorLWFV+d7/8A0lRI7nlHqSHQT
         ySaVv7nSwtLKE6Wa5jOP31xgZgr5i/oiGFJ3/x1jSVie2NEA7kgTzr/7ePXjI5LuB25J
         MwHN2i9mZYBLMtEQqErzJVvW68nsIoUGmPlI4YTKJ9KAZCViHRwX2eDmS4JV1dlVFFUT
         f7IPlr4mf0CVubumPvqB/KuGEqwsJCWyNoqelHJ0x7FeycTn7joe00y/BKNZkVWQFpFD
         87kJkXBRvi4aqYKtn70CUyPMBhxiRuS4zBZvAhnyPFXhemNJkIahB4L1chQZXWBxLr5Y
         suOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=B4jibqDc1qVy/j2PdbJbaqTCeLaTTJvVeLinEnfDL2M=;
        b=keU8bALzKAMMLWTlzZD+llYftZnlwjoleXKbmz+7TE3dY2+lvGRgPCQY48IH7Qepnm
         Ym7/6F2Ob/WXVuTSTzWVRGo2IHnM9U1d/YCdpyXcuehK+QHh7620svSs4+O9CTLV7pIq
         emoarwkkPHnmrBnpMtBKkHYQLVAHSeGPKygQsSVNvOL/kPoE/hZjIq7YYACnPuq5sTls
         229sJLFh6v80QrixwFr2B9K69AWSOMyNpawTINEpdOF3rXFnZ0X5FF/wlYrQyJloOxWA
         Ots0ZE9xH8mEzrP6x3rX9BQMQSOYpKcct0qhV8CI2HjhHXlOAechhnFH3ZGSqCI9vijp
         CU6A==
X-Gm-Message-State: APjAAAULXhzRUOYfwtB9OQsRxMfvH7+EozLFDp7A0Sv79WPK7o+90Vk/
        sPA9qPcOjh0kJbfRN9KXStCDZQ==
X-Google-Smtp-Source: APXvYqzEF04T+GcngcmVdZfbQJ57lAu6S299DFDYV4t5FAnc+ntYnEImzN3McMQxiX8g+sknfwdAFQ==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr1915933wmq.142.1576050627087;
        Tue, 10 Dec 2019 23:50:27 -0800 (PST)
Received: from dell ([2.27.35.147])
        by smtp.gmail.com with ESMTPSA id i5sm1271653wml.31.2019.12.10.23.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 23:50:26 -0800 (PST)
Date:   Wed, 11 Dec 2019 07:50:21 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 3/6] mfd: rn5t618: add irq support
Message-ID: <20191211075021.GW3468@dell>
References: <20191129212045.18325-1-andreas@kemnade.info>
 <20191129212045.18325-4-andreas@kemnade.info>
 <20191210093225.GT3468@dell>
 <20191210175900.64df7de8@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191210175900.64df7de8@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 10 Dec 2019, Andreas Kemnade wrote:

> On Tue, 10 Dec 2019 09:32:25 +0000
> Lee Jones <lee.jones@linaro.org> wrote:
> 
> > On Fri, 29 Nov 2019, Andreas Kemnade wrote:
> > 
> > > This adds support for irq handling in the rc5t619 which is required  
> > 
> > Please capitalise abbreviations and device names (as they do in the
> > datasheet).
> > 
> for IRQ vs. irq: I see both things in commit messages. Is there any rule about
> that?

No, it's preference.  Mine is to follow the conventions set out by
standard English grammar.  Capital letters to start sentences, proper
nouns and abbreviations, etc.

> > > for properly implementing subdevices like rtc.  
> > 
> > "RTC"
> > 
> > > For now only definitions for the variant rc5t619 are included.
> > > 
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > > Changes in v3:
> > > alignment cleanup
> > > 
> > > Changes in v2:
> > > - no dead code, did some more testing and thinking for that
> > > - remove extra empty lines
> > > 
> > >  drivers/mfd/Kconfig         |  1 +
> > >  drivers/mfd/Makefile        |  2 +-
> > >  drivers/mfd/rn5t618-core.c  | 34 ++++++++++++++-
> > >  drivers/mfd/rn5t618-irq.c   | 85 +++++++++++++++++++++++++++++++++++++
> > >  include/linux/mfd/rn5t618.h | 16 +++++++
> > >  5 files changed, 136 insertions(+), 2 deletions(-)
> > >  create mode 100644 drivers/mfd/rn5t618-irq.c
> > > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index ae24d3ea68ea..522e068d0082 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -1057,6 +1057,7 @@ config MFD_RN5T618
> > >  	depends on OF
> > >  	select MFD_CORE
> > >  	select REGMAP_I2C
> > > +	select REGMAP_IRQ
> > >  	help
> > >  	  Say yes here to add support for the Ricoh RN5T567,
> > >  	  RN5T618, RC5T619 PMIC.
> > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > index 110ea700231b..2906d5db67d0 100644
> > > --- a/drivers/mfd/Makefile
> > > +++ b/drivers/mfd/Makefile
> > > @@ -217,7 +217,7 @@ obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
> > >  obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
> > >  obj-$(CONFIG_MFD_RK808)		+= rk808.o
> > >  
> > > -rn5t618-objs			:= rn5t618-core.o
> > > +rn5t618-objs			:= rn5t618-core.o rn5t618-irq.o
> > >  obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
> > >  obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
> > >  obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
> > > diff --git a/drivers/mfd/rn5t618-core.c b/drivers/mfd/rn5t618-core.c
> > > index da5cd9c92a59..1e2326217681 100644
> > > --- a/drivers/mfd/rn5t618-core.c
> > > +++ b/drivers/mfd/rn5t618-core.c
> > > @@ -8,6 +8,7 @@
> > >  
> > >  #include <linux/delay.h>
> > >  #include <linux/i2c.h>
> > > +#include <linux/interrupt.h>
> > >  #include <linux/mfd/core.h>
> > >  #include <linux/mfd/rn5t618.h>
> > >  #include <linux/module.h>
> > > @@ -105,7 +106,8 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
> > >  
> > >  	i2c_set_clientdata(i2c, priv);
> > >  	priv->variant = (long)of_id->data;
> > > -
> > > +	priv->chip_irq = i2c->irq;
> > > +	priv->dev = &i2c->dev;  
> > 
> > '\n'
> > 
> > >  	priv->regmap = devm_regmap_init_i2c(i2c, &rn5t618_regmap_config);
> > >  	if (IS_ERR(priv->regmap)) {
> > >  		ret = PTR_ERR(priv->regmap);
> > > @@ -137,6 +139,11 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
> > >  		return ret;
> > >  	}
> > >  
> > > +	if (priv->chip_irq > 0) {
> > > +		if (rn5t618_irq_init(priv))
> > > +			priv->chip_irq = 0;
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > @@ -154,15 +161,40 @@ static int rn5t618_i2c_remove(struct i2c_client *i2c)
> > >  	return 0;
> > >  }
> > >  
> > > +static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
> > > +{
> > > +	struct rn5t618 *priv = dev_get_drvdata(dev);
> > > +
> > > +	if (priv->chip_irq)
> > > +		disable_irq(priv->chip_irq);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
> > > +{
> > > +	struct rn5t618 *priv = dev_get_drvdata(dev);
> > > +
> > > +	if (priv->chip_irq)
> > > +		enable_irq(priv->chip_irq);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct i2c_device_id rn5t618_i2c_id[] = {
> > >  	{ }
> > >  };
> > >  MODULE_DEVICE_TABLE(i2c, rn5t618_i2c_id);  
> > 
> > Not this patch I know, but it's strange to see this empty.
> 
> Yes, should be cleaned up. For now the device tree stuff seems to kick in.

I think this can be removed completely.

Just make sure you use .probe2 and it should be automatic.

[...]

> > > +	switch (rn5t618->variant) {
> > > +	case RC5T619:
> > > +		irq_chip = &rc5t619_irq_chip;
> > > +		break;
> > > +
> > > +		/* TODO: check irq definitions for other variants */  
> > 
> > No need for this.  It's implied.
> > 
> > OOI, when support for more variants be added?
> > 
> I have done research about the RN5T618. It has just the RTC IRQ missing, I could just
> add the table for it to prepare the path for others. I cannot test it but
> since there are no users yet, it does not harm that it is not well-tested.

If there are no users and it can't be tested, it should be left out.
We don't want potentially broken, untested code with no users in the
kernel.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
