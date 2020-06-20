Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2042026E9
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Jun 2020 23:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729032AbgFTVfk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 20 Jun 2020 17:35:40 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45597 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729035AbgFTVfg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 20 Jun 2020 17:35:36 -0400
Received: by mail-lf1-f65.google.com with SMTP id d7so7506963lfi.12
        for <linux-rtc@vger.kernel.org>; Sat, 20 Jun 2020 14:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3+9QHb9ghdIy3+7pfNpTLxO6P2BWg5e6MpFuHAr7gQA=;
        b=yWmHf50gZlST9gXFNybUAWe6FVywTFE5PUaafxbJ/1epTV0n+Lv+CpSwKOg1RuQf4K
         BwifKjuxExz1QXAUp6i3sPeIKKMCw416sYVuOUHMGy/29//ZZq15vrTSJxbnc6bKNJ0G
         QTyaGW0UrCqFXq8mLHTGFcRsQVmZW6+Dc0JjPBzPXys4RgobptufQsi0EgpjQvWRi12Q
         ICJ84NCYkJ4XYldpNVIEac1hE4h/aaHAj9d7fQEPIbyjB7FEApSRhFREVIbIEThtDTEh
         Pv3+NilD68wnMWf8PaAVKjjJDpgjze5uj2cfQmrVmqkVbxAbNSDe+OAOnxGyWU5MAsv4
         OZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+9QHb9ghdIy3+7pfNpTLxO6P2BWg5e6MpFuHAr7gQA=;
        b=DNOt3nEt3y7Em40dG+8R7AZRyiESvpy0GENLVfEsKuPvg3axdLuySK8LADpxwxeAfu
         CXKg+rfS2Z02yTA9Ubr5CTPPyvWuEATsdXIbtEgEWkgOGK29/o1y9TRlhhey4UOsbBvQ
         OZoBj6wYEQUWTSrmcmtp5KhZ4emy+PeY7DaxN/hmsdAyGWSdH53+I+Y5mXtSklcSh8ma
         3SP+RIwOMg1ibjpQI0fsOs6psSwIj3tGmrgIGLbtKP2ZzvzINlqFHCMua6lBrLvEEZ1j
         CAm2yuwz9oGNLfGSfgzheQHg/gy5zu5IU+pTsz8vwyRnxs/9Mw+XybPLIfI0QdrRC4FP
         3EUg==
X-Gm-Message-State: AOAM533QksdnETiHzIXPwn89ER/7uHiaJCM4XsoAUkl5BTR1vlUku7oN
        hXTE9xEdH92tD2giw5NP9TMP6kAhZCNgBRVC6u2pBZ54+GI=
X-Google-Smtp-Source: ABdhPJymDZLDq9jqFxfQFsgfJoOmYGGWijE0qWUIwgm6/kOFKN6HrfPAS9IzTxrDiH+cm72wLGp2koofZY5WkcS99zg=
X-Received: by 2002:a19:7407:: with SMTP id v7mr5202141lfe.4.1592688874285;
 Sat, 20 Jun 2020 14:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200618073331.GA9403@localhost.localdomain>
In-Reply-To: <20200618073331.GA9403@localhost.localdomain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:34:23 +0200
Message-ID: <CACRpkdZm2978CG0z=9eZMWk3RpOYzjtgFZ8REj1hZDBE7gwHZA@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add entry for ROHM power management ICs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-power@fi.rohmeurope.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jun 18, 2020 at 9:33 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Add entry for maintaining power management IC drivers for ROHM
> BD71837, BD71847, BD71850, BD71828, BD71878, BD70528 and BD99954.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
