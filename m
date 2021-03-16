Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDD633DB71
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 18:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbhCPRwm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 13:52:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:42826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239101AbhCPRwN (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Mar 2021 13:52:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A420065104;
        Tue, 16 Mar 2021 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615917132;
        bh=LrCfL2n1Vbvh/ZZstKFwLeSaiNZmxKeObFOpeIxy6NA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ay4zejDKIBL1jPO1i2vCSej+X0bGBaXlnSVHQdEA/pq4MFRD9BOTTaNoSNAgufJEO
         MHKz9tLyE3r06eBh90db7ZOhXpbg2teMoLPNHnINtsqO+QQPGpQmJCYo4AppfTdyOO
         nmMkg36aMDNQRtfFO5DrHvrX8l/mAlvmO37eR3mhoImV8vEVDnaWmbuxbSZ2fKQtS1
         58+EaRDrA4XLcPyj+S2myNfqyuTMSH2Qz0AGXanPh7B0TfM6oPMv0j0RTQa/f31QtU
         MBPYzZ2Wqibsz5eiFF7BRO27HAhF4QRCYrTcl+Gd9ropMxwQBNcSyx403skwglRJaO
         E47YZMOVojnRw==
Date:   Tue, 16 Mar 2021 17:52:09 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Wen Su <wen.su@mediatek.com>
Subject: Re: [PATCH v6 6/8] regulator: mt6359: Add support for MT6359
 regulator
Message-ID: <20210316175209.GC4309@sirena.org.uk>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615829757-3223-7-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline
In-Reply-To: <1615829757-3223-7-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 01:35:55AM +0800, Hsin-Hsiung Wang wrote:
> From: Wen Su <wen.su@mediatek.com>
>=20
> The MT6359 is a regulator found on boards based on MediaTek MT6779 and
> probably other SoCs. It is a so called pmic and connects as a slave to
> SoC using SPI, wrapped inside the pmic-wrapper.

Acked-by: Mark Brown <broonie@kernel.org>

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBQ8EkACgkQJNaLcl1U
h9BDswf8D316wKmXhcYKPDi/YmkRhytOAgIc6953T88rWdO3gCUFY/SK/jYWCmMR
KzzfbYbaNqqAfA/sr/MciroVnmjvxnCXxUT9Xjud5lJ0Jt+33OK3a7zg0zRx+Fot
DV/I2r5LRwRoT7r1yRu0+nHD43UuFr+G0cHnIuCDnhTfsXrohLb7LSMBo2R7i49L
hHZXlELlaCEjgJWXlc6nTkoRkfPGwTLwMXZhmnsJUwseBMbnaYNgd9T9/JFFfSWK
nDz7U8odYibHz/AhbsZpaFwJcKBEmHVr+oL65l/UR8pz9Wd2omTkWrbPN5JgrHva
lIvHg1XYtMnPuHyTJJE6hSoWNCfKIQ==
=14Z0
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
