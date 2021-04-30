Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B4E36F777
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Apr 2021 11:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhD3JC7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 30 Apr 2021 05:02:59 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42733 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229522AbhD3JC7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 30 Apr 2021 05:02:59 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id BC9C75C0118;
        Fri, 30 Apr 2021 05:02:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 30 Apr 2021 05:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=LBzjAjyqCc1e4sP1bTKmc/cmLpW
        CamoN7o0fYtct81I=; b=awonTkN68REndsZcnpID7W38cJkTCu7OqNGccxyBOnA
        N6UZjRAyijOivshXWVXozbucAkXyceL3vhDamUMT43j421/Hk47B/ZM8q/s0dkU6
        qWDGYv5g9iFd8/Zl8amPHNyQo7aaaky+KLWvGkliUIezxvkOvhvjzdw87u8ALJFl
        Eh6IA8+FiFk/Mf1UD1+Ll4+yILXBuOyN/V4QYmj3uzWNn4wtCYnGzT+tcmWpGQkm
        ZOOcLJr6bF4jap33tllpmueikvEqCci9s30rfRdxUca9G2A1mR5Qy1aGQ+SKjLfu
        ZRc3MLcHUEZ1iFEMiIeYGodv2T9grXGuhUv4HO1GmOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LBzjAj
        yqCc1e4sP1bTKmc/cmLpWCamoN7o0fYtct81I=; b=aUblvTdZi/LTdLuSIA5sFE
        0qglvFq4opr4CjQ9js4T+DLaq0p6+eG8XV542BBByouZvL4UV4T5pvAEpG26l64W
        lmff7Lg353JjoWmM4EJlGctklM4zinz4RpwR6vdxvtJlGbnqfLjHJuK4dcDb5InK
        przkLo5v65Hm85CvSvDGyrG8M8TC5cFUL9PdipiKc+/QCEbzN50AEn8pHss4GS4o
        QFZLlMBmPWZWe3qFID9dVicbtsFmN/+9wyMWyQcV3FPXS6ESo1mblljpZ1iLZpSY
        oT5OsR8slqPjz0gdYwGE8PrhGrCsAmGk++kcH9W7M+2mW7Zp8I3MW65UuLeMP4Og
        ==
X-ME-Sender: <xms:kceLYB6QxBzqUsGVbR5h5Ajv0b0aucQ8XYjrOrDJ4NjIV5HkHEAZAw>
    <xme:kceLYO5sygDvFMMXGfCL9EkTqbejwNMYDAeUEwU2UoBsx1hLwA7sutM7Ile1CjEw9
    tUw4L1FRT6HbY_eMGI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kceLYIeN1vrMROvytKXHLHAibp_HEC-0IZm4iaDpHk3q_00oN-y_7Q>
    <xmx:kceLYKL42F89SoGFFuCpq47qv0xDeYNyS0R4LmIGHdoayVkb1Hz2rA>
    <xmx:kceLYFItX6wfmOzyzYVlPKUIj6YLlpR_hVLgAqzI6-6vgO0qEQd94g>
    <xmx:kseLYN84DhBh-2iv-NvMDB9AZAVf-xlTGX2BsAorJyuVXgBecldRLQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Fri, 30 Apr 2021 05:02:09 -0400 (EDT)
Date:   Fri, 30 Apr 2021 11:02:06 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: sun6i: Add NVMEM provider
Message-ID: <20210430090206.lybmygrt636nysoc@gilmour>
References: <20210419014549.26900-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fagotahmttw7paj5"
Content-Disposition: inline
In-Reply-To: <20210419014549.26900-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--fagotahmttw7paj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Apr 18, 2021 at 08:45:49PM -0500, Samuel Holland wrote:
> The sun6i RTC provides 32 bytes of general-purpose data registers.
> They can be used to save data in the always-on RTC power domain.
> The registers are writable via 32-bit MMIO accesses only.
>=20
> Expose the region as a NVMEM provider so it can be used by userspace and
> other drivers.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

As far as I understood, you want to use those registers to implement
super-standby? If so, while it makes sense for the kernel to be able to
be able to write to those registers, I guess it would be a bit unwise to
allow the userspace to access it?

Maxime

--fagotahmttw7paj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIvHjgAKCRDj7w1vZxhR
xTOBAP0Rfdrjnm4BacZf9DU1EbJC54KUDmMAzK50SbcJXtbhHAD/eNcNK0T9vFFg
I7pP8ZUb2A08JyqHhtYcV4WAI+g8mQw=
=2kGL
-----END PGP SIGNATURE-----

--fagotahmttw7paj5--
