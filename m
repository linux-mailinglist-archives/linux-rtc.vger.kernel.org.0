Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDB1CDCE7
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 10:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbfJGIL4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 04:11:56 -0400
Received: from mail-ed1-f52.google.com ([209.85.208.52]:42441 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfJGILz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 04:11:55 -0400
Received: by mail-ed1-f52.google.com with SMTP id y91so11495166ede.9;
        Mon, 07 Oct 2019 01:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Snb3N5jBGTny2lV0Bq/REXN2i4LAg5y7Btj+sL3kJn0=;
        b=HEvhTPA4qHs6T6/sy02D9eFAWTzmDfB1jFt6FEPxhKdwdpkhD5vUgLzsZIbLRgCc4I
         pumDtrj/jmWtRdW6odENJeG1Cx3wmA+i9u4iQJZ8XJ9e7OvGTao9Zt/9uT2x8v9KhTBX
         GoonaqKZ0wwJNP/7FgGclw99BGLVTml8BghWh/4LfbK1OdbOkLaDONpARLP2XAnP+1J2
         KegtuO92RZ4QpZYFaJpP2JzkrDIpWqxfu11BhGiRNwhXGUEOxO05+efOM51oFMq9hbvN
         DD0I7hbl411Yxk19E30UcCNdathUK4ZqpQKo0v6eZaac1q0rspVu5iiJaCJaCwZKIhZZ
         j0ew==
X-Gm-Message-State: APjAAAWsl6iy3KT4kPJsASwWYorNnE8eEIVhVbR93JZn/1Vsb4JmQ3pl
        b7Ctogek6KuAUEvE3KPvcspHqnHIOfM=
X-Google-Smtp-Source: APXvYqwKEy92PmoUYu5LIOejZ5tSC1KCR6qRXx8Fh4kR45McOjqJCicxqtG76cszVJU4WmE9Clca0A==
X-Received: by 2002:aa7:c614:: with SMTP id h20mr27114269edq.209.1570435911803;
        Mon, 07 Oct 2019 01:11:51 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id g9sm1745327ejj.51.2019.10.07.01.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 01:11:50 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id q9so14042546wrm.8;
        Mon, 07 Oct 2019 01:11:49 -0700 (PDT)
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr16979718wrr.23.1570435909394;
 Mon, 07 Oct 2019 01:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com> <20191006102953.57536-30-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-30-yuehaibing@huawei.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 7 Oct 2019 16:11:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64hUaddO-29=ZP53HDrrOUKqfa52Qk9Q2dGf_RkfwZfyA@mail.gmail.com>
Message-ID: <CAGb2v64hUaddO-29=ZP53HDrrOUKqfa52Qk9Q2dGf_RkfwZfyA@mail.gmail.com>
Subject: Re: [PATCH -next 29/34] rtc: sunxi: use devm_platform_ioremap_resource()
 to simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        joel@jms.id.au, andrew@aj.id.au,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        ludovic.desroches@microchip.com,
        Brian Norris <computersforpeace@gmail.com>,
        gregory.0xf0@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        "open list:BROADCOM BCM281XX..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Baruch Siach <baruch@tkos.co.il>, paul@crapouillou.net,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, eddie.huang@mediatek.com,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        jonathanh@nvidia.com, Tony Prisk <linux@prisktech.co.nz>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-rtc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Oct 6, 2019 at 6:39 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
