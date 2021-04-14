Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF3F35F9A0
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Apr 2021 19:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348661AbhDNRPp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Apr 2021 13:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbhDNRPo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Apr 2021 13:15:44 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0285FC061574
        for <linux-rtc@vger.kernel.org>; Wed, 14 Apr 2021 10:15:23 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id e7so24574946edu.10
        for <linux-rtc@vger.kernel.org>; Wed, 14 Apr 2021 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UXvQGOPGMiIBh+TNB+TuJqTHlXvXGuBCSN0JQwAe2RQ=;
        b=PWwEvYYJje0y3hO9Tl1LpDzu7QSF9xAeVKMVaYsWQZrwkc7nZjup6LaFcS/lfjD4cs
         U3RG3b+S0Ul3QZJC7Rahky+ypsws8OJFNWgcA/uATSo/kIWbttCAdlLjnFhau8ieQOdi
         lnZoUpHjTPV1fOkCJ3QGdk1ZDi10Do4z5CbIpvZiR6P5jMXr0qAflAIqifK5T8ybVR3s
         DRNGrAOLqXYnH/lFkKF2u6vDCp1NHUPLZ6iwjPQaYSd3VF/lGxM3wJJgqXvYrChs7Z+T
         R2y9g/F6WEvR4q6w7JpydKRIExcO4e8E6By3YV3o4tE6XP0k/AeXUqxynt4rjyLMpLtB
         nSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UXvQGOPGMiIBh+TNB+TuJqTHlXvXGuBCSN0JQwAe2RQ=;
        b=Jjxci87XTmkB1ft70tNQF3auiqEDpR4JBSHdk38eS9vW+6j8qE9ibuCgIrRctjzcIc
         bqhB+kjm/WomynXw2RsLkCojPrhs7CAdZZV1yVjkrRb/kydaKO6aeLpRgd1snyRH5pIr
         x0UiaAtYwtcCWlRQu9BcknyLbWgfBBtwyV8PBnw6a00gPPLPPIGd8JSfUgmHSsKE47hw
         gKEU+YNNa5oNKeqGPRSsfOY8OuAiJ64TH81xsn6jvsZbGSN7XMmGRQ0mQPd+Eub9Ep3Y
         aBxi7+ZStc0R67bF+g4MiOgecUiT4us8ikDQcvyfpx4BiVA/21ZqA4K16x0fwgjYe/oi
         o8cw==
X-Gm-Message-State: AOAM532mHyoNNS+Nh1OcX6WKQv2gxQ5Cvi8Bn56zfMC7v74fqugEvU/0
        9wsQ5LZSck+Af529Lp1thUnkJ/r2Ex4GBg==
X-Google-Smtp-Source: ABdhPJxsbziy4uMsB6zVMu3xcsr6bls0vIOO6rGwapNBI/ohN+5CrAvAeMvtWBDqkfAGseaP3jUKjQ==
X-Received: by 2002:a05:6402:1b1c:: with SMTP id by28mr42149129edb.62.1618420521771;
        Wed, 14 Apr 2021 10:15:21 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p24sm180643edt.5.2021.04.14.10.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:15:21 -0700 (PDT)
Date:   Wed, 14 Apr 2021 18:15:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] Immutable branch between MFD, Clock, GPIO, Regulator
 and RTC due for the v5.13 merge window
Message-ID: <20210414171519.GR4869@dell>
References: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
 <20210414131158.GN4869@dell>
 <20210414145345.GO4869@dell>
 <43131cbebdd04a3abc51e05de5170c583006e2d2.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43131cbebdd04a3abc51e05de5170c583006e2d2.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 14 Apr 2021, Vaittinen, Matti wrote:

> Hello Lee, Mark, Stephen, Linus, Alexandre,
> 
> On Wed, 2021-04-14 at 15:53 +0100, Lee Jones wrote:
> > On Wed, 14 Apr 2021, Lee Jones wrote:
> > 
> > > Please note that this PR will break your build unless you have the
> > > required Regulator API update.
> > > 
> > >  fb8fee9efdcf0 regulator: Add regmap helper for ramp-delay setting
> > >  e3baacf542756 regulator: helpers: Export helper voltage listing
> > 
> > Looks like Mark has these:
> > 
> >  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
> > regulator-list-ramp-helpers
> >  
> > > Pull at your peril! :)
> > > 
> > > The following changes since commit
> > > a38fd8748464831584a19438cbb3082b5a2dab15:
> > > 
> > >   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
> > > tags/ib-mfd-clk-gpio-regulator-rtc-v5.13
> > > 
> > > for you to fetch changes up to
> > > 5a8a64d9a38b9d3794f9f5e153fc0358b858cc24:
> > > 
> > >   MAINTAINERS: Add ROHM BD71815AGW (2021-04-14 10:21:43 +0100)
> > > 
> > > ----------------------------------------------------------------
> > > Immutable branch between MFD, Clock, GPIO, Regulator and RTC due
> > > for the v5.13 merge window
> > > 
> > > ----------------------------------------------------------------
> > > Matti Vaittinen (16):
> > >       rtc: bd70528: Do not require parent data
> > >       mfd: bd718x7: simplify by cleaning unnecessary device data
> > >       dt_bindings: bd71828: Add clock output mode
> > >       dt_bindings: regulator: Add ROHM BD71815 PMIC regulators
> > >       dt_bindings: mfd: Add ROHM BD71815 PMIC
> > >       mfd: Add ROHM BD71815 ID
> > >       mfd: Sort ROHM chip ID list for better readability
> > >       mfd: Support for ROHM BD71815 PMIC core
> > >       gpio: Support ROHM BD71815 GPOs
> > >       regulator: rohm-regulator: linear voltage support
> > >       regulator: rohm-regulator: Support SNVS HW state.
> > >       regulator: bd718x7, bd71828: Use ramp-delay helper
> > >       regulator: Support ROHM BD71815 regulators
> > >       clk: bd718x7: Add support for clk gate on ROHM BD71815 PMIC
> > >       rtc: bd70528: Support RTC on ROHM BD71815
> > >       MAINTAINERS: Add ROHM BD71815AGW
> 
> I think the original idea was that Lee could get the Tag from Mark and
> then get all the changes in via MFD tree. I can't say what would be the
> best way to get these in. I'm open to all suggestions :)

It's done now.  Anyone who wishes to pull (and test) this branch
should also pull in the regulator-list-ramp-helpers tag from Mark's
Regulator tree.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
