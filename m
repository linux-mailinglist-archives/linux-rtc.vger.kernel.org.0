Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E64D3F1DB4
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Aug 2021 18:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhHSQXT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Aug 2021 12:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhHSQXS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Aug 2021 12:23:18 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650FEC061575;
        Thu, 19 Aug 2021 09:22:42 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id b5so4379400vsq.2;
        Thu, 19 Aug 2021 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nfMN3wENLabmsAjzpMDkfRlM5/KIH+Ze8LdVXKhpMjE=;
        b=aWAMSkUCU45Ry0LxAltLG7tG9MJFn8koyyZzVuZXXSjYJkPMcfakvHBn/mUCyEZP+k
         QsrEwgd19IwypR0ceZTD+GrhPtP3csaocWh2Zxj1itu4kM/XIcWKwysUJKrYdAmxy2GR
         2po8dn4EldWJDOY8auFunk+o7Yr4o7vlX8BpIwVx7c+I6SDiRdNFZnOL2aIfcJ4DqYtK
         u//mznLZUg11Cjv3aUM/CgGaqtc6gv9oPL2GrFE5LRFWOpD0b97Vsxw7osngUAQmmYnj
         Cc/w6P+fzvbfTsq8Pf0MD3pn3y57qTEVCbLQ5VxcSP8/dfja3H4RwN699AenGDo1LfV/
         XLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nfMN3wENLabmsAjzpMDkfRlM5/KIH+Ze8LdVXKhpMjE=;
        b=ijMqCu8lz1+PQI//YMs0yNFTlFObey8zkWJKX7TNEaMK99sEwtTUYwd9Trgz8RIot7
         IHB+ukU9G4yDJl8nkSuNFruxzRY+NT+O1WRomDvEFvUwCy5iXSPj8VYGmOlaiQ/xz5Ga
         yNI0ReKQQODtnTsyvNh3bxG6knpRdUgPiXX6OrS7vETd0h3CrDdyVIZ8eoVNOZOrRPY0
         8APRsMARBf9qObVk+yGycrsW/AimnRIUBFsWh4vh7HY7H4uFwTl4CeuZzsXfJ0Ny4VrY
         3o0eQESp0+piWbLwft8yA5F9k4osUlCa2Y9CRQe63nnhe1xGi2JMFfGGryg0V1BGRco+
         Ptgw==
X-Gm-Message-State: AOAM531w+ai3i8tpyy7uOTI6cfyLrPJhAc6Ad37cl7HXwf5GbcLuff9S
        oeCAvOK2k3QVb0As1KD2kFyZ+5q8/ZcE5ZQOKOM=
X-Google-Smtp-Source: ABdhPJwnkU+jQid1LWjPJTT7+M4mJmbVZZnEj10Ot++gI1N1NGw4DSpxpAcvvFsx6cjOdWMxunIeaJ9B9T5poQUkhqw=
X-Received: by 2002:a67:fa84:: with SMTP id f4mr13114172vsq.59.1629390161584;
 Thu, 19 Aug 2021 09:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210801160921.233081-1-romain.perier@gmail.com>
 <20210801160921.233081-4-romain.perier@gmail.com> <CAFr9PXmqiu=toGf9DjoH8XMbPaiXaWLV=GsmR7OCkkqix5tRvw@mail.gmail.com>
In-Reply-To: <CAFr9PXmqiu=toGf9DjoH8XMbPaiXaWLV=GsmR7OCkkqix5tRvw@mail.gmail.com>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Thu, 19 Aug 2021 18:22:29 +0200
Message-ID: <CABgxDoL0sQH4MRBA-1hJtXkNaphnKu7fbW9C++vEQSX4F6Q1yQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: mstar: Add rtc device node
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

As I need to send a v3, I can fix it, no worries.

Cheers,
Romain

Le lun. 2 ao=C3=BBt 2021 =C3=A0 12:40, Daniel Palmer <daniel@0x0f.com> a =
=C3=A9crit :
>
> Hi Romain,
>
> On Mon, 2 Aug 2021 at 01:09, Romain Perier <romain.perier@gmail.com> wrot=
e:
> > +++ b/arch/arm/boot/dts/mstar-v7.dtsi
> > @@ -116,6 +116,13 @@ watchdog@6000 {
> >                                 clocks =3D <&xtal_div2>;
> >                         };
> >
> > +                       rtc@2400 {
>
> I think the rtc should be before the watchdog as the address is lower.
> I think maybe this got flipped around during cherry-picking.
> I can flip it around when I pull this into an mstar dts for 5.15
> branch so you don't need to fix it and send a v3 assuming everything
> else is ok.
>
> Thanks,
>
> Daniel
