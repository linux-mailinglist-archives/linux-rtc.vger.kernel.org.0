Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4BC27B1D4
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Sep 2020 18:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgI1Q0K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Sep 2020 12:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbgI1Q0K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Sep 2020 12:26:10 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB0CC061755;
        Mon, 28 Sep 2020 09:26:09 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id k13so464766oor.2;
        Mon, 28 Sep 2020 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=gaa0esapDG6wsuM6H+8aLVbUZepUNh74NuiYxnC9nQc=;
        b=XK7oKUWGIzEm5Td2eEYrcUpoN3v42O2pTgpQnx9ne6eiiD+O0Hl3tpToUimbFAvND4
         UcxoBaI+ZOG7vYGhf2lFtZn7hm51DXEqYCn1GYjDsz/6LIKTn5F11LYXe0ouA24cL+B3
         Egz+jktaYlEpXvsINaJPj0sHY+qA8YPgi85v7kztMUFKy89ZJjd5vv0M17wmwpJ7kcIZ
         35XO0RmrutfJIcYI5v4aM96m34a+u8DxkcSpWRSP7eEoxlbGLtpqdIbU/ANt1BSCvWns
         cnXZWWzC3t2x96a7IAH/d+6mw2Gl6Zs1SG9xgx4a3wSZAQRG5iJLqOg3vrqmbFcKdACg
         Hnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=gaa0esapDG6wsuM6H+8aLVbUZepUNh74NuiYxnC9nQc=;
        b=cYL8i4veSLNjpE9hK7+MxaD4Rkk7xWNbo5Epl6pKAc6TkHAjaTp6mQ6jAfN4JfmhPs
         2jBGv3jylZK/UY2Ca8nDRZzJIBqmXsu1m6ry9B06I1BZLXAv3YxczxqK9Al+k2tKNJGs
         KlemcKBcak47Q2pILsWzKEoOa8INEl3q7XoFG3llxkwnoB4vxzkYwDOFYB24FDrOs0C3
         380K+Ok4YRMW3gddObIKOSMHWJMMFy0obJterUOaGrmKQzQc40fO1FhMadPc0INzCVQ+
         yp7sTMBl9gETOjLeaLd0OF2JhIUWgIFmCgbCi/jIQ7UNZa6cWou2oVDjJ52hwfNUDRv9
         K+Jg==
X-Gm-Message-State: AOAM531Lf7q0vkj5B1hzbUsvDgw5zPD2y/n8d3iEMLAVvMJ+eKJlPIzY
        oudtmqT72dlbdmhvSdsjRNzNNX1ivHU=
X-Google-Smtp-Source: ABdhPJx7hjLir8z15uvrpf6rsWDk7pFU7o8egW1/fKlQNlIH6H3U33mvnicdHfTx0B7T1cvtZ4pTNQ==
X-Received: by 2002:a4a:81:: with SMTP id 123mr1419478ooh.80.1601310369270;
        Mon, 28 Sep 2020 09:26:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x198sm296092oix.33.2020.09.28.09.26.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 09:26:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 28 Sep 2020 09:26:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bruno Thomsen <bruno.thomsen@gmail.com>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-watchdog@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Qiang Zhao <qiang.zhao@nxp.com>
Subject: Re: [PATCH 2/2] [RFC] rtc: pcf2127: only use watchdog when
 explicitly available
Message-ID: <20200928162606.GA106276@roeck-us.net>
References: <20200924074715.GT9675@piout.net>
 <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
 <20200924105256.18162-3-u.kleine-koenig@pengutronix.de>
 <CAH+2xPAVvMpTgT3W=0AsKy=9jkS8qd6eB65Qebw51YKRQshaGQ@mail.gmail.com>
 <8f88f2a2-4a6d-021f-4404-f05518b0477d@roeck-us.net>
 <20200928084343.cl42lxsiionvq7tg@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200928084343.cl42lxsiionvq7tg@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Sep 28, 2020 at 10:43:43AM +0200, Uwe Kleine-König wrote:
> On Sun, Sep 27, 2020 at 08:54:47AM -0700, Guenter Roeck wrote:
> > On 9/27/20 1:09 AM, Bruno Thomsen wrote:
> > > Den tor. 24. sep. 2020 kl. 12.53 skrev Uwe Kleine-König
> > > <u.kleine-koenig@pengutronix.de>:
> > >>
> > >> Most boards using the pcf2127 chip (in my bubble) don't make use of the
> > >> watchdog functionality and the respective output is not connected. The
> > >> effect on such a board is that there is a watchdog device provided that
> > >> doesn't work.
> > >>
> > >> So only register the watchdog if the device tree has a "has-watchdog"
> > >> property.
> > >>
> > >> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > >> ---
> > >>  drivers/rtc/rtc-pcf2127.c | 3 ++-
> > >>  1 file changed, 2 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > >> index 5b1f1949b5e5..8bd89d641578 100644
> > >> --- a/drivers/rtc/rtc-pcf2127.c
> > >> +++ b/drivers/rtc/rtc-pcf2127.c
> > >> @@ -340,7 +340,8 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
> > >>         u32 wdd_timeout;
> > >>         int ret;
> > >>
> > >> -       if (!IS_ENABLED(CONFIG_WATCHDOG))
> > >> +       if (!IS_ENABLED(CONFIG_WATCHDOG) ||
> > >> +           !device_property_read_bool(dev, "has-watchdog"))
> > >>                 return 0;
> > > 
> > > I don't think the compiler can remove the function if
> > > CONFIG_WATCHDOG is disabled due to the device tree
> > > value check. Maybe it can if split into 2 conditions.
> > > 
> > 
> > If the first part of the expression is always false, the second
> > part should not even be evaluated.
> 
> This is wrong. For || the second expression isn't evaluated if the first
> evaluates to true (and the whole expression becomes true). This is the
> intended behaviour: If CONFIG_WATCHDOG is off, we don't need to check
> for the dt property and just skip the watchdog part.
> 
Sorry, I meant to say "If the first part of the expression is always true".

Guenter

> > Either case, the code now hard depends on the compiler optimizing the
> > code away.
> > 
> > It calls devm_watchdog_register_device() which doesn't exist
> > if CONFIG_WATCHDOG is not enabled. I didn't know that this is safe,
> > and I would personally not want to rely on it, but we live and
> > learn.
> 
> AFAICT this is save and used in other places in the kernel, too.  This
> is one of the reasons why you cannot compile the kernel with -O0.
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


