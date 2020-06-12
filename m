Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C291F79B9
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Jun 2020 16:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgFLOYD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Jun 2020 10:24:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgFLOYC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 12 Jun 2020 10:24:02 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54BAE20838;
        Fri, 12 Jun 2020 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591971842;
        bh=Jabur5smBvGZZkN5LP0j28GCR/csYEhGvzQulLk02Vo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zySqOG+vAtVCKJxp/CTiLeDpeBobIxI7ebLvEFKWzykYJ3Lxy2fIzAStxokuvtaYp
         BhSUyKbjhH/5Hu9S70+B0W5DL65vlB+McQVOrHiFbJ93/zYahCMfnKagIf0yREHF83
         SP59djvv3IzmOeuqc1xSGnAjboBExoadwGFeAz8E=
Received: by mail-ot1-f53.google.com with SMTP id n6so7482321otl.0;
        Fri, 12 Jun 2020 07:24:02 -0700 (PDT)
X-Gm-Message-State: AOAM5324ebIX2aAGVUILgB589F3Cj07V1T96cj6IcyGtl1L4jA2isNu7
        ffPAaH8HswcDxZXu/PtUm4cL6r5FGT7qpIP7dg==
X-Google-Smtp-Source: ABdhPJz9tcOxf5zS0kIDnHx0dN3JUZV7Gn3yZVmn6D3Dxf1HcGgmLvC2nGTiL65GX45cIkQurq1x8VD2cNpm6KXt+qc=
X-Received: by 2002:a05:6830:549:: with SMTP id l9mr11117750otb.129.1591971841688;
 Fri, 12 Jun 2020 07:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200530123222.361104-1-kevin+linux@km6g.us> <20200609221401.GA1492918@bogus>
 <CAE+UdorjD+2GORj3M6abgqTb8QnRZNFiyCX9PJAJc09xUBACqA@mail.gmail.com>
 <20200610151619.GW3720@piout.net> <CAE+UdooznvJaJsMjrS+MeM6ysii8tR9fuZhjt44sMRF6VjYqPw@mail.gmail.com>
In-Reply-To: <CAE+UdooznvJaJsMjrS+MeM6ysii8tR9fuZhjt44sMRF6VjYqPw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 12 Jun 2020 08:23:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+=WwN2AL0o2vpwjXr90Vi-=UmY_N+Pz7F2YGa4b7CiAA@mail.gmail.com>
Message-ID: <CAL_Jsq+=WwN2AL0o2vpwjXr90Vi-=UmY_N+Pz7F2YGa4b7CiAA@mail.gmail.com>
Subject: Re: [PATCH] rtc: abx80x: Add support for autocalibration filter capacitor
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jun 12, 2020 at 5:48 AM Kevin P. Fleming <kevin+linux@km6g.us> wrote:
>
> On Wed, Jun 10, 2020 at 11:16 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > When working with RTCs, there is one issue though: boolean properties
> > are not working well because there is no way to express the 3 different
> > conditions:
> >  1/ the capacitor is present, set the register
> >  2/ the capacitor is absent, clear the register
> >  3/ the device tree didn't have this property until not and the register
> >    may have been set or cleared using another mean, don't touch it.
> >
> > As your patch is written, it only handles 1 and 3 which is probably the
> > safest option but then we will never have a way to clear it from the
> > driver. I'd say that this is not an issue but it is also something we
> > will never be able to change without breaking some setups.
>
> I agree. I could implement this as an enumerated string option which
> accepts 'yes' or 'no'. Those would cover cases 1 and 2, and the
> absence of the property would be case 3. I looked through the bindings
> that exist and didn't see any examples of properties configured this
> way, but I think it would be understandable to users.

It's a solved problem:

foo-feature = 0; //disable
foo-feature = 1; //enable
<no prop> // Leave feature configured as-is

Rob
