Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 217AA46787
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 20:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfFNSYf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 14:24:35 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42774 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfFNSYe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 14:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=TC1DIbwZfF3TMyvcbViFGCwFe/sxI0poVP7S8t8eBkE=; b=L6PAY7gXR8eXr6P33xSeUZj+U
        yEIp9AKwS4nTSsPfdUPjwRMP48ZS7U/8yvWHno2h4fIzlKQ9aKM19v210bkKioSACeA45EYDl4+D5
        xIx3jMGWULyRK88mfuEkTVuSrFOIYGx5X60j6jbLHlAu4EnbdQzheeuxK6QcxUXRMGdDg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hbqsA-0000FE-Fg; Fri, 14 Jun 2019 18:24:22 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id CA8F3440046; Fri, 14 Jun 2019 19:24:21 +0100 (BST)
Date:   Fri, 14 Jun 2019 19:24:21 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Tony Xie <tony.xie@rock-chips.com>
Cc:     heiko@sntech.de, lee.jones@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenjh@rock-chips.com,
        xsf@rock-chips.com, zhangqing@rock-chips.com,
        huangtao@rock-chips.com
Subject: Re: [PATCH v9 3/6] regulator: rk808: add RK809 and RK817 support.
Message-ID: <20190614182421.GI5316@sirena.org.uk>
References: <20190614031425.15741-1-tony.xie@rock-chips.com>
 <20190614031425.15741-4-tony.xie@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="je2i5r69C8+2chMc"
Content-Disposition: inline
In-Reply-To: <20190614031425.15741-4-tony.xie@rock-chips.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--je2i5r69C8+2chMc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 11:14:22PM -0400, Tony Xie wrote:
>     Add support for the rk809 and rk817 regulator driver.
>     Their specifications are as follows=EF=BC=9A
>     1. The RK809 and RK809 consist of 5 DCDCs, 9 LDOs
>        and have the same registers for these components except dcdc5.
>     2. The dcdc5 is a boost dcdc for RK817 and is a buck for RK809.
>     3. The RK817 has one switch but The Rk809 has two.
>=20
>     The output voltages are configurable and are meant to supply power
>     to the main processor and other components.

Acked-by: Mark Brown <broonie@kernel.org>

--je2i5r69C8+2chMc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0D5lQACgkQJNaLcl1U
h9Cg3gf+PI+oNUSN6SISGiEj0NLwGYqM6Zuaotd0ItoKH0gSxFrTbuNhIGdsI/mN
fjDHx3QiGEsRBgKLaae3GP35+L2B7d4sUs7+ZpVC0DrldSFUQ3G6xbsez1CKm5wB
o3u5dBWZSKGHHxjJV/VH27wu6BonLndiAbFuwA/vjB2tTr7003bRMYeVDoI3uPik
o7vU+ZwFhCGUuh4TmPusYRWepB5cyGCuo9j/IX+HfWnLeVvcOlz0qtIVcr0DARzF
ZPAxMHqtm2lvyldzgU456YAA1wTVihRwRvhSyz3hAKgZLzlngjGxPrrgszbJJ05I
SUAgVqBJ/phpgaL6BBLqlGNDtUXPmg==
=Qfnw
-----END PGP SIGNATURE-----

--je2i5r69C8+2chMc--
