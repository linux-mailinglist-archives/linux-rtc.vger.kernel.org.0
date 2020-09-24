Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061B6277750
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Sep 2020 19:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgIXQ7v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Sep 2020 12:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgIXQ7u (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Sep 2020 12:59:50 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4470C0613CE;
        Thu, 24 Sep 2020 09:59:50 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id e23so5514813eja.3;
        Thu, 24 Sep 2020 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+1TNRMBksp0ZgyPa79AqDX/KsIzG5AY4VLIzrVQYq/s=;
        b=opeaTU8hCe8259r7Jy3Bwmk8TeN10WvSFkY4pGk0h2k+pVLxnmrcR7anMAVBEGfW3l
         zAIVq3cj1CvSDhR2B7YEYynA9wE+GFw6xsjZiQ9jQJtyGPfPOUr+PWnu0AscIM89h7gb
         K8gYXq6GWR9Sxjp7fd7wmlnIMPYkZo4gqskb+D+WKGQA9u3MbiZ0excKw+IczPRks99X
         e+VMH86xPl1LV+DzCOIva90my3DNxiyFvdqhieuO7igLDCsQr4qQWFISXBhJAUThcP/a
         Bfbc5EdrmmuP6PwTArek6/4nJzq5g9OIoqIBtq9x0BGXGRgc3kdTY1ce5q3pp5Tsp7aI
         agPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+1TNRMBksp0ZgyPa79AqDX/KsIzG5AY4VLIzrVQYq/s=;
        b=MkN/lZb707HRnlfL2dYgtNq4pn7b0FldPI8Ki2VWSABYotiRV8OmQ0XoMr1vBCxWLo
         MB4BGKPK22u//LB353P4Q+hWUl5xtH3QM3yYzcnDeu3JVFtDXDExR/fLmDTLjdQdzC+k
         p5TzJVbgGI11Z2SluQFdNws8GUSlnH5XFy3gob7LaJyboPaWb1H001LEsQ35AprxKn2y
         SsGjFSqT53EElem1VQY/zjoj0jzmPmyoG8Yhl34UUJuQVdg1tF6CJrjfMi+qPwANjXJl
         4GUkGWAOfZK29s1FDmJ5T37vuxG4hA+eX6fODr8uhTyBfFrQsJASWrDpTte1+BLnJwUc
         TurQ==
X-Gm-Message-State: AOAM532rJ7MM/oOl0YBm2ppHbk4n7GoqSFXoYuG3nMmUvEWXUFrtwFOh
        R0Tp4VGYhVVaQr6i7tmW7+C6KezvSto066rprpk=
X-Google-Smtp-Source: ABdhPJyvmZQkFTapW8MqkbWB0p7BH9gIdf2jN0mm+srARTEERotirnhHqtVSSegNQTH+02fWXv/y2S9UoAa79UKY82E=
X-Received: by 2002:a17:907:9ed:: with SMTP id ce13mr859425ejc.180.1600966789263;
 Thu, 24 Sep 2020 09:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200921054821.26071-1-qiang.zhao@nxp.com> <20200923094449.GP9675@piout.net>
 <DB8PR04MB67635518BE38EEF5292C8D0991390@DB8PR04MB6763.eurprd04.prod.outlook.com>
 <20200924070456.rovgp6n5q25s53vc@pengutronix.de> <VE1PR04MB6768783CAE7CA611365661AF91390@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <20200924074715.GT9675@piout.net>
In-Reply-To: <20200924074715.GT9675@piout.net>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Thu, 24 Sep 2020 18:59:33 +0200
Message-ID: <CAH+2xPAi+f2eKdeYiipc=W7eeeNdiXngTLkchpdoFMjJn9Og9w@mail.gmail.com>
Subject: Re: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for nxp,pcf2127
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Qiang Zhao <qiang.zhao@nxp.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den tor. 24. sep. 2020 kl. 09.47 skrev Alexandre Belloni
<alexandre.belloni@bootlin.com>:
>
> Hi,
>
> On 24/09/2020 07:23:18+0000, Qiang Zhao wrote:
> > > > Yes, you are right, There is not a fundamental solution.
> > > > However it somewhat avoid this situation at least.
> > > >
> > > > And if without this issue,
> > > > is it correct to register a rtc device as watchdog no matter it is used as
> > > watchdog on the board?
> > > > Every time Linux are booted up, watchdog device should be configured to the
> > > right one manually.
> > > > So the patch are useful, even though it is not for the issue.
> > > >
> > > > What should we do to really resolve this issue?
> > >
> > > I still think we need a kernel solution here. I would expect that most assembled
> > > pcf2127 chips are unable to act as a watchdog (i.e. don't have the RST output
> > > connected to something that resets the machine).
> > >
> > > So my favoured solution would be a positive property like:
> > >
> > >     has-watchdog;
> > >
> > > or something similar. In my eyes this is definitely something we want to specify
> > > in the device tree because it is a relevant hardware property.
> > > I consider it a bug to give a watchdog device to userspace that isn't functional.
> > >
> > > Best regards
> > > Uwe
> >
> > I strongly agree with you! It should be positive property.
> > However, we couldn't identify which board are using pcf2127 as watchdog,
> > So we are unable to modify the boards' dts to correct (watchdog or not) in this patchset.
> >
> > I noticed that only LS series platforms and imx6 have pcf2127 node, as far as I know, the LS platforms don't use it as watchdog,
> > But I am not sure about imx6
> >
>
> I don't think there is any user upstream and it is recent engouh that we
> can probably make that a positive property.
>
> Bruno, is it ok for you? you are the only know user of the feature.

Hi

This seems like an okay solution to me.

I have a patch series on the way with a new product dts[1] that is
using the watchdog
feature in the pcf2127 chip.

I know that the watchdog feature is used by other products with
out-of-tree dts, but I
will make sure to give them a heads up.

/Bruno

[1] https://lore.kernel.org/linux-arm-kernel/20200923154024.11417-2-bruno.thomsen@gmail.com/
