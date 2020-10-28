Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A0F29E16E
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Oct 2020 03:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgJ2CBD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Oct 2020 22:01:03 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:46717 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728079AbgJ1Vuv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Oct 2020 17:50:51 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 701635C0032;
        Wed, 28 Oct 2020 13:44:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 28 Oct 2020 13:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=2
        8qnJnc+eeyqFQKlSstideW9an1PTHl7M5jm4rsFseA=; b=E9jefSgp0MClmUmr5
        Yl6QMykUxKlcVWlnSQehrxapW8kDS8aFIR+6hZpVq04YpruAaGepEfCbjkzEbvA0
        wlSN9EcRlWHNANE+z7zIOrRtH84oynrjvJhjwXRzIA7leqfHM9A6qN8KyGC/MvbZ
        6cRNSdpR7/PbDDkvmvWHt3jB+g8giSfi4aGVX30MAEn/JZIIswaQiy/z6mixjewC
        CRyqBbM04zKzorDOBdowpzOAjWpkn2CK4Z1r8ssBGlg/iL7fY3mDdipXC2ZB934G
        TvLlYTqJEegG390ZjeNF7+J/wjGUDoo3A8xhb5uLQqVKFenK4d4ORDJiSmXt6dCy
        +6GXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=28qnJnc+eeyqFQKlSstideW9an1PTHl7M5jm4rsFs
        eA=; b=Od+1R2MoOVG5QLp0r/NWqcHrzHxBu4zWHtrVYrWD+TpNWzTxQveoxFl/S
        86l3bsueu4RC/RjOoq+nuwuk2UdTlExl1wL9x1vflKrPXk0+5N3NPeFZqIVELjuV
        PzK9VnTRZBQX+EMMd+DLRKO+i0fKDukX5YocjJ2ojRKtaDSI9dqum5DSg6WGs1MO
        cv6jVWL1yIQ4ZiPPn9mCMl/sAgh3Ax1ghZjv2vKAG8McknLHj7aKrOkob88SLGpk
        B4xyZuypxT9J4IzYo8YFrWqrlB9cDRJ+MyODyn0L4kJftFS2mJ53jp6OtuP6gj6j
        drIHmMB52lhz1os0XQuzfL4XTLHDg==
X-ME-Sender: <xms:Bq6ZX4V-UhstxWAd6oTRrB-caqJwOlUjK0J4hpdd321n7BB_Zs6t9w>
    <xme:Bq6ZX8l4XQAbxblCuTWb43UrD7rRhEX6h3-uQbxaeGNmUdmGqpWz2YhY5TMD-DzoV
    aZJ4iwOR6othtB3ID0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledugddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
    gedvudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Bq6ZX8Zb_cAB1Px_Tak1URXQaq602uAKywnNI_fSqptXce2rMTEj6w>
    <xmx:Bq6ZX3Vjv19lHAusEVKBDfEDx_1-Jg0ITC8MEU2HtbP3hY3x97yAVQ>
    <xmx:Bq6ZXyk7-BlYmu9JIwgfC7B2xHV9344BtVdfKujjuEQRFjLOYPZviA>
    <xmx:Ca6ZX5uKoCdCJJsbUUQ8bVKoGaAiWonyJ1qEr720Bnhzm9YiDhLGvQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E00C13280074;
        Wed, 28 Oct 2020 13:44:36 -0400 (EDT)
Date:   Wed, 28 Oct 2020 18:44:35 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v3] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
Message-ID: <20201028174435.dksz6b7jwabzloxt@gilmour.lan>
References: <20201020061226.6572-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201020061226.6572-1-dinghao.liu@zju.edu.cn>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Oct 20, 2020 at 02:12:26PM +0800, Dinghao Liu wrote:
> When clk_hw_register_fixed_rate_with_accuracy() fails,
> clk_data should be freed. It's the same for the subsequent
> two error paths, but we should also unregister the already
> registered clocks in them.
>=20
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime
