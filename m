Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E45C6227D1
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Nov 2022 10:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiKIJ7X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Nov 2022 04:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiKIJ7W (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Nov 2022 04:59:22 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D17C33
        for <linux-rtc@vger.kernel.org>; Wed,  9 Nov 2022 01:59:21 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id q9so45392680ejd.0
        for <linux-rtc@vger.kernel.org>; Wed, 09 Nov 2022 01:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=haRlnsqPUakc31S2aOsR1O2bID6Xr0HK7aHvY/cYYYg=;
        b=B9L06IDFAzoOMMt4abyIsTX72I+IZxglt37hDV0KG10b4bhhlB05msK6qcpSwU30Gb
         AcfasAtmyLoD6YXDvOlKufYMPLjGNru+xFH1jPwhv0hbUVmrxqRTyByBxdTJXaNgk5Dj
         QBjzAXrz+aWfn45iiT3Bmfj/636tpxFw5mfAlyjIMd88txUA9x9Lxocu1Nh48R78RayK
         MonizQTUOyJWlwliTbzbmEe9/ipcLBwzDsMn2pW1NS+AKdDAZHFSM5rFbr0INigPktVO
         Sx1EqyoeBfwbgLordwHA0OQPJDTnbDUcepomI3yx+ZJ8Bbe/nTS0h/wEK4/pC+walTFi
         LADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haRlnsqPUakc31S2aOsR1O2bID6Xr0HK7aHvY/cYYYg=;
        b=tvrDUY3ajziZKggR0sbVC3GpviSBgDEvJojG9aEUtgPz6GxorYS/vGC1R3z72Walzx
         OQkFd+3X3z9lkdtXdL+b3IPPD8gLEXj0zBnSoaHBbHUJ9rvWgKKrptODAGzshqFbqchr
         pd62+aYGY8OMCm/JEV9kxkIKs4uzG82GWRlgblgWSvH47ahEdd0nczbjD8ywBqjYReFH
         Tr3p+Fq+4BMs6pwZLtmY2cgqENrDAsgqrucHDjPlem+0x8Wko+qW10DGNWcawZc0dBWT
         8dfVO+GX9FuTm4KvwBqw8+EhuTR0Nxl2j99sbYP8j3nZbg73eVmVl/1INyvBVOdNjG0b
         qQJg==
X-Gm-Message-State: ANoB5pnuI9EKpV7I1Z/gpE06P1/1pNegm1KCHvoXqxlwgsoNqj+661Fx
        vXfupOlLjJpO5wo9yuPx+R6VTyEWOqHOMzFLX/pwcQ==
X-Google-Smtp-Source: AA0mqf6p1SQdDOYOnHUtfP9G3pWu+cOV6hlUGUfHgalP+Odim2UVjh4u4+gsf+wkFnBnCFFF0/ZPbBb+f8Eao95ZJ1M=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr14612769ejs.190.1667987960036; Wed, 09
 Nov 2022 01:59:20 -0800 (PST)
MIME-Version: 1.0
References: <20221109065546.24912-1-mranostay@ti.com> <20221109065546.24912-5-mranostay@ti.com>
In-Reply-To: <20221109065546.24912-5-mranostay@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 10:59:08 +0100
Message-ID: <CACRpkdaTV6unVsfNj+M39jLn5FLTnhryjuzF4EB6Ytds9R1nEQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: tps6594x: add GPIO support for TPS6594x PMIC
To:     Matt Ranostay <mranostay@ti.com>
Cc:     brgl@bgdev.pl, lee@kernel.org, kristo@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
        vigneshr@ti.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Keerthy <j-keerthy@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Nov 9, 2022 at 7:56 AM Matt Ranostay <mranostay@ti.com> wrote:

> Add support for TPS6594X PMICs GPIO interface that has 11 that can be
> configured as input or outputs.
>
> Tested-by: Keerthy <j-keerthy@ti.com>
> Signed-off-by: Matt Ranostay <mranostay@ti.com>

(...)
> +config GPIO_TPS6594X
> +       tristate "TI TPS6594X GPIO driver"
> +       depends on MFD_TPS6594X
> +       help
> +         Select this option to enable GPIO driver for the TPS6954X
> +         PMIC chip family. There are 11 GPIOs that can be configured.

select GPIO_REGMAP

This driver is an archetypical example of a driver that can make great
use of GPIO_REGMAP helpers, so rewrite it to use them.
Look in drivers/gpio/gpio-sl28cpld.c for an example.

Yours,
Linus Walleij
