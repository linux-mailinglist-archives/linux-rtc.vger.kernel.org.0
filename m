Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDE1D08B6
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2019 09:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbfJIHqn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Oct 2019 03:46:43 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33970 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729771AbfJIHql (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Oct 2019 03:46:41 -0400
Received: by mail-lj1-f195.google.com with SMTP id j19so1480927lja.1
        for <linux-rtc@vger.kernel.org>; Wed, 09 Oct 2019 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZEfc+r3FkjJNXGg5OrQndZ7EVhjrXvy0Arp8Ba6y3Y=;
        b=wjvQivs+C+mNfu/kBT+oqZ7KD4q6+IZ5Kth6hhfGFbltlKdqAJ38C7ajvyZ31te4gJ
         C5EqhO//ZRTNxmVHsnWpL4FPvGmq6RGPaLctgOfRFcn64vZmRPcZzkMMWQJ5TtpYGxOS
         ++ZFPLLjrWzBCECqMtnDgmicGmA0oWmKIWQeYM/ZOxDhwuAVKbdEN/zSfWvAA3hLQZZq
         ubaT/P3ZZ59MYBEbi3oE/Ge+OFG+iQYKsWIiR5Ef3yKK7kivB5XTNZls9k74vNap0dO9
         ytr/crl5hSQEYBvLZjmMXVpBhkzUNMwtOdUVNlFdxRC9uu49L9C1IMRlaxaQ+WnE44XU
         dFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZEfc+r3FkjJNXGg5OrQndZ7EVhjrXvy0Arp8Ba6y3Y=;
        b=alMqiW9bbMmB82V3aKr55QIGmq8DOIFjfTkdvStCyn0WhxEU7HKOOHoIAE+U9KUWy8
         W2YN5TK7+R9hQe/nDKPd2ZYSpsM+2qhDeQ8vOZMHp61DNOF3IdMVB1zM4fR36m1splbw
         BCAI7n8FYX275d3G4uhvbuwt0gwsCM+oZcVvXko4u771rbgBi0c8sRcV5mcSAXomCxqZ
         QhTQsjnpjKrb6/laylhy0zimmWZrLlm3TQQw4g4aBbjeu33PYIyrgAJSInVMYW5US2rR
         cEQk9cDNo32Pnh3BbDelwgdJAQCPVNWkH5HAJ+YUQc9flu5GEuGc0Z5L2GGsPn7ZvEEN
         CQ0A==
X-Gm-Message-State: APjAAAUz0arHHQGHaoWutD4FhVmwUHz1WTltCTAX9gMS9mjtg+y765FM
        ioi60UIadXAwxKzvmbRJigwvC0jr5DSWC326vNKWmw==
X-Google-Smtp-Source: APXvYqzKb6yyez5/a7eDQjEjte0+mGMXwCtZbVyeffNWrWYP4x2euviqJJy4ezdD4TVfujVbQ0UR4GcHrwjyGqp8gXQ=
X-Received: by 2002:a2e:80d1:: with SMTP id r17mr1435527ljg.118.1570607198839;
 Wed, 09 Oct 2019 00:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191006102953.57536-1-yuehaibing@huawei.com> <20191006102953.57536-7-yuehaibing@huawei.com>
In-Reply-To: <20191006102953.57536-7-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Oct 2019 09:46:27 +0200
Message-ID: <CACRpkdY5x3wG4h6Wm_L5OXWXB7SPqHimUFOQa2jOeqDETWciYg@mail.gmail.com>
Subject: Re: [PATCH -next 06/34] rtc: coh901331: use devm_platform_ioremap_resource()
 to simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Brian Norris <computersforpeace@gmail.com>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        huang eddie <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Patrice CHOTARD <patrice.chotard@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Tony Prisk <linux@prisktech.co.nz>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-rtc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Oct 6, 2019 at 12:32 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
