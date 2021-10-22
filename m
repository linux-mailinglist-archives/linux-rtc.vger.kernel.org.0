Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B103A437528
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Oct 2021 11:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232621AbhJVJ5L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Oct 2021 05:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbhJVJ5L (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Oct 2021 05:57:11 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971FBC061348
        for <linux-rtc@vger.kernel.org>; Fri, 22 Oct 2021 02:54:53 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id u18so3881996wrg.5
        for <linux-rtc@vger.kernel.org>; Fri, 22 Oct 2021 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1HcW2tYqxv3UvKYp0v4QuRiF9xuLREBSM7DRf5wdmOA=;
        b=o8fMCbpqQLH+Umtc34rWG9ArM66htjDJWGBqiuiPF/0Fs4B2K0O4CuLhoKmPCj2XNM
         IN39I6vxDdtFwzB1o7IMsZT2dkLDzNtfrqAFT4lQ+N7fpc+qtfJUVx9ECYVeqZAaCeH1
         SBGUa0Pi2vZwYh9QuTmNAK0vPtXdAYVl0+5j5lzl+yp5rfGNlcD1yGuNAyF7R+Jmgsd/
         1XAwY6HNuVXmcm74S5E9OdqJ3/0TqO4Rum5vY4hQoJ7ULki6ewgh4H6kjA7Dgjs3S4v3
         XfncdPhAPLiyVwgP9YaKJh6aq7Ux8JJU5c7+Q8GLqEge5QQ3LIjcWCm8Tj7Jx/8pv3F9
         CM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1HcW2tYqxv3UvKYp0v4QuRiF9xuLREBSM7DRf5wdmOA=;
        b=AMtZB7OhGNCbi57UvdCuypQmqzX1Wpn8mbYE9P5WYJ8AuHucLzbGtpkw4nGoQeDbpJ
         Ywxnd5bRfpFcH5h8fSPw/+bLFUlPSqZIlTwcvfSTkXZ7t0FK5bq/44grFyj0z87P29YI
         2+v3XES0nsfyUG/9QfmWC/pNXV7+GPN2LfSrsOYN6ch+Im0Vsy+xxWHZUBXSyJhfM6lA
         aJwoIz83WbQrEiINZtwWenLvgLLVuh99RAfMaGObn5FL6HF0g9V0oI0Pb0lLgnDpxIKG
         b1WeeiLLJU8jGH5ocp6WC/Zw97wEBR0oO8cOIxhhg9lrifxlgfR0071tnhg+9u52dgYx
         obHw==
X-Gm-Message-State: AOAM533PgaU4EM9TV980RkNGH6WWceARJ/6Hle+OfYxZA/q5XvUK3mYp
        Xh23Y/F+gashJsHgYrcYAZnYRw==
X-Google-Smtp-Source: ABdhPJzq118rO//Y5erssQhc6Jw9nDTasGx8GxQxV4POx8ohls7vA2QbV5Sa9ARtRxulpG8neG7eJQ==
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr13076654wrx.228.1634896492186;
        Fri, 22 Oct 2021 02:54:52 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id i24sm7671110wml.26.2021.10.22.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 02:54:51 -0700 (PDT)
Date:   Fri, 22 Oct 2021 10:54:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 3/3] mfd: tps80031: Remove driver
Message-ID: <YXKKaaNeu4EIjmFq@google.com>
References: <20211021192258.21968-1-digetx@gmail.com>
 <20211021192258.21968-4-digetx@gmail.com>
 <YXJw2fX42REHylOy@google.com>
 <b8f6dffb-ec7b-c105-51f1-7b761e331a89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8f6dffb-ec7b-c105-51f1-7b761e331a89@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 22 Oct 2021, Dmitry Osipenko wrote:

> 22.10.2021 11:05, Lee Jones пишет:
> > On Thu, 21 Oct 2021, Dmitry Osipenko wrote:
> > 
> >> Driver was upstreamed in 2013 and never got a user, remove it.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/mfd/Kconfig          |  14 -
> >>  drivers/mfd/Makefile         |   1 -
> >>  drivers/mfd/tps80031.c       | 526 -----------------------------
> >>  include/linux/mfd/tps80031.h | 637 -----------------------------------
> >>  4 files changed, 1178 deletions(-)
> >>  delete mode 100644 drivers/mfd/tps80031.c
> >>  delete mode 100644 include/linux/mfd/tps80031.h
> > 
> >> -static const struct i2c_device_id tps80031_id_table[] = {
> >> -	{ "tps80031", TPS80031 },
> >> -	{ "tps80032", TPS80032 },
> >> -	{ }
> >> -};
> > 
> > This is an I2C driver, right?
> > 
> > I was under the impression that Linux could do auto-probing on I2C
> > devices?  Such that they do not require platform code or DT in order
> > to bind?
> > 
> 
> It's I2C driver. I'm not sure about auto-probing because something
> should provide information about device to Linux. It's possible to
> detect/scan whether there is device sitting on I2C address, but there is
> no auto-discovery mechanism, AFAIK.
> 
> TPS80031 device will fail to bind to this driver because it explicitly
> requires platform data which should be NULL if device is probed solely
> by I2C ID.

This is a fair point.

I'll take the patch, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
