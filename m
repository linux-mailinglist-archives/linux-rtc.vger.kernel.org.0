Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34191FF2FA
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2020 15:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgFRN0h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 Jun 2020 09:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbgFRN0g (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 18 Jun 2020 09:26:36 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01AE0C06174E;
        Thu, 18 Jun 2020 06:26:36 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id jz3so2551085pjb.0;
        Thu, 18 Jun 2020 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+szEYaTJUjqC8loVVwSE856UEXD76jmesRo7buRlzFI=;
        b=pdNkg3J1XNvAD4zAR8T/4wJK8hM25e5co4VBSu8tRGcmUGf636jXpwHeRSZtKtAyj9
         /w19KdMo1kcbbx2x+I+490vk428OIlunWq357f6c+O2GpAEq1C5+5HiUvSeCrjLW8vaX
         qOl7NrmHk+s5akpM/Cix8tWPN5mkO74GA6CI/Mqs/OkliMljny0YxNS/MvR/0uMHBrpf
         qIE1O03Gq4hrRsWoKtZeNqCIpF9KonjLVXLeL6fNC2cXEZtU1UhmSHbXfptXY9w2aqpi
         9TNMIwUEjCAtS3lSUGOKqDZIMAMQxfai0CWfbWsL+knr52U+aGmv92qr4PIeb9KD3DDd
         jqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+szEYaTJUjqC8loVVwSE856UEXD76jmesRo7buRlzFI=;
        b=gctU/upa9SEagovsNTRkuuiBryNugsJObzaDRSPCUPFTM4cjSrOcdFFqbyT+SgNa8+
         dmQRgodCiTVuyyindzeQhlNSH+S2oS8iZc8e1lU9QRyFNnG2XMaisKnQIgtwS44SwwuY
         lkYdqdsSuO2pnRILyGGs2LsbOOndPT2GNShmY8h+dmMfkqwuAUjyndBaPJLtJ1LcfVX0
         87upo5bbxA+Zk6mBy6ajHv0R60E/3jvVIfvEiPOwBvYBHQ82gwIY0qP9w0uqzd/kd0tU
         bpkuGnK3/wj359gliXRcd67gSL1YZeJsPMIb6K4XrmwduqXhEaad0irR44/jL/KXLFIC
         J/cA==
X-Gm-Message-State: AOAM533BEdDTCRpZ3s0yJOyS2tU7R/frdt2kjWv5TTjI3soHiBdCu3BO
        yY+c4F3zHkShroiXPfsyAkYEJpR+
X-Google-Smtp-Source: ABdhPJxx0aOJE95AR6h2n8AR4eAeG+hd8HMeeUfuRhW7wf/wSrKkB9J4UccpYXK0oqW/7yReWoFJFQ==
X-Received: by 2002:a17:902:7c13:: with SMTP id x19mr3640505pll.74.1592486795129;
        Thu, 18 Jun 2020 06:26:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m15sm2650868pgv.45.2020.06.18.06.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 06:26:34 -0700 (PDT)
Subject: Re: [PATCH v2] MAINTAINERS: Add entry for ROHM power management ICs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     Sebastian Reichel <sre@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-power@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20200618073331.GA9403@localhost.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <dde84271-d093-e18b-962d-18b8d8eaecb8@roeck-us.net>
Date:   Thu, 18 Jun 2020 06:26:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200618073331.GA9403@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 6/18/20 12:33 AM, Matti Vaittinen wrote:
> Add entry for maintaining power management IC drivers for ROHM
> BD71837, BD71847, BD71850, BD71828, BD71878, BD70528 and BD99954.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> ---
> Morning Lee - could you take this in MFD? This is scattered all around
> different subsystems anyways... I guess crafting bunch of patches to
> each individual subsystems would just end up with lots of merge
> conflicts.
> 
> Changes from v1:
> - Dropped patch 2/2 (linear-ranges maintainer) which was already applied by Mark
> - Added shiny new ROHM linux-power list so that I am no longer the lonely
>   poor sod watching these at ROHM side :)
> - sort few files to alphabethical order as checkpatch now nagged about
>   that.
> 
> v1 was here:
> https://lore.kernel.org/lkml/e11366fd280736844ae63791b6193bb84d6205bf.1589866138.git.matti.vaittinen@fi.rohmeurope.com/
> 
> 
>  MAINTAINERS | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68f21d46614c..ce08617f63f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14704,6 +14704,13 @@ L:	linux-serial@vger.kernel.org
>  S:	Odd Fixes
>  F:	drivers/tty/serial/rp2.*
>  
> +ROHM BD99954 CHARGER IC
> +R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> +L:	linux-power@fi.rohmeurope.com
> +S:	Supported
> +F:	drivers/power/supply/bd99954-charger.c
> +F:	drivers/power/supply/bd99954-charger.h
> +
>  ROHM BH1750 AMBIENT LIGHT SENSOR DRIVER
>  M:	Tomasz Duszynski <tduszyns@gmail.com>
>  S:	Maintained
> @@ -14721,6 +14728,31 @@ F:	drivers/mfd/bd9571mwv.c
>  F:	drivers/regulator/bd9571mwv-regulator.c
>  F:	include/linux/mfd/bd9571mwv.h
>  
> +ROHM POWER MANAGEMENT IC DEVICE DRIVERS
> +R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> +L:	linux-power@fi.rohmeurope.com
> +S:	Supported
> +F:	Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
> +F:	Documentation/devicetree/bindings/regulator/rohm,bd70528-regulator.txt
> +F:	drivers/clk/clk-bd718x7.c
> +F:	drivers/gpio/gpio-bd70528.c
> +F:	drivers/gpio/gpio-bd71828.c
> +F:	drivers/mfd/rohm-bd70528.c
> +F:	drivers/mfd/rohm-bd71828.c
> +F:	drivers/mfd/rohm-bd718x7.c
> +F:	drivers/power/supply/bd70528-charger.c
> +F:	drivers/regulator/bd70528-regulator.c
> +F:	drivers/regulator/bd71828-regulator.c
> +F:	drivers/regulator/bd718x7-regulator.c
> +F:	drivers/regulator/rohm-regulator.c
> +F:	drivers/rtc/rtc-bd70528.c
> +F:	drivers/watchdog/bd70528_wdt.c

Acked-by: Guenter Roeck <linux@roeck-us.net>

> +F:	include/linux/mfd/rohm-bd70528.h
> +F:	include/linux/mfd/rohm-bd71828.h
> +F:	include/linux/mfd/rohm-bd718x7.h
> +F:	include/linux/mfd/rohm-generic.h
> +F:	include/linux/mfd/rohm-shared.h
> +
>  ROSE NETWORK LAYER
>  M:	Ralf Baechle <ralf@linux-mips.org>
>  L:	linux-hams@vger.kernel.org
> 
> base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
> 

