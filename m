Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5552C749B06
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Jul 2023 13:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbjGFLn6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Thu, 6 Jul 2023 07:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbjGFLn5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 Jul 2023 07:43:57 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E47AAA
        for <linux-rtc@vger.kernel.org>; Thu,  6 Jul 2023 04:43:40 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-577497ec6c6so7641527b3.2
        for <linux-rtc@vger.kernel.org>; Thu, 06 Jul 2023 04:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688643816; x=1691235816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B1P5iTyw+q1EyirQ9/CZcpAFyHq3bZB1xtPbht2ZGU=;
        b=g7dfgSKK3Rh2o2/VzJtXwPfvC0EZKvfzr8Jq2Ws+3F5SBKo23Bd41b6kIShij2FLqk
         jVST824BUQZY2pCGTyREr+5Q9J0amn7/Q192Zxkt2FYti42NXrOlcpDQ9yqwr4KYMhs1
         YtIG13V1ux/rGqp04lwmYhhUt8YhxRbrwxB24XU1tUEWarcmp1CYFNyGHxCT+L746sG/
         AQbxDJw3cZ6cJ2I7pKQhPCKk0w4xMS1v6vjUW7OG1XhnzmOGfoZN/jVavXBicM2R81GZ
         VweYDmonNoeRNeTMS3kDWp8lPqSm4q3T60S8ZYwMFANa7os455YcRyoimWlx/A0wuVkN
         8nCw==
X-Gm-Message-State: ABy/qLYrWT8q4jwA10KpfxLUQqKNcC/GV+0NLCJgIFyLgR/iWnMHKZU0
        /q6vU/MPviQ3xKR694DFvfXb/RKdbYzswA==
X-Google-Smtp-Source: APBJJlG31Pyf+dXRIdyhwZo1UTtHMb+MbShiVThWoJL7CB4vQUqsMxuFVZtW9LlcrEJyCsHOOHOqUw==
X-Received: by 2002:a81:92c2:0:b0:573:4815:8347 with SMTP id j185-20020a8192c2000000b0057348158347mr1888803ywg.36.1688643815717;
        Thu, 06 Jul 2023 04:43:35 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id x142-20020a81a094000000b00565de196516sm295738ywg.32.2023.07.06.04.43.34
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:43:35 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-c4d04d50c4cso576783276.1
        for <linux-rtc@vger.kernel.org>; Thu, 06 Jul 2023 04:43:34 -0700 (PDT)
X-Received: by 2002:a25:4f03:0:b0:bff:5852:b112 with SMTP id
 d3-20020a254f03000000b00bff5852b112mr1350536ybb.61.1688643814620; Thu, 06 Jul
 2023 04:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230705003024.1486757-1-bgray@linux.ibm.com> <4e94cb11-1f39-d631-fe0a-b945b301b77c@csgroup.eu>
 <06d642f1e1245df1c68b6bd5fbd288233be027bc.camel@linux.ibm.com> <CAMuHMdUO_qEd2oVCMRGDZML6COquu-5=pS9fnFQ4pax6G4vxGQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUO_qEd2oVCMRGDZML6COquu-5=pS9fnFQ4pax6G4vxGQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jul 2023 13:43:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWL+1=dZHCXwxO7PmK8kU95Ey5boQrqCxUNQPed_5U+Hw@mail.gmail.com>
Message-ID: <CAMuHMdWL+1=dZHCXwxO7PmK8kU95Ey5boQrqCxUNQPed_5U+Hw@mail.gmail.com>
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

On Thu, Jul 6, 2023 at 9:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Jul 6, 2023 at 8:14 AM Benjamin Gray <bgray@linux.ibm.com> wrote:
> > On Thu, 2023-07-06 at 05:13 +0000, Christophe Leroy wrote:
> > > Le 05/07/2023 à 02:30, Benjamin Gray a écrit :
> > > > The drivers/rtc/rtc-ds1307.c driver has a direct dependency on
> > > > struct regmap_config, which is guarded behind CONFIG_REGMAP.
> > > >
> > > > Commit 70a640c0efa7 ("regmap: REGMAP_KUNIT should not select
> > > > REGMAP")
> > > > exposed this by disabling the default pick unless KUNIT_ALL_TESTS
> > > > is
> > > > set, causing the ppc64be allnoconfig build to fail.
> > > >
> > > > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > > > ---
> > > >   drivers/rtc/Kconfig | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > > index ffca9a8bb878..7455ebd189fe 100644
> > > > --- a/drivers/rtc/Kconfig
> > > > +++ b/drivers/rtc/Kconfig
> > > > @@ -246,6 +246,7 @@ config RTC_DRV_AS3722
> > > >
> > > >   config RTC_DRV_DS1307
> > > >         tristate "Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00,
> > > > EPSON RX-8025, ISL12057"
> > > > +       select REGMAP
> > >
> > > As far as I can see, REGMAP defaults to Y when REGMAP_I2C is
> > > selected.
> > > Can you explain more in details why you have to select it explicitely
> > > ?
> > > If there is something wrong with the logic, then the logic should be
> > > fixed instead of just adding a selection of REGMAP for that
> > > particular
> > > RTC_DRV_DS1307. Because others like RTC_DRV_ABB5ZES3 or
> > > RTC_DRV_ABEOZ9
> > > might have the exact same problem.
> >
> > Right, yeah, I don't want to assert this patch is the correct solution,
> > sending it was more to offer a fix and allow discussion if it should be
> > resolved some other way (so thanks for replying, I appreciate it).
> >
> > In terms of why I made this patch, the way I see it, if a config option
> > requires another config option be set, then "selects" is the natural
> > way of phrasing this dependency. "default" on the REGMAP side seems
> > weird. If it's a default, does that mean it can be overridden? But
> > RTC_DRV_DS1307 *requires* REGMAP; it's not just a "would be nice". The
> > build breaks without it.
> >
> > But maybe KConfig works differently to my assumptions. Maybe the
> > referenced patch that causes the build failure is actually incorrect
> > (CC Geert). I spoke with Joel Stanley (CC) and he indicated you're not
> > supposed to depend on REGMAP like KUnit does?
>
> Thanks for CCing me!
>
> Looks like I made a really silly mistake here: my patch not only allows
> the user to enable REGMAP manually (for the test), but also to disable
> it manually, regardless if there are users or not :-(
>
> I think the proper fix is to replace the "default y if ..." by
> "select REGMAP" for all users.

I have sent a patch to do so, followed by a few related fixes
https://lore.kernel.org/r/525c37a568b10623ffb2d108850afd7e37f9350e.1688643442.git.geert@linux-m68k.org

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
