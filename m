Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCB5CED18
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 22:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbfJGUBe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 16:01:34 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:47030 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728212AbfJGUBe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 16:01:34 -0400
Received: by mail-oi1-f195.google.com with SMTP id k25so12772853oiw.13;
        Mon, 07 Oct 2019 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lvKxDCEdVgPdg3NBubDuHJYxBHQHsF+19QqSBENKigs=;
        b=ldZWZLPYdSK/lW58g3GggUrvVCJd1bSherkZ3i1sSTYmEWn8xkwIcVHcmZ3icueHQp
         oy5jhaY7EWxyWVR9117SxscpYTuLMHxESfnKRG8OiuTaUqvhUU6ovZmkM9O2vxxFt+eU
         j1Ahl1lPiieioT2lbA364gHNXQWxIF0DgKTKQLSIoQ9sNQu3MyZJlIheMi1AbflSbGt4
         FMBBws1iMdul9gqqFEcvBoTYYrPIjtJ8f054Son5rjx4xSysmRjtnZZEtvqD1noCgWOm
         IoXuRgR8rfAJ12qdkaYZR+biJvf7tEDnz8LaI7EH80M+v2A1gn7VKk1h0BWgQr+cPfKB
         CGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lvKxDCEdVgPdg3NBubDuHJYxBHQHsF+19QqSBENKigs=;
        b=EROgvWsx1qJFxzftq5uySkQqiZ5QKx0028Jo9CX3gt2jnEn47Z4NwUk8cQPZBmqvpz
         hW/ztd3RXSXX3+FyKYNShq2Slp4EgyNdoauxtZfGTnKDhLfA0kVVy9WKfBDjTQxBcq1l
         GYB9pIZXjL/ZK4rGcTwcAsND/oG7X8rYWGS2OFkUgtfw7HUlsdxAWFu46uZzk20K+SGS
         H9T1c8au1+xPw7ngDKMqr3uuNXcSpcV3MyXH5fvEVJtlhLhMs41KMUFhy3/W+GfGW1AG
         /HnoJrn6PIaVPo9D0hb8CQsIFJsniSmObVvK4pHCUzIPcL1avMYx69GmPiytFiYG45Ot
         x0ng==
X-Gm-Message-State: APjAAAXFl3zFF6PcpfbUyUkw41DhEuBCaQg1i7J+U//7Dt6mDmc5t42L
        HCM4+A4kpThRCEkH2XjR1jKkBdeT2SW+QBGfoyE=
X-Google-Smtp-Source: APXvYqxw4MwTHhEk1nJATSbu3GLXbTfDZIxzJF0EPb2WPk2JVoRBmvrn3TlNb7LKr7TGaqwsqjCfogj/ATlyGhjt7wk=
X-Received: by 2002:aca:d90a:: with SMTP id q10mr851452oig.129.1570478492843;
 Mon, 07 Oct 2019 13:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com> <20191006102953.57536-17-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-17-yuehaibing@huawei.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 7 Oct 2019 22:01:21 +0200
Message-ID: <CAFBinCD+DSDoPiza2KKJAB_s6793ZeCZ6vjb5Zx9y0Cdz0mGjA@mail.gmail.com>
Subject: Re: [PATCH -next 16/34] rtc: meson: use devm_platform_ioremap_resource()
 to simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        joel@jms.id.au, andrew@aj.id.au, nicolas.ferre@microchip.com,
        ludovic.desroches@microchip.com, computersforpeace@gmail.com,
        gregory.0xf0@gmail.com, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org,
        baruch@tkos.co.il, paul@crapouillou.net, vz@mleia.com,
        slemieux.tyco@gmail.com, khilman@baylibre.com,
        eddie.huang@mediatek.com, sean.wang@mediatek.com,
        matthias.bgg@gmail.com, patrice.chotard@st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        mripard@kernel.org, wens@csie.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux@prisktech.co.nz,
        michal.simek@xilinx.com, linux-rtc@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Oct 6, 2019 at 12:38 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for taking care of this!


Martin
