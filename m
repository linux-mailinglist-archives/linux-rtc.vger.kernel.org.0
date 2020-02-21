Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE9E1681C0
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Feb 2020 16:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgBUPeN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Feb 2020 10:34:13 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42112 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgBUPeN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Feb 2020 10:34:13 -0500
Received: by mail-lf1-f66.google.com with SMTP id 83so1786272lfh.9
        for <linux-rtc@vger.kernel.org>; Fri, 21 Feb 2020 07:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hUVfMiXxCwbSjtH9BPcnP06NcLeQvKTFfCk+TkAB1ZQ=;
        b=v90zLbE5oSFF85/nmKa9caaE43xtNO2sg0peoa6K/LaorENVEkOf35lATcCgMyTbPW
         O69VCm2Xttmp1nfwqSxxxy9Z1qj2m0SM9sgeOCvFYl6ECFGp8Z49HGtUdDD7nDXZV52M
         7mVPCdX9y3erbnBlOsk9iMOXmAKwPffElO75JsVMyUHRTzF0K94XzifctntrM7BCB0Ih
         fQWoyZ9Vw8c/u6cRD6ECP8tO3GWZezpVnii5ZYj2mp/KTrGI7hxBaziucNlZ/+MH44i7
         oNQMfu6cTpDPUepThAKF9qA3+I22/r3p1UKcvLrsvEjQ5WzRxqInd4YIw+8dM1T1IxQa
         crrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hUVfMiXxCwbSjtH9BPcnP06NcLeQvKTFfCk+TkAB1ZQ=;
        b=Q0kpTsDsbzh9KKzH6mSiQ5O9oJ48Pxbd0m9uUyyPge0mO7Fuy0istYIDQ7uFwT9zFh
         oGpvg+xUsyI8m0hWkZaJc1TwMXCkbzcTn5maY+Uy8RbtYTzk5wlQo6Zlj4kwYyNvhQqO
         Hr+05PM8aYVnVwUUqD5mSRyyKOu9A7ffAGMUrgFqaC7Lv7OMWgmrOqO7XHJTc69bMQ9l
         7rmnheNEXsbprRiRdCv4oLY8dvvcMYsJhYEBc1beY8YLxogKe1JfzVqhZxZN6balWSrL
         BdSI7f0UpkQneUFKU1sYNcxhioB+yt8BRUT41efwgT92+TTJ0kqWVfZ3XY8rbbeCjB8n
         LX9g==
X-Gm-Message-State: APjAAAVvvjtSm5vdnMbxSIc/TzgThDxcPYsnvGce54/5sxOC0f1c6pc2
        hO2OCl+WglNfkSFHEyRtY5m6LO3PfQxxIwbf+IRdfg==
X-Google-Smtp-Source: APXvYqxFOhbB45zhwJACKnRWGrffnbDn/50wsrqM8zfRboGUcRtR/fIOZXVdUDsZuFjz9JDddI6CuEa9zN+Z1wPCOKA=
X-Received: by 2002:ac2:5499:: with SMTP id t25mr19779301lfk.194.1582299251375;
 Fri, 21 Feb 2020 07:34:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582216144.git.leonard.crestez@nxp.com> <bd7ad5fd755739a6d8d5f4f65e03b3ca4f457bd2.1582216144.git.leonard.crestez@nxp.com>
In-Reply-To: <bd7ad5fd755739a6d8d5f4f65e03b3ca4f457bd2.1582216144.git.leonard.crestez@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 16:34:00 +0100
Message-ID: <CACRpkdbB0xUF14aG5kVtmQ-AuwZVNKYq8_mW41jdQ_OfcNq8KQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] pinctrl: imx: scu: Align imx sc msg structs to 4
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Feb 20, 2020 at 5:29 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

> The imx SC api strongly assumes that messages are composed out of
> 4-bytes words but some of our message structs have odd sizeofs.
>
> This produces many oopses with CONFIG_KASAN=y.
>
> Fix by marking with __aligned(4).
>
> Fixes: b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support")
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Patch applied for fixes. KASan needs to work.
Thanks for fixing this!

Yours,
Linus Walleij
