Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1148B8D49D
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 15:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbfHNN0N (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 09:26:13 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41707 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfHNN0N (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Aug 2019 09:26:13 -0400
Received: by mail-ed1-f67.google.com with SMTP id w5so7071244edl.8;
        Wed, 14 Aug 2019 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h4COCc6WWbcVY5jQ0JrT6vbxRGslEgbBhKARy0jzFVM=;
        b=jqmiCljhXXYgkEuydoLAem/SCNO4388/BM+goYph1dBJgladlbe5THcmI3QYcHyY0b
         6UvC6081HNOVMUBAJxCCrymDuSM4ey10kdVOjZ1pTkdvCRYZPnARkl7vufi9qpR51G01
         yoxxEab2MST26WRc+r2/IravgcYKaAn2WZX47E65JgKQU9fZhcsuWNZm/f0wDYFm5DYM
         GjVZuI7IyfclEnt8lm97RYR86Z5uNAAO1B7Dt8pFovjZbRgctEA2ef3rur0YFvDABeL1
         279UiasHB9VFKow6t908KwzxLgKZqCV9untx8erPFgfxJ+GVXsPmgZ0BTpubAFBm/ObC
         MkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h4COCc6WWbcVY5jQ0JrT6vbxRGslEgbBhKARy0jzFVM=;
        b=gZ7wuBFFAQd+tesIXDk99CNa0Jw5bK5U59rWUHXOU5UKxf3uvby2B1Uj9zmiBOLZrv
         eE7qX8vfaHTdtDGcOfDyq0fykr7cpGMj6s5uQTPL2bcpfDO3Jm4brrH03vOVPcr/3BH9
         4spQW7ryR12dl3we2hheBH7jqbBvp4TztHPbR05shRpr+CTXHKQifP/ezZuCQ1m6oDh0
         4gWyIMmOzdSTcMKsRdJfqlISZnv9pJaG5Z6r/IPcGubKPj/CiMENoiLApzheAtYraRWj
         yrDhm83e5yJVCLaI3/2xvl7w/mC4K3dV9/Y0MaQeTeob8lgj3hf8Ozj/Tj7QVVL7MZhP
         b+iw==
X-Gm-Message-State: APjAAAU4KRd3OS6y2ZV8h9KbtLeberrGZ8ocxzWnv+nS6K+dmrUF2eH2
        vDQ65oiUzS2tcpHBJNtDG9tJBoGETN4CGwJ5UWk=
X-Google-Smtp-Source: APXvYqyIQSEiuaU5HVPWMyKdosVkLuHrubBkjA8wys2o6pRZxOutxlRM+12q0r7CC5E+T5w3+8sI8KJuYbIaFOBRgos=
X-Received: by 2002:a17:906:4d05:: with SMTP id r5mr2229424eju.182.1565789171526;
 Wed, 14 Aug 2019 06:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190813153600.12406-1-bruno.thomsen@gmail.com>
 <20190813153600.12406-5-bruno.thomsen@gmail.com> <20190813161908.GA7857@roeck-us.net>
In-Reply-To: <20190813161908.GA7857@roeck-us.net>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Wed, 14 Aug 2019 15:25:55 +0200
Message-ID: <CAH+2xPDA4Ja_6Sgo0-Ak8KC5RKgE2E8CKyWargYaJMu52o_aoA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] rtc: pcf2127: add watchdog feature support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        a.zummo@towertech.it, wim@linux-watchdog.org,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Guenter

Thanks for the quick review.

Den tir. 13. aug. 2019 kl. 18.19 skrev Guenter Roeck <linux@roeck-us.net>:
>
> On Tue, Aug 13, 2019 at 05:35:59PM +0200, Bruno Thomsen wrote:
> > +static int pcf2127_wdt_start(struct watchdog_device *wdd)
> > +{
> > +     dev_info(wdd->parent, "watchdog enabled\n");
> > +
> > +     return pcf2127_wdt_ping(wdd);
> > +}
> > +
> > +static int pcf2127_wdt_stop(struct watchdog_device *wdd)
> > +{
> > +     struct pcf2127 *pcf2127 = watchdog_get_drvdata(wdd);
> > +
> > +     dev_info(wdd->parent, "watchdog disabled\n");
> > +
>
> There is a lot of noise in this driver. Please reconsider.

Would it be better if I remove the following lines:

dev_info(wdd->parent, "watchdog enabled\n");
dev_info(wdd->parent, "watchdog disabled\n");
dev_err(dev, "%s: watchdog registering failed\n", __func__);

and change this line to a dev_dbg():

dev_info(wdd->parent, "new watchdog timeout: %is (old: %is)\n",
         new_timeout, wdd->timeout);

?

Just checking so I don't waste your time on v3 review.

/Bruno
