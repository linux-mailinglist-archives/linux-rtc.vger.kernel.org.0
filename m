Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F32D01035A8
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Nov 2019 08:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbfKTHy5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 20 Nov 2019 02:54:57 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:45501 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfKTHy5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 20 Nov 2019 02:54:57 -0500
Received: by mail-il1-f196.google.com with SMTP id o18so22527168ils.12;
        Tue, 19 Nov 2019 23:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/rhynhwRr/LK0H9bk9F2uXXSfgIJYeknSevXiyt7NX4=;
        b=lcCbU7pG3TLdVdSlQQ++Nl7V5GM2JYvIcSZboGQVe1zrSqWIeHfV+W7nLiAYHChwwp
         NEmu2dHYf9bOGRoyJkWGsCiI1cnT1AZIB2doIunNFZLMqYQNO/yqoKZnC2raK6f5FZq6
         hVFRgOodcMPv721kXa9yS963Hw2isEkDlhbJimwAUMieqHliTXr4zM5ghFJQ6nQ7Whks
         zcMKrHGeBk38fUeIIo1rbGkWAUeCZImWyjB/wf13HN2bHwAARhJ+ye/d9HRMg4IaU8ML
         Q8tkah77t5+kAYC7EggM2i4+P+2qJcStij/av5skHkV+ZFFyub8LJ9zJqpVouLpdsChS
         Cgww==
X-Gm-Message-State: APjAAAU6KryR4mzAIiPfhYsPB4wdfAHnqqAPh7M0SJxk2Tk80dW0lW2a
        /iXSY+BVISCEuRhG1vmpufgR0TZ/XfKiVxFqYHBIfsMmljE=
X-Google-Smtp-Source: APXvYqwxsKW0FDOOll/pMNBQu+69qDVn4EENJuA0zx7Ay45mCQurqZ+0Hc/2xqMxsoCB485lXNb/GZh02fOLHbLlqj4=
X-Received: by 2002:a92:6609:: with SMTP id a9mr2167050ilc.131.1574236495648;
 Tue, 19 Nov 2019 23:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20191031213835.11390-1-andreas@kemnade.info> <20191031213835.11390-3-andreas@kemnade.info>
In-Reply-To: <20191031213835.11390-3-andreas@kemnade.info>
From:   Pierre-Hugues Husson <phh@phh.me>
Date:   Wed, 20 Nov 2019 08:54:44 +0100
Message-ID: <CAJ-oXjTQMgF+zzTkWz21yG4ZdAszSDKkiAqocBcUjyMNEd0ozQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] mfd: rn5t618: add irq support
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Lee Jones <lee.jones@linaro.org>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Le jeu. 31 oct. 2019 à 22:38, Andreas Kemnade <andreas@kemnade.info> a écrit :
>
> This adds support for irq handling in the rc5t619 which is required
> for properly implementing subdevices like rtc.
> For now only definitions for the variant rc5t619 are included.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v2:
> - no dead code, did some more testing and thinking for that
> - remove extra empty lines
>  drivers/mfd/Kconfig         |  1 +
>  drivers/mfd/Makefile        |  2 +-
>  drivers/mfd/rn5t618-core.c  | 35 ++++++++++++++-
>  drivers/mfd/rn5t618-irq.c   | 85 +++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/rn5t618.h | 16 +++++++
>  5 files changed, 137 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mfd/rn5t618-irq.c
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ae24d3ea68ea..522e068d0082 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1057,6 +1057,7 @@ config MFD_RN5T618
>         depends on OF
>         select MFD_CORE
>         select REGMAP_I2C
> +       select REGMAP_IRQ
>         help
>           Say yes here to add support for the Ricoh RN5T567,
>           RN5T618, RC5T619 PMIC.
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 110ea700231b..2906d5db67d0 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -217,7 +217,7 @@ obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
>  obj-$(CONFIG_MFD_RC5T583)      += rc5t583.o rc5t583-irq.o
>  obj-$(CONFIG_MFD_RK808)                += rk808.o
>
> -rn5t618-objs                   := rn5t618-core.o
> +rn5t618-objs                   := rn5t618-core.o rn5t618-irq.o
>  obj-$(CONFIG_MFD_RN5T618)      += rn5t618.o
>  obj-$(CONFIG_MFD_SEC_CORE)     += sec-core.o sec-irq.o
>  obj-$(CONFIG_MFD_SYSCON)       += syscon.o
> diff --git a/drivers/mfd/rn5t618-core.c b/drivers/mfd/rn5t618-core.c
> index da5cd9c92a59..d4ed2865ed8b 100644
> --- a/drivers/mfd/rn5t618-core.c
> +++ b/drivers/mfd/rn5t618-core.c
> @@ -8,6 +8,7 @@
>
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/interrupt.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/rn5t618.h>
>  #include <linux/module.h>
> @@ -105,7 +106,8 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
>
>         i2c_set_clientdata(i2c, priv);
>         priv->variant = (long)of_id->data;
> -
> +       priv->chip_irq = i2c->irq;
> +       priv->dev = &i2c->dev;
>         priv->regmap = devm_regmap_init_i2c(i2c, &rn5t618_regmap_config);
>         if (IS_ERR(priv->regmap)) {
>                 ret = PTR_ERR(priv->regmap);
> @@ -137,6 +139,11 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
>                 return ret;
>         }
>
> +       if (priv->chip_irq > 0) {
> +               if (rn5t618_irq_init(priv))
> +                       priv->chip_irq = 0;
> +       }
> +
>         return 0;
>  }
>
> @@ -154,15 +161,41 @@ static int rn5t618_i2c_remove(struct i2c_client *i2c)
>         return 0;
>  }
>
> +static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
> +{
> +       struct rn5t618 *priv = dev_get_drvdata(dev);
> +
> +       if (priv->chip_irq)
> +               disable_irq(priv->chip_irq);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
> +{
> +       struct rn5t618 *priv = dev_get_drvdata(dev);
> +
> +       if (priv->chip_irq)
> +               enable_irq(priv->chip_irq);
> +
> +       return 0;
> +}

For what it's worth, the boards I have (Archos 101 Oxygen and Pipo P9)
with rc5t619 use GPIO for power button.
So IRQ would need to be enabled in suspend for this to work.
Also, since you actually added alarm support, perhaps you want to
wake-up from suspend using alarm as well?
