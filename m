Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7171815D39F
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2020 09:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgBNIOr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Feb 2020 03:14:47 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:32889 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728864AbgBNIOr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Feb 2020 03:14:47 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 698522209B;
        Fri, 14 Feb 2020 03:14:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 03:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=DO1qB7EF03XbHYcM+MQop+UEcOT
        t18HnhzTS5Ovdc4M=; b=kNOjQxVZhVfgcp+iqhb6aDnFZ/JegypifI4ezoWQtuZ
        z2Ul5v1Kz08bX2Elyz2KGBv9w1Al76i1mt6iBcIF4ifj4wThv6E2xZcT9Sl8zT55
        oxgalW9xsjRlmFoBNTfMkgha11NjLgTHP8XQR1MYmZAROPw/jZ2/7olVS5qinq+E
        2x/U18ZHiVqdv1EdO/0QI2m+fullcKa56lAYlEmm0/rmq3OgoFPv0/qf2mD94mhK
        W1R+fH+fVqPtRTiZv9dTeaVjpN39y54UDQpT6yVxNbyEW8Vp7W/8OOJjmptANBIO
        ZJQHzKgsRvxxWbLlvXRA026yRkCXs4j7B5/0eXNHloQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DO1qB7
        EF03XbHYcM+MQop+UEcOTt18HnhzTS5Ovdc4M=; b=vKAisGVD5dqKM7X6hG5Wdf
        gOe6cyx91Qjmo8YGkc8Ql6GAZJEfakYX6Ta85WrMRatSLebAOwJt5WYZiZyTB769
        FHzozMJ5c33IIV64LR5P0iCzJNUpAGQo7VaOVqDNzds5LifEkw0hqxdaPPo6uiR0
        zm6YXnLf4OwGa/K4Z+UX8xucVGqDRBcF2cem8dSXq/MjTssPW6TrVV67BR506urx
        hRYc0q8KAks7ZtaW/gXtOjN4s+WgQu+6fsNpnmco5z802vDPp624nD7V4Ug8b6eB
        93gl8dlm+2chh6dpZIgl+TK55m1MFNjfqLoPRGNC8phHqBiBpdjcDcafpUgVEUmw
        ==
X-ME-Sender: <xms:9VZGXsPA5af8xY7aiEojvDXfnfXMf-8CbgGHJ4ku6cOx5-ghsTPwcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieelgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9VZGXsBaONtsZfOvtIHuH_5yKiDOoL0caaLG49vkJIprvPdlg1Q9zQ>
    <xmx:9VZGXmM6KBRF1IsSKO9UkEoY9bUh90PGu_TDlj8p_zynolIzCzTZ4Q>
    <xmx:9VZGXhzeh8k26vwac0stegTUDevHYGXll46f1GDuViz5NbtO5g5VKA>
    <xmx:9lZGXv-Xr4IdbcvbAnpBBJj3hcwZmqn48Lbr0mC07E8KSbE77Lz9Fg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id CE77B3280062;
        Fri, 14 Feb 2020 03:14:44 -0500 (EST)
Date:   Fri, 14 Feb 2020 09:14:43 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: sun6i: Make external 32k oscillator optional
Message-ID: <20200214081443.ajz2sxh5ztk6qb2i@gilmour.lan>
References: <20200213211427.33004-1-jernej.skrabec@siol.net>
 <20200213211427.33004-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gd4hk6lpwgqc6ffi"
Content-Disposition: inline
In-Reply-To: <20200213211427.33004-2-jernej.skrabec@siol.net>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--gd4hk6lpwgqc6ffi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jernej,

Thanks for taking care of this

On Thu, Feb 13, 2020 at 10:14:26PM +0100, Jernej Skrabec wrote:
> Some boards, like OrangePi PC2 (H5), OrangePi Plus 2E (H3) and Tanix TX6
> (H6) don't have external 32kHz oscillator. Till H6, it didn't really
> matter if external oscillator was enabled because HW detected error and
> fall back to internal one. H6 has same functionality but it's the first
> SoC which have "auto switch bypass" bit documented and always enabled in
> driver. This prevents RTC to work correctly if external crystal is not
> present on board. There are other side effects - all peripherals which
> depends on this clock also don't work (HDMI CEC for example).
>
> Make clocks property optional. If it is present, select external
> oscillator. If not, stay on internal.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/rtc/rtc-sun6i.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 852f5f3b3592..538cf7e19034 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -250,19 +250,17 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>  		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
>  	}
>
> -	/* Switch to the external, more precise, oscillator */
> -	reg |= SUN6I_LOSC_CTRL_EXT_OSC;
> -	if (rtc->data->has_losc_en)
> -		reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> +	/* Switch to the external, more precise, oscillator, if present */
> +	if (of_get_property(node, "clocks", NULL)) {
> +		reg |= SUN6I_LOSC_CTRL_EXT_OSC;
> +		if (rtc->data->has_losc_en)
> +			reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> +	}
>  	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
>
>  	/* Yes, I know, this is ugly. */
>  	sun6i_rtc = rtc;
>
> -	/* Deal with old DTs */
> -	if (!of_get_property(node, "clocks", NULL))
> -		goto err;
> -

Doesn't that prevent the parents to be properly set if there's an
external crystal?

Maxime

--gd4hk6lpwgqc6ffi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkZW8wAKCRDj7w1vZxhR
xT/JAQCebsgcgBInF+PMbD9/OQ+obICfwPn2F6YKc8wH6LbTwAEAzCHajFqwpLR0
m/VD6Vn5K5n5k503UZ48Ap0B4ro5cwc=
=A1UQ
-----END PGP SIGNATURE-----

--gd4hk6lpwgqc6ffi--
