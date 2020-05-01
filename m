Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A246B1C1280
	for <lists+linux-rtc@lfdr.de>; Fri,  1 May 2020 15:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728586AbgEANAZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 1 May 2020 09:00:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:35912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728443AbgEANAZ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 1 May 2020 09:00:25 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68340208DB;
        Fri,  1 May 2020 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588338024;
        bh=BWUe7EXlOsidQCIzUxlz5wZpVtCjuHQG92CPfzEXpfU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Vf3phx6EjoLechZGqAyIJzHaodjpqok+7KMQmqhvMmsFpzJpE/dwh3wVNnuvNUZSv
         RCedCyVj2aF0Gewezdac7+I5NaAVjnhc2qoJRcsoqTSB9cxMcWTPiaTU1QdQdYtlrG
         63drkoP99qUH24x0egbaQjmtDVjBYaT5pcbeJp/c=
Received: by mail-ot1-f54.google.com with SMTP id j4so2455675otr.11;
        Fri, 01 May 2020 06:00:24 -0700 (PDT)
X-Gm-Message-State: AGi0PuacsgmJWrPGFnS2yhMYIAMuUU0nBlJvs6xCxRWsVB9dGSWr1LvW
        UxXn49NGP/GrcC7G2n23vHGse0TL0gCojm2m+g==
X-Google-Smtp-Source: APiQypK3dk8MycjE7hcrX9esCM3sjQAJDFPgVwsJfUuGfzFCk4JV3xfSG7wrUhO1CVlMQhC6Z9Nmwu1YB8ZtO1uVP8I=
X-Received: by 2002:a05:6830:4d6:: with SMTP id s22mr3476584otd.129.1588338023659;
 Fri, 01 May 2020 06:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200430140701.GA21776@bogus> <20200430141520.GA101194@piout.net>
In-Reply-To: <20200430141520.GA101194@piout.net>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 1 May 2020 08:00:11 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+HzG8QT+kHUjqC8joDxfm1WM+N_F1ZwYXg7cL5faGxVA@mail.gmail.com>
Message-ID: <CAL_Jsq+HzG8QT+kHUjqC8joDxfm1WM+N_F1ZwYXg7cL5faGxVA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Document the RTC present on MAX77620
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Apr 30, 2020 at 9:15 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 30/04/2020 09:07:01-0500, Rob Herring wrote:
> > On Fri, Apr 17, 2020 at 07:08:23PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > The RTC present on MAX77620 can be used to generate an alarm at a given
> > > time, which in turn can be used as a wakeup source for the system if it
> > > is properly wired up.
> > >
> > > Document how to enable the RTC to act as a wakeup source.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  .../devicetree/bindings/mfd/max77620.txt          | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> > > index 5a642a51d58e..f05005b0993e 100644
> > > --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> > > +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> > > @@ -125,6 +125,17 @@ MAX77663 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
> > >                     control) then, GPIO1/nRST_IO goes LOW.
> > >                     this property is valid for max20024 only.
> > >
> > > +Realtime Clock
> > > +--------------
> > > +The MAX77620 family of power management ICs contain a realtime clock block
> > > +that can be used to keep track of time even when the system is powered off.
> > > +
> > > +The realtime clock can also be programmed to trigger alerts, which can be
> > > +used to wake the system up from sleep. In order to configure the RTC to act
> > > +as a wakeup source, add an "rtc" child node and add the "wakeup-source"
> > > +property.
> > > +
> > > +
> > >  For DT binding details of different sub modules like GPIO, pincontrol,
> > >  regulator, power, please refer respective device-tree binding document
> > >  under their respective sub-system directories.
> > > @@ -159,4 +170,8 @@ max77620@3c {
> > >                     maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_SW>;
> > >             };
> > >     };
> > > +
> > > +   rtc {
> > > +           wakeup-source;
> >
> > Is the RTC really the only thing that could wake the system in this
> > PMIC?
> >
> > I don't think it's really valid to have 'wakeup-source' without
> > 'interrupts' unless the wakeup mechanism is somehow not an interrupt. So
> > I think this belongs in the parent node.
> >
>
> I don't think this is true because in the case of a discrete RTC, its
> interrupt pin can be connected directly to a PMIC to power up a board
> instead of being connected to the SoC. In that case we don't have an
> interrupt property but the RTC is still a wakeup source. This is the
> usual use case for wakeup-source in the RTC subsystem. Else, if there is
> an interrupt, then we assume the RTC is a wakeup source and there is no
> need to have the wakeup-source property.

Yes, that would be an example of "unless the wakeup mechanism is
somehow not an interrupt". I guess I should add not an interrupt from
the perspective of the OS.

So if the wakeup is self contained within the PMIC, why do we need a
DT property? The capability is always there and enabling/disabling
wakeup from it is userspace policy.

Rob
