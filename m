Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCAF41E5A8
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Oct 2021 03:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350953AbhJABKU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Sep 2021 21:10:20 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34827 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349773AbhJABKU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Sep 2021 21:10:20 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id F0EE63201CCD;
        Thu, 30 Sep 2021 21:08:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 30 Sep 2021 21:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-id:content-type:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=x568XVvh0SI3UFtQbpVku/5dDAM8Dk1KB1+Ke6Ep+0w=; b=bw51vBdZ
        VV+3G261tSt3L2raNNlIjXrmRg/uJFumK8FhUGyl8XFC4qHKz+ILRoWy0aMUpcVK
        gKhA2tntx4Ham2UxRXUDhYxfhME/WfFv7vVJkrnFmHAki1X1BsHwCwzlWW+NAlil
        903l7ynoIOeGft08NoPM5gqk2dVVhcbLGy0eInC8gdE4cbi25arwIUsC981LhIGh
        RIa/7FuOKYs4GWQTqQGCmm+t/AZYj/1cgrNcg0P/NWXsRSQWit9w9mbd4GphcipJ
        s3cx6wQUuhhrM9GQBQPTGiXiAv5PPCLbkR/Z8nl8XlPA6KI89hd7pWKnA2FB2ScH
        SteJioAHPfDN7g==
X-ME-Sender: <xms:kl9WYZAb6yWSCeGBU-cCi-yBhPlm9fNoV-Q-DYveowDEW0AkU7bV6w>
    <xme:kl9WYXg4lPBJZ9wwcxGkiYK76yqAfmdYNbgupKs2RlXIKFgTdnolDMjT8SPY5nqEs
    FZSMxT4pAH4_AcjOWo>
X-ME-Received: <xmr:kl9WYUkz2K9FlIxd6ocDO4mdlU15W9WlQ2S-4f4BVZDazcObWlsfCVoERAopr_-PQIsg9xYSHrKpDMYPIq0NgG5XG_7GC8RpKEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekhedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepheduuddugfegheejtefhiefhffevuddugffhuddugefhueffueeifeeiueek
    hfffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
    rdhorhhg
X-ME-Proxy: <xmx:kl9WYTzYUPdEzDUO2qOGzDFjCiQ_ph4yTPXibv0BmlunYHWz4Q-fUw>
    <xmx:kl9WYeS9RYvUvCt9AIOuD3dywmB4ZuBDtxGZuQYncjTgD_vWYs6lkg>
    <xmx:kl9WYWZOYzw22mMi5VZVFuOrICb9MLJZ4e-m11qTv0GrRYsP79rk4A>
    <xmx:k19WYbKU4Wwmas6wEb89Gyc0PWnBuoaKzAs3en9bBDu2HN2ruYcIBA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Sep 2021 21:08:31 -0400 (EDT)
Date:   Fri, 1 Oct 2021 11:08:23 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Laurent Vivier <laurent@vivier.eu>
cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
In-Reply-To: <7748de16-1087-1039-a1cc-5a94dc293dbb@vivier.eu>
Message-ID: <1050733c-5260-3c1e-1ecc-7d3b58683a88@linux-m68k.org>
References: <20210323221430.3735147-1-laurent@vivier.eu> <20210323221430.3735147-3-laurent@vivier.eu> <a9c75ae7-6023-6b6c-260f-a0d6841ea4fa@vivier.eu> <CAMuHMdW49S_81Oip2p+yUO5YUL1-V3_K_C1WEXux7mQWcb-mKA@mail.gmail.com> <c28b0c92-a997-6978-890f-4222f4bb8cc6@vivier.eu>
 <9f7ad0df-b58c-1b24-5c48-5ee6478260dd@physik.fu-berlin.de> <7748de16-1087-1039-a1cc-5a94dc293dbb@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-367684304-1633050487=:28"
Content-ID: <94a4401a-2129-40e4-8afe-bdc757dcb59d@nippy.intranet>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-367684304-1633050487=:28
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <6fff8fad-f51b-369f-2e92-39ef9fdeac33@nippy.intranet>

On Thu, 30 Sep 2021, Laurent Vivier wrote:

> Le 30/09/2021 =C3=A0 22:56, John Paul Adrian Glaubitz a =C3=A9crit=C2=A0:
> >=20
> > On 4/28/21 14:15, Laurent Vivier wrote:
> >>> I have tested and reviewed your patch, great work!
> >>> I'm confident this can make v5.14, with the small nits fixed.
> >>
> >> Thank you for your review.
> >>
> >> I will answer to some of your comments and update accordingly my patch=
=2E
> >=20
> > It looks like this patch somehow fell off the table, didn't it?
> >=20
> > I was hoping to be able to build a virt kernel for Debian/m68k by defau=
lt
> > in the near future.
>=20
> Yes, I started to update my work according to the comments from Geert but=
 didn't have time to finish.
>=20
> Especially I tried to remove the LEGACY_TIMER_TICK, but it doesn't work,=
=20

There was an RFC patch from Arnd to convert the mac platform from=20
LEGACY_TIMER_TICK to GENERIC_CLOCKEVENTS:
https://lore.kernel.org/linux-m68k/20201008154651.1901126-14-arnd@arndb.de/
Arnd used a periodic clockevent device. I have a developmental branch=20
based on that patch.

Alternatively, I have a branch that implements a oneshot clockevent=20
device. This delivers GENERIC_CLOCKEVENTS and NO_HZ. For this I used VIA 1=
=20
timer 1 in free-running mode for the clocksource and VIA 1 timer 2 in=20
one-shot mode for the clockevent device. (But this does require some QEMU=
=20
improvements because there's no oneshot-mode in mos6522.c in mainline=20
QEMU.)

Anyway, it can be done. If you want to pursue it, perhaps we can=20
collaborate.

> and as it has been tested like this by you and most of the other m68k=20
> targets uses it I think I will let the patch with it.
>=20
> I'm going to update my patch to have a v2, at least to have fresh=20
> reviews.
>=20
> Thanks,
> Laurent
>=20
---1463811774-367684304-1633050487=:28--
