Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4177816B1
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 12:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbfHEKQd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 06:16:33 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35888 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbfHEKQd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 06:16:33 -0400
Received: by mail-ed1-f65.google.com with SMTP id k21so78154441edq.3;
        Mon, 05 Aug 2019 03:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3byZm4WW5S66f9sH9AAiCJ18IamGlDO717O/42CmSCg=;
        b=gt/k6a71k8lNHd/S6ml9DU9yj5zJQ4XfIW24iRo4Sz0Qugt0d8rIms/CrfJQc9ARf9
         VjqTLD3qoTAx+RIQEpazxpQ0trQMieBBb9GZkN2n+Z+kBbbLvY09DqnRYxXzyYXvmW0b
         51oHu0PV2r1LVEMKJ1G7fZZ9AbelehL3INlMUIny4I82QhLTbECTY/uXts1TOkv0G3kx
         Omxqcpy5/f8zfR3Lq2Pns0CLoZISxKIJQbNHI/HNJ0ZlKDehLL7X71fdX2aERclow+EK
         89S+gxy9TzUYRyyy0dHuqkB3w+iY1QjaF+erF0AWnmNgKfAEFKhDL24jN3z8ZF+vwxlp
         tPdA==
X-Gm-Message-State: APjAAAXHA3vTlmCunbSFhI3iva+CpVa4ppnmLxavLXhowp8QWYqLIgBS
        7sQSDu4IVS0osiDj9989RPCX3swelbA=
X-Google-Smtp-Source: APXvYqxAN0sxCtDc4KhWPVHTXzChQfZCMBd7qpDFXGJMW0lrk+7+ss52WdJZUbQ1knMd9Zk3P8ACpw==
X-Received: by 2002:aa7:c515:: with SMTP id o21mr132330413edq.2.1565000190536;
        Mon, 05 Aug 2019 03:16:30 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id h10sm18916541edn.86.2019.08.05.03.16.29
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 03:16:30 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id c2so80591053wrm.8;
        Mon, 05 Aug 2019 03:16:29 -0700 (PDT)
X-Received: by 2002:adf:c613:: with SMTP id n19mr104922068wrg.109.1565000189770;
 Mon, 05 Aug 2019 03:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190412120730.473-1-megous@megous.com> <20190412120730.473-3-megous@megous.com>
In-Reply-To: <20190412120730.473-3-megous@megous.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 5 Aug 2019 18:16:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v675j-aCLMgPJOzr9yx1XxsUvHRr_K7VnL=p8mSdwpu2jw@mail.gmail.com>
Message-ID: <CAGb2v675j-aCLMgPJOzr9yx1XxsUvHRr_K7VnL=p8mSdwpu2jw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 2/3] rtc: sun6i: Add support for H6 RTC
To:     =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
<linux-sunxi@googlegroups.com> wrote:
>
> From: Ondrej Jirman <megous@megous.com>
>
> RTC on H6 is mostly the same as on H5 and H3. It has slight differences
> mostly in features that are not yet supported by this driver.
>
> Some differences are already stated in the comments in existing code.
> One other difference is that H6 has extra bit in LOSC_CTRL_REG, called
> EXT_LOSC_EN to enable/disable external low speed crystal oscillator.
>
> It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whether
> external low speed oscillator is working correctly.
>
> This patch adds support for enabling LOSC when necessary:
>
> - during reparenting
> - when probing the clock
>
> H6 also has capacbility to automatically reparent RTC clock from
> external crystal oscillator, to internal RC oscillator, if external
> oscillator fails. This is enabled by default. Disable it during
> probe.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 11f56de52179..7375a530c565 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -41,9 +41,11 @@
>  /* Control register */
>  #define SUN6I_LOSC_CTRL                                0x0000
>  #define SUN6I_LOSC_CTRL_KEY                    (0x16aa << 16)
> +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS                BIT(15)

Manual says bit 14? Or is this different from LOSC_AUTO_SWT_EN?

The rest looks ok.

ChenYu
