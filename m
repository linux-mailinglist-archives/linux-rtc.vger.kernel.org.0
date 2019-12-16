Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF211209BB
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Dec 2019 16:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbfLPPbJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Dec 2019 10:31:09 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46683 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbfLPPbJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Dec 2019 10:31:09 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so7738227wrl.13
        for <linux-rtc@vger.kernel.org>; Mon, 16 Dec 2019 07:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=F7qxJLY2B0q2S9xWqYQhOGVkpLg1b0U2h68SKIpYOSM=;
        b=ZQf1ByAmTqQWYrXd/L/q1azTVA3vCJAg4DgVgTEvElv+S0USzhiaovMwqkHiVWz5Zr
         kdgo2xjU2VKrukZA2Y3G9F0BaJn1cGMlJHEbLcD/rfdgsk5qcSjvrDsgDpMXwNMl0xcj
         IU5RiIoHNXVOhpsLIlFmT2Sd8Loyb1APb+nlzEk2uTINsYuL/wN+ktFD6wOFMwpzmfAN
         E97qqYqiPMia2UzBfFzaQl2jvKP0phVv34LdrbErwwjPr+5eIJ+n3CSC2vNG2MuT2ziB
         R9Ke340k9MtgEAJmAX6liOEadzi90oEM4LsBju+Xywo1SHhrdCDn9Nq5dOd4vBSBk1V0
         AhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=F7qxJLY2B0q2S9xWqYQhOGVkpLg1b0U2h68SKIpYOSM=;
        b=BeRoK4RdeKqS+ETGImrUNW1qBGqic2lfQjjVLCrqCqOkVhS/k+VNAIpQepiwYRIQzN
         9cSzUbVvFQq5WGXKPQhqNL+Th807jK/5nOwf+uroTbkXTsZQZy9cy7tJcyRtt09Bo2sT
         pbkEPFjirIMSBNapuOBh3LAVfDT06CS8FXwkmZ0/b58h1IYRxn0IXYuIaROzYa7Te4/x
         gWprvpX0UCNInow0nk6b9dI8mcLJ5PB9sSl5pmuFGfHgyZCe3sNvTDCapYDbplU6Iujq
         WH/K7FrtEQxaVclFukbzFjpTMyLb0yueN3D2QGugDYeL9FpeSvKaN2aa7Jrt9MGmuA6E
         QTfA==
X-Gm-Message-State: APjAAAVo/CsIqIxQ/0K9pj3IdSBuZN1ce5nXbhBo4a0tKujDMQcSXAF8
        3IjXtG5Ga+0FKbhqtMsjGnS2uw==
X-Google-Smtp-Source: APXvYqzXaCm+VcadKjSIjeuwTuxX1mlnsuNzVNjfB1+gqraaFYRglw7XZsHB6451b/EXWV+RRXhjaw==
X-Received: by 2002:adf:e887:: with SMTP id d7mr29983243wrm.162.1576510267203;
        Mon, 16 Dec 2019 07:31:07 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id u24sm14478768wml.10.2019.12.16.07.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 07:31:06 -0800 (PST)
Date:   Mon, 16 Dec 2019 15:31:06 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v4 4/5] mfd: rn5t618: add more subdevices
Message-ID: <20191216153106.GK2369@dell>
References: <20191211215409.32764-1-andreas@kemnade.info>
 <20191211215409.32764-5-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191211215409.32764-5-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 11 Dec 2019, Andreas Kemnade wrote:

> The RC5T619 has a RTC which is missing in the
> RN5T618. Add it as subdevice to prepare for their implementation
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v3:
> - alignment cleanup
>  drivers/mfd/rn5t618.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> index d78eb29b94a4..18d56a732b20 100644
> --- a/drivers/mfd/rn5t618.c
> +++ b/drivers/mfd/rn5t618.c
> @@ -22,6 +22,12 @@ static const struct mfd_cell rn5t618_cells[] = {
>  	{ .name = "rn5t618-wdt" },
>  };
>  
> +static const struct mfd_cell rc5t619_cells[] = {
> +	{ .name = "rn5t618-regulator" },
> +	{ .name = "rc5t619-rtc" },
> +	{ .name = "rn5t618-wdt" },
> +};
> +
>  static bool rn5t618_volatile_reg(struct device *dev, unsigned int reg)
>  {
>  	switch (reg) {
> @@ -173,8 +179,14 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
>  
> -	ret = devm_mfd_add_devices(&i2c->dev, -1, rn5t618_cells,
> -				   ARRAY_SIZE(rn5t618_cells), NULL, 0, NULL);
> +	if (priv->variant == RC5T619)
> +		ret = devm_mfd_add_devices(&i2c->dev, -1, rc5t619_cells,

Ref: The "-1", please use this as an opportunity to use the defines.

> +					   ARRAY_SIZE(rc5t619_cells),
> +					   NULL, 0, NULL);
> +	else

Are you sure it's not possible for 'variant' to be an unsupported
device?

> +		ret = devm_mfd_add_devices(&i2c->dev, -1, rn5t618_cells,
> +					   ARRAY_SIZE(rn5t618_cells),
> +					   NULL, 0, NULL);
>  	if (ret) {
>  		dev_err(&i2c->dev, "failed to add sub-devices: %d\n", ret);
>  		return ret;

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
