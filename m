Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693731E9414
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 23:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbgE3Vyk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 May 2020 17:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgE3Vyk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 30 May 2020 17:54:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB2AC03E969
        for <linux-rtc@vger.kernel.org>; Sat, 30 May 2020 14:54:38 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id k5so3522644lji.11
        for <linux-rtc@vger.kernel.org>; Sat, 30 May 2020 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y7JoDZ0bpR+ZR7wuaB/i3lyS/qCPMZ64WthTRUWqbyE=;
        b=DICHp6qq6aGYWy6cNdjZfkUBFwleZf/9NkDh2OgHidtUU4ul/VE8MFSv2y29Rh6Jau
         j9/GzDi+Z5gqxUU8CL0C2tSNaDUMXu9BRx5Uf4jXUABILjnfn6OY9PnpTXbxYAhL0JJ1
         Uf5vvmKzSuTL7wxHwrdTmJFWru8amjnijKZHBzeyftM0QquWMyha/uPDZ2CRMVkCMyYI
         itaGXY3A1N7+GAHLFydAaBGDturK3cCP7D4DWp0p9cik8gxD/nHRry0SOhIg484EzcEn
         VBPqnQ1jvPq3H4M41yDspa1O20fmwEpxYpvjGOKJB5vjdR46+YIsnFEdS5wzBtbVmBDM
         ntQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y7JoDZ0bpR+ZR7wuaB/i3lyS/qCPMZ64WthTRUWqbyE=;
        b=UHVoz21qKGlx4WISJVZ9b3Pg3imWanaQWTVHWZzuz/yYUKbXm7IuqPA9Z6OY7iciKH
         tZoo3Mco5FcgEo1xuFqlVA/FPJib3mwTKqhbB4864KNFfGP2vF2oVtdz5hXTnBre5dJL
         H0k66suv7PrjEXy+2RpdlyvWgwr7NH2ij6wk0ww6/inHigzxzTXc3r38xMi22J0vJwD+
         gs3uu8mHJ34/cAB/YJwDusrqS9h3OGTNogTANqtIONQby+zBBHSd6LbY3D3An6NkgO/f
         xKnN2F9GPjUjpDt3xA2WI7vg2p4Uaep8rYTMxA8hwMvW50IE7tBrNESoQUSY/uc1KHBt
         1+cg==
X-Gm-Message-State: AOAM5307eBKl2J34NcCblqljLedw8X3dwaK8JERyB8H0oAqlacG7sbvh
        OuBYdtvRrk5cIPUhHmbXgQYE1eRqw5NzPz7XbQjdcR1sic4=
X-Google-Smtp-Source: ABdhPJxTu+DO1gS8rHiWwPz2saqCjzrCkpI8ZnrlL90iZl4bD0w8x0No8n63tZRhlV5Qy76r17NIb8hCeCi66v8gsHs=
X-Received: by 2002:a2e:5457:: with SMTP id y23mr7787437ljd.5.1590875676827;
 Sat, 30 May 2020 14:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAE+UdorayxG79wDW8Up6-O_LdoBvcqQNQ4yYM90n2kv+XAu4+g@mail.gmail.com>
 <20200530202503.GB316755@piout.net>
In-Reply-To: <20200530202503.GB316755@piout.net>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Sat, 30 May 2020 17:54:25 -0400
Message-ID: <CAE+Udorq7Km+Lw9sQdrevcP1eLv7cxUD9teoumG0RV1o1HSegA@mail.gmail.com>
Subject: Re: abx80x: RV-1805 initialization order correct?
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

OK, thanks, I'll update my system to explicitly indicate that the
rv1805 is being used in the device tree.

On Sat, May 30, 2020 at 4:25 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> On 29/05/2020 07:13:00-0400, Kevin P. Fleming wrote:
> > The driver has a block of RV-1805-specific code (under the comment
> > 'Configure RV1805 specifics'), which is executed before the part
> > autodetection code (under the comment 'part autodetection').
> >
> > If the driver is loaded with the 'generic' device data for abx80x, and
> > the actual part in use is an RV-1805, the part-specific code won't be
> > executed. I'm using this driver in a dynamic Device Tree environment,
> > and at the moment I can't specify the part as the driver is loaded
> > (although I could modify the overlay to support that if required).
> >
> > So the question is: does the RV-1805 specific code *have* to be
> > executed before part autodetection in order to avoid the lockup
> > situation mentioned in the comments, or could it be moved immediately
> > after the autodetection so that it will be always be executed for an
> > RV-1805 part?
>
> You can't detect the difference between the rv1805 and the ab1805 with
> the id registers as both have 0x1805 so you will always have to use the
> correct compatible string for it. The position of the code doesn't
> matter.
>
> Basically, the autodetection should never be used as the device tree
> must describe the actual hardware. My point of view is that this was a
> mistake to have it in the driver in the first place.
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
