Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3087A7496C7
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Jul 2023 09:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbjGFHu3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Thu, 6 Jul 2023 03:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjGFHu2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 Jul 2023 03:50:28 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4A810B
        for <linux-rtc@vger.kernel.org>; Thu,  6 Jul 2023 00:50:27 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5774335bb2aso5653177b3.0
        for <linux-rtc@vger.kernel.org>; Thu, 06 Jul 2023 00:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688629827; x=1691221827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBI3tfdffNzea+PFNOGJvTbzqg9cb+gZyrTlNogDBJ8=;
        b=F/HjLDd1k8AiVJLoN8ZzvobNGHOVPzqoCwBnr7vsItUfXXCK4AqYnLP2gPIqffLjHw
         bxuOx3UFXqvfScBO5PANI9DrzcOOOd/TzcyFuX2BtIOyvrJquC9ry4PAFbMX183MKOGT
         Df71k5sO053o9DhEPXAC8wXqsWjY+x/MWO8JBt0LftxP7Gpn+SIDIf8XJ/s8+JZBrq/G
         zSkcbUttH9nGjvNl4r/kdwE3AO3iYKm0mzaJiitmDUg143Q9Qcau8kHAUrzjrvHal4Qj
         s4RryIGLdro5tMfp12a2YIUW/VsCn9IsIdi9OsvL/G9t1e/wYxrAhkwYdhLj5sDqIv+B
         6N0g==
X-Gm-Message-State: ABy/qLaBmIUfMYosZ2JJwDh8UmjA+ADE85RaOq+lUo+1XlFftsYNEzWF
        l6wsi6uUyjia8SmigXW6B9jaM0MKJ2fAlw==
X-Google-Smtp-Source: APBJJlEnvDT+QNBmjmHKqQjnHGcjtFT976Af8maMG/oIOZggUI1ImdH9BvcDOjYYInxKjg4Kc1Jrug==
X-Received: by 2002:a81:7d8b:0:b0:55a:574f:327c with SMTP id y133-20020a817d8b000000b0055a574f327cmr1267383ywc.13.1688629826858;
        Thu, 06 Jul 2023 00:50:26 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id d63-20020a814f42000000b0056d304e224dsm185611ywb.90.2023.07.06.00.50.26
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 00:50:26 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-c01e1c0402cso362475276.0
        for <linux-rtc@vger.kernel.org>; Thu, 06 Jul 2023 00:50:26 -0700 (PDT)
X-Received: by 2002:a5b:3c6:0:b0:c0f:c120:1a9b with SMTP id
 t6-20020a5b03c6000000b00c0fc1201a9bmr954054ybp.53.1688629826443; Thu, 06 Jul
 2023 00:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230705003024.1486757-1-bgray@linux.ibm.com> <4e94cb11-1f39-d631-fe0a-b945b301b77c@csgroup.eu>
 <06d642f1e1245df1c68b6bd5fbd288233be027bc.camel@linux.ibm.com>
In-Reply-To: <06d642f1e1245df1c68b6bd5fbd288233be027bc.camel@linux.ibm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jul 2023 09:50:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUO_qEd2oVCMRGDZML6COquu-5=pS9fnFQ4pax6G4vxGQ@mail.gmail.com>
Message-ID: <CAMuHMdUO_qEd2oVCMRGDZML6COquu-5=pS9fnFQ4pax6G4vxGQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: Kconfig: select REGMAP for RTC_DRV_DS1307
To:     Benjamin Gray <bgray@linux.ibm.com>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Benjamin,

On Thu, Jul 6, 2023 at 8:14 AM Benjamin Gray <bgray@linux.ibm.com> wrote:
> On Thu, 2023-07-06 at 05:13 +0000, Christophe Leroy wrote:
> > Le 05/07/2023 à 02:30, Benjamin Gray a écrit :
> > > The drivers/rtc/rtc-ds1307.c driver has a direct dependency on
> > > struct regmap_config, which is guarded behind CONFIG_REGMAP.
> > >
> > > Commit 70a640c0efa7 ("regmap: REGMAP_KUNIT should not select
> > > REGMAP")
> > > exposed this by disabling the default pick unless KUNIT_ALL_TESTS
> > > is
> > > set, causing the ppc64be allnoconfig build to fail.
> > >
> > > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > > ---
> > >   drivers/rtc/Kconfig | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > index ffca9a8bb878..7455ebd189fe 100644
> > > --- a/drivers/rtc/Kconfig
> > > +++ b/drivers/rtc/Kconfig
> > > @@ -246,6 +246,7 @@ config RTC_DRV_AS3722
> > >
> > >   config RTC_DRV_DS1307
> > >         tristate "Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00,
> > > EPSON RX-8025, ISL12057"
> > > +       select REGMAP
> >
> > As far as I can see, REGMAP defaults to Y when REGMAP_I2C is
> > selected.
> > Can you explain more in details why you have to select it explicitely
> > ?
> > If there is something wrong with the logic, then the logic should be
> > fixed instead of just adding a selection of REGMAP for that
> > particular
> > RTC_DRV_DS1307. Because others like RTC_DRV_ABB5ZES3 or
> > RTC_DRV_ABEOZ9
> > might have the exact same problem.
>
> Right, yeah, I don't want to assert this patch is the correct solution,
> sending it was more to offer a fix and allow discussion if it should be
> resolved some other way (so thanks for replying, I appreciate it).
>
> In terms of why I made this patch, the way I see it, if a config option
> requires another config option be set, then "selects" is the natural
> way of phrasing this dependency. "default" on the REGMAP side seems
> weird. If it's a default, does that mean it can be overridden? But
> RTC_DRV_DS1307 *requires* REGMAP; it's not just a "would be nice". The
> build breaks without it.
>
> But maybe KConfig works differently to my assumptions. Maybe the
> referenced patch that causes the build failure is actually incorrect
> (CC Geert). I spoke with Joel Stanley (CC) and he indicated you're not
> supposed to depend on REGMAP like KUnit does?

Thanks for CCing me!

Looks like I made a really silly mistake here: my patch not only allows
the user to enable REGMAP manually (for the test), but also to disable
it manually, regardless if there are users or not :-(

I think the proper fix is to replace the "default y if ..." by
"select REGMAP" for all users.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
