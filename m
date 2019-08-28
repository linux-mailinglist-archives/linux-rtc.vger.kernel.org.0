Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2BA6A001B
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2019 12:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfH1KoU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Aug 2019 06:44:20 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40706 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfH1KoT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Aug 2019 06:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9KEYKWi6mdkxqPHqKcMPIBv43kB3WI8NArLEUSNjZ90=; b=QhOBICUPXVX6i3OYn6QDtarKE
        zquKmVgCK4oEiNyZSbe0beNsb5h+vWvYf/BB0UIvn8vBFGhKF40w2b7HGdfv25LCMVEA7H/Yl9Mi6
        cdZ5lPiMMLeJNZEwcmPIpLxoiDzFDtMIXso8bLjPpgdGMBAM8asdnw3neywXnAiixPNMo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i2vQr-0003cX-25; Wed, 28 Aug 2019 10:44:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id A426F2742A55; Wed, 28 Aug 2019 11:44:03 +0100 (BST)
Date:   Wed, 28 Aug 2019 11:44:03 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v5 05/10] regulator: Add document for MT6358 regulator
Message-ID: <20190828104403.GD4298@sirena.co.uk>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-6-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline
In-Reply-To: <1566531931-9772-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Oatmeal raisin.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2019 at 11:45:26AM +0800, Hsin-Hsiung Wang wrote:

> +	pmic {
> +		compatible =3D "mediatek,mt6358";
> +
> +		mt6358regulator: mt6358regulator {
> +			compatible =3D "mediatek,mt6358-regulator";

This still lists the subnode compatible string which has been removed
=66rom the binding.

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1mWvIACgkQJNaLcl1U
h9DRhggAgRvC7U6BzuvYz9spXJ1dhssJoo4Cnc4KMXUuUQ6QoLUsAWOp6czaDVMi
2RNmm2MTbOfyXQs/lYDyEmNCxNCevItzJzxx0F1ny9EQ43yUGc/eoV1EqQB4df/j
SmqBQi1AbtM8eftJ/qtYfjGpuMgvch335oKN0YlpdsKgbT05CRlywkciokwd9D/N
+ZikuKYjDNep1358Y/axhdaeGBjwIC9YaUh9TYZ7oRE6U8H4hacfkSiCp76GYzn3
Wta9GRiHSlYxkiUgqDT7C6sqwDNfeIq68hda/2FoveacCOU9brIy8BwRC53amB95
adi4im7qPsNIUHUNKl7lgztsd8jrSw==
=HBf8
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
