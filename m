Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFBC9AA28
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 10:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405204AbfHWITY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 04:19:24 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:35197 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbfHWITX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Aug 2019 04:19:23 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8809F60007;
        Fri, 23 Aug 2019 08:19:20 +0000 (UTC)
Date:   Fri, 23 Aug 2019 10:19:20 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     megous@megous.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 3/3] arm64: dts: sun50i-h6: Add support for RTC and
 fix the clock tree
Message-ID: <20190823081920.xxqg6w7tlnvvkzlx@flea>
References: <20190820151934.3860-1-megous@megous.com>
 <20190820151934.3860-4-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bvvuqig3adpl6wgr"
Content-Disposition: inline
In-Reply-To: <20190820151934.3860-4-megous@megous.com>
User-Agent: NeoMutt/20180716
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--bvvuqig3adpl6wgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2019 at 05:19:34PM +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
>
> This patch adds RTC node and fixes the clock properties and nodes
> to reflect the real clock tree.
>
> The device nodes for the internal oscillator and osc32k are removed,
> as these clocks are now provided by the RTC device. Clock references
> are fixed accordingly, too.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

The prefix should be "arm64: dts: allwinner: h6:"

I've fixed it up and applied it.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--bvvuqig3adpl6wgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV+hiAAKCRDj7w1vZxhR
xQlxAP9kdMuf4hAYTBGWFaQzFVjFmqRMRi1y/pCcJ+PHKLK3TAD8DZOSzZhHJZFE
oscKRT3ZVaryNY1pphYVt0LlyyDu2Q0=
=Ngr3
-----END PGP SIGNATURE-----

--bvvuqig3adpl6wgr--
