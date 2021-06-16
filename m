Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4265C3A95B8
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Jun 2021 11:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhFPJRG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Jun 2021 05:17:06 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:57505 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231491AbhFPJQl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Jun 2021 05:16:41 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id E05DE580064;
        Wed, 16 Jun 2021 05:14:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 16 Jun 2021 05:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=O
        Q3mH14ssHehAX5EBuHe0ZN2vZKDVl/XkALKv3ydHts=; b=kRkGMEktwO4/GNbKL
        B/M6Cs/SVuLdcXQbvM/ZQuzuGVu+MEHIYcPbqTtxEfqQfs5n0MZd2v3L5dHENFyI
        qm5qTiH7zpI68Uo6yxBtUXTgGTWKQ8qvVXvfuYxXNPPcEMsxtp9tCHhwz4EItqzK
        jjizIw9c/R2yTp8og2V9fMqGH20A3dp9TARyTxit1xSwBqrQr5CJvecXeN78+E4s
        iaI6ZfqRnE4N/ppWya61GA2i3iWuv/r+qPEjrNm2NSjHdqsdUwLPamOmV0m6Sksw
        jOwP/UTAXcdhCYn3wO+epfkGBfqOQUn2njycYxL1NvRLWBw0hoynt+iGgDfciNBe
        9r4pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=OQ3mH14ssHehAX5EBuHe0ZN2vZKDVl/XkALKv3ydH
        ts=; b=A9fvZqOB5fAh2U3yGwclU35hepaDf0GnTr59uPJSIjkrAC49P+/gWEm+x
        10zJttYuB/rnUKEfw9kL/lyjTaO550YCIrX/Euf9OS8SahTIx/EK8pSYOXMzibcz
        u+p1Js1ZgEtO3u24fsZai4iOzxNdtsOzJBzx9GdnFWAu536z120kMFDbiwxagct+
        gZB8+F7Qmb1sIazCkWY5Y5Qy8BZMXVfMjDdLyR+MKeR46ecDYQckIL9SgJN2eMz0
        42zcfMtzHgpPWFThXljU4EOe35Zl9jvVNUZZV1DuFmzmSqmjoaQGauHPCW1N/Q/U
        142cHenOo+DQEUOkww1/NWuDlPo8A==
X-ME-Sender: <xms:-cDJYA-WErIOd1T0x_06AvckZj1Btse8h3kHP6TIYhPpL2EMcEXWJw>
    <xme:-cDJYIt6hSSYBcTCAcJcq2aqrUhw1eJ2ypSHEtUftJh-XSBJ1PWaLP50waZ8KLtfT
    aPAGnlMsw90ORLih7E>
X-ME-Received: <xmr:-cDJYGBncvK2uOvZJR6QlfKNtxL14wWCVgtU7HYwkcFlocFpvK69z89zQBzPJj9vO7bYKfNFltPsq1j2P7YyNHasgRJq028TCrxE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
    gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-cDJYAew-dQgab0UeOnHsBtahlWSMRVC4xdVYNMb0iDf1B3FFZ45iA>
    <xmx:-cDJYFMBLpfywjstQkD2scZyMylcWQ5fSIfGrydJxjZWYc5_pectLg>
    <xmx:-cDJYKm-MWdTDGDDZdfSBcquY5HvVltEXrxBuQKaSvpkh3n5A14CVA>
    <xmx:-8DJYJnqWyh3TT-86rcGaq8Bg_NKNYaKqQbBU_5vgkV-xJ7RuNDpAw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 05:14:33 -0400 (EDT)
Date:   Wed, 16 Jun 2021 11:14:31 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v7 06/19] rtc: sun6i: Add support for RTCs without
 external LOSCs
Message-ID: <20210616091431.6tm3zdf77p2x3upc@gilmour>
References: <20210615110636.23403-1-andre.przywara@arm.com>
 <20210615110636.23403-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210615110636.23403-7-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On Tue, Jun 15, 2021 at 12:06:23PM +0100, Andre Przywara wrote:
> Some newer Allwinner RTCs (for instance the one in the H616 SoC) lack
> a pin for an external 32768 Hz oscillator. As a consequence, this LOSC
> can't be selected as the RTC clock source, and we must rely on the
> internal RC oscillator.
> To allow additions of clocks to the RTC node, add a feature bit to ignore
> any provided clocks for now (the current code would think this is the
> external LOSC). Later DTs and code can then for instance add the PLL
> based clock input, and older kernel won't get confused.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Honestly, I don't really know if it's worth it at this point.

If we sums this up:

 - The RTC has 2 features that we use, mostly centered around 2
   registers set plus a global one

 - Those 2 features are programmed in a completely different way

 - Even the common part is different, given the discussion around the
   clocks that we have.

What is there to share in that driver aside from the probe, and maybe
the interrupt handling? Instead of complicating this further with more
special case that you were (rightfully) complaining about, shouldn't we
just acknowledge the fact that it's a completely separate design and
should be treated as such, with a completely separate driver?

Maxime
