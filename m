Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A0E47A39A
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Dec 2021 03:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbhLTCUH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 19 Dec 2021 21:20:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbhLTCUG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 19 Dec 2021 21:20:06 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808BFC061574
        for <linux-rtc@vger.kernel.org>; Sun, 19 Dec 2021 18:20:06 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id v30-20020a4a315e000000b002c52d555875so2633940oog.12
        for <linux-rtc@vger.kernel.org>; Sun, 19 Dec 2021 18:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9OlAzuehaJkEmXyc0qc+RfNaOK0y6SRe2OzA7I9NCpQ=;
        b=xFUWj5pZPYKunbfcPHm0EAPz3/uwkp4JMV+DUiATXgdEBau8LWzGzgSMAqaAz54cok
         KF0VdCnxUv9P+8pkx+UHo0LWu+DFBAI1QaULxpOsOJqSKieiivk3wpDGDZz8sNF0Tybw
         18SXJ4sJ+ruASixNeoCcPy103ENz2c6IucfUPyLQtE2v9VoPd8UZ31sjA9qYG0M2UFAx
         qWUKf9rc2CrFXAKJZ4cibqs6cfogDTQyqMnG46tRL+WCkRQcI8n6vBqMVej0HvWT4YJp
         6ZOrX5MVHE2dbmn34R06GenJ29aqBh84pOSWNdLiT6vGPc59Gtj8BK6BZbo6cGjAh67B
         544w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9OlAzuehaJkEmXyc0qc+RfNaOK0y6SRe2OzA7I9NCpQ=;
        b=31CrcG4WBvoMtW1n0+nk5qd5WEuF8BUYpN6qZnMj9iTBqxAEBGUAXSKu79AK1n0gzK
         S22Tp17opexLk/nf1dgJYPkjhYPvwttYetxE4BN3qwShxAV4osRZZ8Eu9GRNgQ7vVNAC
         DL8W59nUmNHrtJAzyWMfLij463klwaYkpix5sk3ptY0p7Do0Q85kOmck3pB3ioYVh6x/
         iEuhLNzLQRkxBres2ZMeLjzfzWCv9FwNo5xFwCNcreDE9lJWYiDHhHSD5SvS1HsgQ5j4
         iPEzXc8TIrKk3eO+qqcjXNfnZwbL+Asv/x+9s0rq4oxU0z5SnzQ1n8uU9HzrJu6vBaEF
         wpkQ==
X-Gm-Message-State: AOAM533Pr/+vtT5FnImql7AqI8v2yCY8/G17mfhNIl/BhxZeOoHfZVs2
        ecB2BIdtVd5X20ZXK6NXZMBeZUkMA6RDYE5Lbu8vnGex82Y=
X-Google-Smtp-Source: ABdhPJz46gDzq9fEZIApuV9z9olhe0Na55+ylzmGSsNUqesQhV0g0vvgjob+bHStpoUZ/WdOi1gpvzKAm7MhvrS6gWQ=
X-Received: by 2002:a4a:8515:: with SMTP id k21mr8803903ooh.71.1639966804416;
 Sun, 19 Dec 2021 18:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20211220011524.17206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211220011524.17206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Dec 2021 03:19:52 +0100
Message-ID: <CACRpkdbdr+MNp1iK7-snmr7iQ9cTey4iCjnoGGkQrqVwKdTy6w@mail.gmail.com>
Subject: Re: [PATCH] rtc: ftrtc010: Use platform_get_irq() to get the interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Dec 20, 2021 at 2:15 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
